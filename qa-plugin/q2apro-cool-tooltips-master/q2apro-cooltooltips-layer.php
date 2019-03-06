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

	class qa_html_theme_layer extends qa_html_theme_base {
		
		function head_script(){
			qa_html_theme_base::head_script();
			if(qa_opt('q2apro_cooltooltips_enabled') && !qa_is_mobile_probably()) {
				$this->output('<script type="text/javascript" src="'.QA_HTML_THEME_LAYER_URLTOROOT.'script.js"></script>');  
			}
		}
		
	} // end qa_html_theme_layer
	

/*
	Omit PHP closing tag to help avoid accidental output
*/