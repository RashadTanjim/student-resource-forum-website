<?php

/*
	Plugin Name: Cool Tooltips
	Plugin URI: http://www.q2apro.com/plugins/cool-tooltips
	Plugin Description: Transforms all your tooltips into nice black semi-transparent rounded boxes
	Plugin Version: 1.0
	Plugin Date: 2014-02-18
	Plugin Author: q2apro.com
	Plugin Author URI: http://www.q2apro.com
	Plugin Minimumstudentrf Version: 1.5
	Plugin Update Check URI: http://www.q2apro.com/pluginupdate?id=54
	
	Licence: Copyright © q2apro.com - All rights reserved

*/

	if (!defined('QA_VERSION')) { // don't allow this page to be requested directly from browser
		header('Location: ../../');
		exit;
	}

	// language file
	qa_register_plugin_phrases('q2apro-cooltooltips-lang-*.php', 'q2apro_cooltooltips_lang');

	// layer
	qa_register_plugin_layer('q2apro-cooltooltips-layer.php', 'Cool Tooltips Layer');

	// admin
	qa_register_plugin_module('module', 'q2apro-cooltooltips-admin.php', 'q2apro_cooltooltips_admin', 'Cool Tooltips Admin');
        

/*
	Omit PHP closing tag to help avoid accidental output
*/