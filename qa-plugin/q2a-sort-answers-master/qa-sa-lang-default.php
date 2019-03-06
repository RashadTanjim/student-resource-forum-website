<?php

/*
 studentrf (c) Gideon Greenspan
  Q2A Sort Answers (c) Amiya Sahu (developer.amiya@outlook.com)
  http://www.question2answer.org/
  
  File: qa-plugin/q2a-sort-answers/qa-sa-lang-default.php
  Version: See define()s at top of qa-include/qa-base.php

  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License
  as published by the Free Software Foundation; either version 2
  of the License, or (at your option) any later version.
  
  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
  More about this license: http://www.question2answer.org/license.php
  
*/

if (!defined('QA_VERSION')) { // don't allow this page to be requested directly from browser
	header('Location: ../../');
	exit;
}

return array(
	/*languages for admin panel*/
	'enable_plugin'       => 'Enable this plugin ' ,
	'order_answers_by'    => 'Order answers by' ,
	'oldest'              => 'Oldest ' ,
	'oldest_title'        => 'Sort by Oldest answer on the current page' ,
	'latest'              => 'Latest ' ,
	'latest_title'        => 'Sort by Latest answer on the current page' ,
	'highest_votes'       => 'Highest Votes' ,
	'highest_votes_title' => 'Sort by Highest Voted answers on current page ' ,
);

/*
	Omit PHP closing tag to help avoid accidental output
*/