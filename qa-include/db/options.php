<?php
/*
	studentrf by studentrf and contributors
	http://www.studentrf.rf.gd/

	Description: Database-level access to table containing admin options


	This program is free software; you can redistribute it and/or
	modify it under the terms of the GNU General Public License
	as published by the Free Software Foundation; either version 2
	of the License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	More about this license: http://www.studentrf.rf.gd/license.php
*/

if (!defined('QA_VERSION')) { // don't allow this page to be requested directly from browser
	header('Location: ../../');
	exit;
}


/**
 * Set option $name to $value in the database
 * @param $name
 * @param $value
 */
function qa_db_set_option($name, $value)
{
	qa_db_query_sub(
		'INSERT INTO ^options (title, content) VALUES ($, $) ' .
		'ON DUPLICATE KEY UPDATE content = VALUES(content)',
		$name, $value
	);
}
