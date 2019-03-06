<?php

class qa_tupm_page {

	// initialize db-table 'userscores' if it does not exist yet
	function init_queries($tableslc) {
		$queries = array();
		$tablename=qa_db_add_table_prefix('monthlytoppers');
		$new = false;
		$tablename1=qa_db_add_table_prefix('userscores');
		$tablename2=qa_db_add_table_prefix('userpoints');
		if(!in_array($tablename, $tableslc)) {
			$new = true;
			$queries[] = "CREATE TABLE IF NOT EXISTS `".$tablename."` (
				`date` date NOT NULL,
				`userid` int(10) unsigned NOT NULL,
				`points` int(11) NOT NULL DEFAULT '0',
				KEY `userid` (`userid`),
				KEY `date` (`date`),
				PRIMARY KEY(userid, date)
					)
					";
		}
		if(!in_array($tablename1, $tableslc)) {
			$queries[] = "CREATE TABLE IF NOT EXISTS `".$tablename1."` (
				`date` date NOT NULL,
				`userid` int(10) unsigned NOT NULL,
				`points` int(11) NOT NULL DEFAULT '0',
				KEY `userid` (`userid`),
				KEY `date` (`date`),
				PRIMARY KEY(userid, date)
					)
					";
				$queries[] = "insert into  ".$tablename1." (userid, points, date) select userid, points, CURDATE() as date from ".$tablename2." order by userid asc";
		}
		else if($new){
			$select = "select min(date) as date from ^userscores";
			$result = qa_db_query_sub($select);
			$mindate = qa_db_read_one_value($result);
			$mdate = strtotime($mindate); 
			$select = "select max(date) as date from ^userscores";
			$result = qa_db_query_sub($select);
			$maxdate = qa_db_read_one_value($result);
			$mxdate = strtotime($maxdate);
			while($mdate < $mxdate){
				$insert = "insert into ".$tablename." (date, userid, points) select a.date, a.userid, b.points - COALESCE(a.points,0) AS mpoints from ".$tablename1." a, ".$tablename1." b where a.userid = b.userid and a.date = '".date("Y-m-d", $mdate)."' and b.date between (a.date + interval 1 day) and (a.date + interval 59 day)  group by a.userid,a.points,b.points  having mpoints>0";
				$queries[] = $insert;
				$select = "select min(date) as date from ^userscores where date > '".date("Y-m-d", $mdate)."'";
				$result = qa_db_query_sub($select);
				$mindate = qa_db_read_one_value($result);
				$mdate = strtotime($mindate); 

			} 
		}
		$eventname=qa_db_add_table_prefix('tupmevent');
		$events = qa_db_read_one_value(qa_db_query_raw("show events where name like '$eventname'"), true);

		if(!$events){
			$queries[] = "CREATE EVENT if not exists $eventname
				ON SCHEDULE EVERY 1 MONTH 
				starts	concat(str_to_date ( concat(concat(DATE_FORMAT(NOW(), '%Y'),month(NOW() + interval 1 month)),\"-1\"), '%Y%m-%d'), ' 00:00:00')
				DO
				BEGIN
				insert into  ".$tablename1." (userid, points, date) select userid, points, CURDATE() as date from ".$tablename2." order by userid asc;
			insert into ".$tablename." (date, userid, points) select CURDATE() - interval 1 month as date, a.userid, a.points - COALESCE(b.points,0) AS mpoints from ".$tablename1." a, ".$tablename1." b where a.userid = b.userid and a.date = CURDATE() and b.date between (a.date - interval 35 day) and (a.date - interval 25 day)  group by a.userid,a.points,b.points  having mpoints>0;

			END ";
		}
		if(qa_opt('qa-tupm-weekly-enable'))
		{
			$tablename=qa_db_add_table_prefix('weeklytoppers');
			if(!in_array($tablename, $tableslc)) {
				$queries[] = "CREATE TABLE IF NOT EXISTS `".$tablename."` (
					`date` date NOT NULL,
					`userid` int(10) unsigned NOT NULL,
					`points` int(11) NOT NULL DEFAULT '0',
					KEY `userid` (`userid`),
					KEY `date` (`date`)
						)
						";
			}
			$tablename1=qa_db_add_table_prefix('userscores_weekly');
			if(!in_array($tablename1, $tableslc)) {
				$queries[]= "CREATE TABLE IF NOT EXISTS `".$tablename1."` (
					`date` date NOT NULL,
					`userid` int(10) unsigned NOT NULL,
					`points` int(11) NOT NULL DEFAULT '0',
					KEY `userid` (`userid`),
					KEY `date` (`date`)
						)
						";
				$queries[] = "insert into  ".$tablename1." (userid, points, date) select userid, points, CURDATE() as date from ".$tablename2." order by userid asc";
			}
			$eventname=qa_db_add_table_prefix('tupmweeklyevent');
			$events = qa_db_read_one_value(qa_db_query_raw("show events where name like '$eventname'"), true);
			if(!$events){
				$queries[] = "CREATE EVENT if not exists $eventname
					ON SCHEDULE EVERY 1 WEEK
					starts concat(str_to_date(concat(yearweek(NOW() + interval 1 week), 'Monday'), '%X%V %W'), ' 00:00:00')
					DO
					BEGIN
					insert into  ".$tablename1." (userid, points, date) select userid, points, CURDATE() as date from ".$tablename2." order by userid asc;
				insert into ".$tablename." (date, userid, points) select CURDATE() - interval 1 week as date, a.userid, a.points - COALESCE(b.points,0) AS mpoints from ".$tablename1." a, ".$tablename1." b where a.userid = b.userid and a.date = CURDATE() and b.date between (a.date - interval 10 day) and (a.date - interval 4 day)  group by a.userid,a.points,b.points  having mpoints>0;

				END ";
			}
		}
		return $queries;
	}

	var $directory;
	var $urltoroot;

	function load_module($directory, $urltoroot)
	{
		$this->directory=$directory;
		$this->urltoroot=$urltoroot;
	}

	// for display in admin interface under admin/pages
	function suggest_requests() 
	{	
		return array(
				array(
					'title' => 'Top Users per Month Page', // title of page
					'request' => 'topusers', // request name
					'nav' => 'M', // 'M'=main, 'F'=footer, 'B'=before main, 'O'=opposite main, null=none
				     ),
			    );
	}

	// for url query
	function match_request($request)
	{
		if ($request=='topusers') {
			return true;
		}

		return false;
	}

	function process_request($request)
	{
		$maxusers = qa_opt('qa-tupm-page-count');
		$hideadmin = qa_opt('qa-tupm-hide-admin');
		$hidepoints = qa_opt('qa-tupm-hide-points');
		$showReward = qa_opt('qa-tupm-reward-enable');



		$lang_page_title = qa_lang_html('qa_tupm_lang/page_title');
		$lang_choose_month = qa_lang_html('qa_tupm_lang/choose_month');
		$lang_top_users = qa_lang_html('qa_tupm_lang/top_users');
		$pointsLang =  qa_lang_html('qa_tupm_lang/points');

		if($showReward){
			$showRewardOnTop = '<p>' .qa_opt('qa-tupm-reward-html') . "</p>";
		}



		/* start */
		$qa_content=qa_content_prepare();

		$qa_content['navigation']['sub']=qa_users_sub_navigation();

		$qa_content['title'] = $lang_page_title; // list title

		// counter for custom html output
		$c = 2;


		// get first month to show in dropdown list (e.g. 10/2012)
		$firstListDate = '2012-10-01'; // default
		$queryFirstDate = qa_db_query_sub("SELECT `date` FROM `^userscores` ORDER BY `date` ASC LIMIT 1;"); 
		while ( ($row = qa_db_read_one_assoc($queryFirstDate,true)) !== null ) {
			$firstListDate = $row['date'];
			break;
		}


		// last entry of dropdown list
		// -1 month, to also show the "first point interval" from all 0 userscores to all first saved userscores
		$firstListDate = date("Y-m-01", strtotime($firstListDate."-1 month") );

		// first entry of dropdown list
		$lastListDate = date("Y-m-01");
		// if you want last month as default use
		// $lastListDate = date("Y-m-01", strtotime("last month") );

		// this month as default
		$chosenMonth = date("Y-m-01");
		// if you want last month as default use
		// $chosenMonth = date("Y-m", strtotime("last month") ); 

		// we received post data, user has chosen a month
		if( qa_post_text('request') ) {
			$chosenMonth = qa_post_text('request');
			// sanitize string, keep only 0-9 and - (maybe I am to suspicious?)
			$chosenMonth = preg_replace("/[^0-9\-]/i", '', $chosenMonth);
		}

		// get interval start from chosen month
		$intervalStart = date("Y-m-01", strtotime($chosenMonth) ); // 05/2012 becomes 2012-05-01
		$intervalEnd = date("Y-m-01", strtotime($chosenMonth."+1 month") ); // 05/2012 becomes 2012-06-01


		$dropdown_options=array();

		// list all available months in array
		foreach(get_year_months($firstListDate, $lastListDate) as $value){
			// array index is <option value> (see html), saved string is label, e.g. $dropdown_options['2012-05-01'] = "month";
			$dropdown_options[$value] = date("M Y", strtotime($value) );
		}
		// sort so that latest month is on top
		krsort($dropdown_options);


		// output reward on top
		if($showReward) {
			$qa_content['custom'.++$c] = $showRewardOnTop;
		}

		// output dropdown form for choosing the months
		$qa_content['form']=array(
				'tags' => 'METHOD="POST" ACTION="'.qa_self_html().'"',

				'style' => 'basic', // options: light, wide, tall, basic


				'fields' => array(
					'request' => array(
						'id' => 'dropdown', 
						'label' => $lang_choose_month, 
						'tags' => 'NAME="request" onchange="this.form.submit()" id="dropdown_select"',
						'type' => 'select',
						'options' => $dropdown_options,
						),
					),


				);

		$suffix = " us1.userid not in (select userid from ^users where flags & ".QA_USER_FLAGS_USER_BLOCKED." = 1";

		if($hideadmin){
			$suffix .=" or level >= ".QA_USER_LEVEL_ADMIN;
		}
		$suffix .=")";
		// we need to do another query to get the userscores of the recent month
		if($chosenMonth == date("Y-m-01") ) {
			// calculate userscores from recent month

			$queryRecentScores = qa_db_query_sub("SELECT up1.userid, up1.points - COALESCE(us1.points,0) AS mpoints 
					FROM `^userpoints` up1
					LEFT JOIN `^userscores` us1 on up1.userid=us1.userid
					AND DATE_FORMAT(us1.date,'%Y') like '".date("Y")."' 
					AND DATE_FORMAT(us1.date,'%m') like '".date("m")."'  
					WHERE 
					".$suffix.
					" ORDER BY mpoints DESC limit ".$maxusers.";"
					);
		}
		else {
			// calculate userscores for given month
			$queryRecentScores = qa_db_query_sub("
					SELECT us1.userid, 
					us1.points - COALESCE(us2.points, 0) AS mpoints 
					FROM `^userscores` us1 
					LEFT JOIN (SELECT userid, points FROM `^userscores` WHERE `date` = '".$intervalStart."') AS us2
					ON us1.userid = us2.userid
					WHERE us1.date = '".$intervalEnd."' and
					".$suffix.
					" ORDER BY mpoints DESC limit ".$maxusers.";"
					);
		}
		// save all userscores in array $scores
		$scores = array();
		while ( ($row = qa_db_read_one_assoc($queryRecentScores,true)) !== null ) {
			$scores[] = $row;
		}
		$topusers = "<ol>";

		foreach ($scores as $user) {
			// no users with 0 points
			$userId = $user['userid'];
			$val = $user['mpoints'];
			if($val>0) {
				$user = qa_db_select_with_pending( qa_db_user_account_selectspec($userId, true) );
				$topusers .= "<li>" . qa_get_user_avatar_html($user['flags'], $user['email'], $user['handle'], $user['avatarblobid'], $user['avatarwidth'], $user['avatarheight'], qa_opt('avatar_users_size'), true) . "<span class='topusers-span'> " . qa_get_one_user_html($user['handle'], false);
				if(!$hidepoints)
					$topusers .=' <p class="uscore">'.$val.' '.$pointsLang.'</p></span></li>
						';
			}
		}
		$topusers .= "</ol>";


		/* output into theme */
		$qa_content['custom']='<div class="topusers topusers-page">';

		// convert date to display m/Y, 2 digit month and 4 digit year
		$monthName = date("M Y", strtotime($chosenMonth) );

		$qa_content['custom'].='<div class="tupm-title">'.$lang_top_users.' '.$monthName.'</div>'; 
		$qa_content['custom'].= $topusers;

		$qa_content['custom'].='</div>';


		// jquery workaround (or call it hack) to select the current month in dropdown
		$qa_content['custom'.++$c] = ' <script type="text/javascript">$(document).ready(function(){  $("select#dropdown_select").val(\''.$intervalStart.'\') }); </script>';




		return $qa_content;
	}

};


/*
   Omit PHP closing tag to help avoid accidental output
 */
