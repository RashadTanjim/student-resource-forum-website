<?php

class qa_tupm_weekly_widget {
	
	function allow_template($template)
	{
		return true;
	}
	
	function allow_region($region)
	{
		return ($region == 'side');
	}

	function output_widget($region, $place, $themeobject, $template, $request, $qa_content)
	{
		$maxusers = qa_opt('qa-tupm-weekly-widget-count');
		$hideadmin = qa_opt('qa-tupm-weekly-hide-admin');			
		$showReward = qa_opt('qa-tupm-weekly-reward-enable');
	$hidepoints = qa_opt('qa-tupm-weekly-hide-points');	
		$langActUsers = qa_lang_html('qa_tupm_lang/top_users');
		$pointsLang = qa_lang_html('qa_tupm_lang/points'); 			
		$rewardHtml = qa_opt('qa-tupm-reward-html');
		$suffix = " ^userpoints.userid not in (select userid from ^users where flags & ".QA_USER_FLAGS_USER_BLOCKED." = 1";
		if($hideadmin){
			$suffix .=" or level >= ".QA_USER_LEVEL_ADMIN;
		}
		$suffix .=")";
		$queryRecentScores = qa_db_query_sub("SELECT ^userpoints.userid, ^userpoints.points - COALESCE(^userscores_weekly.points,0) AS mpoints 
								FROM `^userpoints`
								LEFT JOIN `^userscores_weekly` on ^userpoints.userid=^userscores_weekly.userid
                                                                        AND DATE_FORMAT(^userscores_weekly.date,'%u') like '".date("W")."'  
			
								WHERE 
								".$suffix.
								" ORDER BY mpoints DESC, ^userpoints.userid DESC limit ".$maxusers.";"
								);
		
		// save all userscores in array $scores
		$scores = array();
		while ( ($row = qa_db_read_one_assoc($queryRecentScores,true)) !== null ) {
			$scores[] = $row;
		}

		$topusers = "<ol>";
		$nrUsers = 0;
		
		foreach ($scores as $user) {
			// no users with 0 points
			$userId = $user['userid'];
			$val = $user['mpoints'];
			if($val>0) {
				$user = qa_db_select_with_pending( qa_db_user_account_selectspec($userId, true) );
					$topusers .= "<li>" . qa_get_user_avatar_html($user['flags'], $user['email'], $user['handle'], $user['avatarblobid'], $user['avatarwidth'], $user['avatarheight'], qa_opt('avatar_users_size'), true) . "<span class=\"topusers-span\">" . qa_get_one_user_html($user['handle'], false);
				 if(!$hidepoints)
                                        $topusers .=' <p class="uscore">'.$val.' '.$pointsLang.'</p></span></li>
					';
			}
		}
		$topusers .= "</ol>";

		// output into theme
		$themeobject->output('<div class="topusers">');
		
		// if you want the month displayed in your language uncomment the following block, 
		// and comment out the line: $monthName = date('M Y'); 
		// you have to define your language code as well, e.g. en_US, fr_FR, de_DE
		/* 
		$localcode = "de_DE"; 
		setlocale (LC_TIME, $localcode); 
		$monthName = strftime("%B %G", strtotime( date('F')) ); // %B for full month name, %b for abbreviation
		*/
		$week = getStartAndEndDate(date('W'),date('Y'));
		$weekName = $week['week_start']." - ".$week['week_end']; 
		
		$themeobject->output('<div class="qa-widget-title tupm-title"><a href="'.qa_path('topusers').'">'.$langActUsers.'</a> <span class="qa-widget-span">'.$weekName.'</span></div>'); 
		$themeobject->output( $topusers );
		
		// display reward info
		if($showReward) {
			$themeobject->output( $rewardHtml );
		}
		$themeobject->output('</div>');
	}

}

/*
	Omit PHP closing tag to help avoid accidental output
*/
