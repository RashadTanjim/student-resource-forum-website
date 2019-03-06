<?php

/*
	Plugin Name: Simple Slider
	Plugin URI: https://github.com/Jacksiro/Q2A-Simple-Slider
	Plugin Description: A simple homepage slider widghet
	Plugin Version: 1.1
	Plugin Date: 2017-05-10
	Plugin Author: Jackson Siro
	Plugin Author URI: https://github.com/jacksiro/
	Plugin License: GPLv3+
	Plugin Minimum AppSmata Version: 1.6
	Plugin Update Check URI: https://github.com/Jacksiro/Q2A-Simple-Slider/master/qa-plugin.php
*/


	if (!defined('AS_VERSION')) { // don't allow this page to be requested directly from browser
		header('Location: ../../');
		exit;
	}

	as_register_plugin_phrases('simple-slider-lang-*.php', 'ss_lang');
	as_register_plugin_layer('simple-slider-layer.php', 'Simple Slider Layer');
	as_register_plugin_module('widget', 'simple-slider.php', 'simple_slider', 'Simple Slider');
	

/*
	Omit PHP closing tag to help avoid accidental output
*/