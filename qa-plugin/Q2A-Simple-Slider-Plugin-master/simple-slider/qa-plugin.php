<?php

/*
	Plugin Name: Simple Slider
	Plugin URI: https://github.com/Jacksiro/Q2A-Simple-Slider-Plugin
	Plugin Description: A simple image slider for the tops of pages, showing titles, descriptions and links.
	Plugin Version: 1.1
	Plugin Date: 2017-05-10
	Plugin Author: Jackson Siro
	Plugin Author URI: https://github.com/jacksiro/
	Plugin License: GPLv3+
	Plugin Minimumstudentrf Version: 1.6
	Plugin Update Check URI: https://github.com/Jacksiro/Q2A-Simple-Slider-Plugin/master/qa-plugin.php
*/


	if (!defined('QA_VERSION')) { // don't allow this page to be requested directly from browser
		header('Location: ../../');
		exit;
	}

	qa_register_plugin_phrases('simple-slider-lang-*.php', 'ss_lang');
	qa_register_plugin_layer('simple-slider-layer.php', 'Simple Slider Layer');
	qa_register_plugin_module('widget', 'simple-slider.php', 'simple_slider', 'Simple Slider');
	

/*
	Omit PHP closing tag to help avoid accidental output
*/
