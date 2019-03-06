<?php

if (!defined('QA_VERSION')) {
	header('Location: ../../');
	exit;
}

/*
// Register file to override the functions
// present in the file
*/
qa_register_plugin_layer('qa-social-share-layer.php', 'Q2A Social Share layer');

qa_register_plugin_overrides('qa-ss-process-event-override.php');

qa_register_plugin_module('module', 'qa-social-share-admin.php', 'qa_ss_admin', 'Q2A Social Share Configuration');
