-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2018 at 09:45 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_forum`
--


-- --------------------------------------------------------

--
-- Table structure for table `qa_blobs`
--

CREATE TABLE `qa_blobs` (
  `blobid` bigint(20) UNSIGNED NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `content` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_cache`
--

CREATE TABLE `qa_cache` (
  `type` char(8) CHARACTER SET ascii NOT NULL,
  `cacheid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `content` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `lastread` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_categories`
--

CREATE TABLE `qa_categories` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` smallint(5) UNSIGNED NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_categorymetas`
--

CREATE TABLE `qa_categorymetas` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_chat_kicks`
--

CREATE TABLE `qa_chat_kicks` (
  `userid` int(10) UNSIGNED NOT NULL,
  `kickedby` int(10) UNSIGNED NOT NULL,
  `whenkicked` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_chat_posts`
--

CREATE TABLE `qa_chat_posts` (
  `postid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `posted` datetime NOT NULL,
  `message` varchar(800) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_chat_users`
--

CREATE TABLE `qa_chat_users` (
  `userid` int(10) UNSIGNED NOT NULL,
  `lastposted` datetime NOT NULL,
  `lastpolled` datetime NOT NULL,
  `kickeduntil` datetime NOT NULL DEFAULT '2012-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_contentwords`
--

CREATE TABLE `qa_contentwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `count` tinyint(3) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_cookies`
--

CREATE TABLE `qa_cookies` (
  `cookieid` bigint(20) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `createip` varbinary(16) NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` varbinary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_iplimits`
--

CREATE TABLE `qa_iplimits` (
  `ip` varbinary(16) NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_iplimits`
--

INSERT INTO `qa_iplimits` (`ip`, `action`, `period`, `count`) VALUES
(0x00000000000000000000000000000001, 'L', 428852, 2),
(0x00000000000000000000000000000001, 'Q', 428852, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_messages`
--

CREATE TABLE `qa_messages` (
  `messageid` int(10) UNSIGNED NOT NULL,
  `type` enum('PUBLIC','PRIVATE') NOT NULL DEFAULT 'PRIVATE',
  `fromuserid` int(10) UNSIGNED DEFAULT NULL,
  `touserid` int(10) UNSIGNED DEFAULT NULL,
  `fromhidden` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `tohidden` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `content` varchar(12000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_monthlytoppers`
--

CREATE TABLE `qa_monthlytoppers` (
  `date` date NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qa_options`
--

CREATE TABLE `qa_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(12000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_options`
--

INSERT INTO `qa_options` (`title`, `content`) VALUES
('allow_anonymous_naming', '1'),
('allow_change_usernames', '1'),
('allow_close_own_questions', '1'),
('allow_close_questions', '1'),
('allow_login_email_only', ''),
('allow_multi_answers', '1'),
('allow_private_messages', '1'),
('allow_self_answer', '1'),
('allow_user_walls', '1'),
('allow_view_q_bots', '1'),
('ami_sa_enabled', '1'),
('avatar_allow_gravatar', '1'),
('avatar_allow_upload', '1'),
('avatar_default_blobid', ''),
('avatar_default_height', ''),
('avatar_default_show', ''),
('avatar_default_width', ''),
('avatar_message_list_size', '20'),
('avatar_profile_size', '200'),
('avatar_q_list_size', '0'),
('avatar_q_page_a_size', '40'),
('avatar_q_page_c_size', '20'),
('avatar_q_page_q_size', '50'),
('avatar_store_size', '400'),
('avatar_users_size', '30'),
('block_bad_usernames', 'anonymous'),
('block_bad_words', ''),
('block_ips_write', ''),
('bookmarks_plugin_enable', ''),
('cache_acount', ''),
('cache_ccount', ''),
('cache_flaggedcount', ''),
('cache_qcount', '1'),
('cache_queuedcount', ''),
('cache_tagcount', '1'),
('cache_uapprovecount', '0'),
('cache_unaqcount', '1'),
('cache_unselqcount', '1'),
('cache_unupaqcount', '1'),
('cache_userpointscount', '1'),
('caching_catwidget_time', '30'),
('caching_driver', 'filesystem'),
('caching_enabled', '0'),
('caching_q_start', '7'),
('caching_q_time', '30'),
('captcha_module', ''),
('captcha_on_anon_post', '1'),
('chat_active', '1'),
('columns_tags', '3'),
('columns_users', '2'),
('comment_on_as', '1'),
('comment_on_qs', '0'),
('confirm_user_emails', '1'),
('custom_answer', ''),
('custom_ask', ''),
('custom_comment', ''),
('custom_footer', ''),
('custom_header', ''),
('custom_home_content', ''),
('custom_home_heading', ''),
('custom_in_head', ''),
('custom_register', ''),
('custom_sidepanel', ''),
('custom_welcome', ''),
('db_version', '67'),
('donut_activate_prod_mode', '0'),
('donut_banner_closable', '0'),
('donut_banner_div1_icon', 'fa fa-search-plus'),
('donut_banner_div1_text', 'Search answers for all your queries'),
('donut_banner_div2_icon', 'fa fa-question-circle'),
('donut_banner_div2_text', 'One destination for all your queries'),
('donut_banner_div3_icon', 'fa fa-check-square-o'),
('donut_banner_div3_text', 'Get answers from the experts'),
('donut_banner_head_text', 'Student discussion forum'),
('donut_banner_show_ask_box', '1'),
('donut_copyright_text', 'Donut theme'),
('donut_curr_db_version', '1'),
('donut_custom_404_text', ''),
('donut_defaults_set_ok', '1'),
('donut_email_address', ''),
('donut_enable_back_to_top_btn', '1'),
('donut_enable_sticky_header', '1'),
('donut_enable_top_bar', '1'),
('donut_facebook_url', 'facebook.com/studentresourceforum'),
('donut_footer_settings_notice', ''),
('donut_general_settings_notice', ''),
('donut_google-plus_url', ''),
('donut_homepage_settings_notice', ''),
('donut_pinterest_url', ''),
('donut_show_breadcrumbs', '1'),
('donut_show_collapsible_btns', '1'),
('donut_show_copyright_at_footer', '0'),
('donut_show_custom_404_page', '0'),
('donut_show_home_page_banner', '1'),
('donut_show_site_stats_above_footer', '1'),
('donut_show_social_links_at_footer', '1'),
('donut_show_top_social_icons', '1'),
('donut_social_settings_notice', ''),
('donut_top_bar_left_text', 'Student Resource Forum'),
('donut_top_bar_right_text', 'Ask us anything'),
('donut_twitter_url', ''),
('donut_use_local_font', '1'),
('donut_vk_url', ''),
('do_ask_check_qs', '0'),
('do_close_on_select', ''),
('do_complete_tags', '1'),
('do_count_q_views', '1'),
('do_example_tags', '1'),
('editor_for_as', 'WYSIWYG Editor'),
('editor_for_cs', ''),
('editor_for_qs', 'WYSIWYG Editor'),
('enabled_plugins', 'Donut-admin;event-logger;facebook-login;mouseover-layer;opensearch-support;q2a-bookmarks-master;q2a-chat-room-master;q2a-comment-voting-master;q2a-facebook-like-box-master;q2a-open-login-master;q2a-social-share-plugin-master;q2a-sort-answers-master;q2a-topusers-per-month-master;q2a-widget-anywhere-master;q2apro-cool-tooltips-master;tag-cloud-widget;wysiwyg-editor'),
('event_logger_to_database', ''),
('event_logger_to_files', ''),
('extra_field_active', ''),
('extra_field_display', ''),
('extra_field_label', ''),
('extra_field_prompt', ''),
('facebook_app_id', ''),
('feedback_email', 'arnob.tanjim@gmail.com'),
('feedback_enabled', '1'),
('feed_for_activity', '0'),
('feed_for_hot', '0'),
('feed_for_qa', '0'),
('feed_for_questions', '0'),
('feed_for_search', '1'),
('feed_for_tag_qs', '0'),
('feed_for_unanswered', '0'),
('feed_full_text', '1'),
('feed_number_items', '50'),
('feed_per_category', '1'),
('flagging_of_posts', '1'),
('flb_display_on_every_load', '0'),
('flb_like_box_colorscheme', 'light'),
('flb_like_box_data_stream', 'false'),
('flb_like_box_height', '300'),
('flb_like_box_show_border', 'false'),
('flb_like_box_show_faces', 'true'),
('flb_like_box_show_header', 'true'),
('flb_like_box_width', '200'),
('flb_like_modal_colorscheme', 'light'),
('flb_like_modal_data_stream', 'false'),
('flb_like_modal_header', 'false'),
('flb_like_modal_height', '175'),
('flb_like_modal_show_border', 'true'),
('flb_like_modal_show_faces', 'true'),
('flb_like_modal_width', '300'),
('flb_modal_cookie_expire', '30'),
('flb_modal_costum_css', '/*enter css here*/'),
('flb_modal_delay', '5'),
('flb_modal_header_footer_text', 'Thank you for visiting us'),
('flb_modal_header_main_text', '<h3>Like us on Facebook</h3>\n                            <p>Show your Support. Become a <b>FAN!</b></p>'),
('flb_page_url', 'FacebookDevelopers'),
('flb_show_fb_like_box', '1'),
('flb_show_fb_like_modal', '1'),
('flb_use_css_from_theme_file', '0'),
('follow_on_as', '1'),
('form_security_salt', 'xzwhprfksf5s2kqb6669n29ola1c4rlj'),
('from_email', 'no-reply@example.com'),
('home_description', ''),
('hot_weight_answers', '100'),
('hot_weight_a_age', '100'),
('hot_weight_q_age', '100'),
('hot_weight_views', '100'),
('hot_weight_votes', '100'),
('links_in_new_window', ''),
('logo_height', ''),
('logo_show', ''),
('logo_url', ''),
('logo_width', ''),
('mailing_body', '\n\n\n--\nStudent Resource Forum\nhttp://localhost/studentrf/'),
('mailing_enabled', ''),
('mailing_from_email', 'no-reply@example.com'),
('mailing_from_name', 'Student Resource Forum'),
('mailing_last_userid', ''),
('mailing_per_minute', '500'),
('mailing_subject', 'A message from Student Resource Forum'),
('match_ask_check_qs', '3'),
('match_example_tags', '3'),
('match_related_qs', '3'),
('max_len_q_title', '120'),
('max_num_q_tags', '5'),
('max_rate_ip_as', '50'),
('max_rate_ip_logins', '20'),
('max_rate_ip_qs', '20'),
('max_rate_user_as', '25'),
('max_rate_user_qs', '10'),
('max_store_user_updates', '50'),
('minify_html', '1'),
('min_len_a_content', '12'),
('min_len_c_content', '12'),
('min_len_q_content', '0'),
('min_len_q_title', '12'),
('min_num_q_tags', '0'),
('moderate_users', ''),
('mouseover_content_on', ''),
('nav_activity', '0'),
('nav_ask', '1'),
('nav_categories', '1'),
('nav_home', ''),
('nav_hot', '0'),
('nav_qa_is_home', '0'),
('nav_questions', '1'),
('nav_tags', '1'),
('nav_unanswered', '1'),
('nav_users', '0'),
('neat_urls', '5'),
('notice_visitor', ''),
('notice_welcome', ''),
('notify_admin_q_post', ''),
('notify_users_default', '1'),
('open_login_css', ''),
('open_login_hideform', ''),
('open_login_ok', '3'),
('open_login_zocial', ''),
('pages_prev_next', '3'),
('page_size_activity', '20'),
('page_size_ask_check_qs', '5'),
('page_size_ask_tags', '5'),
('page_size_home', '20'),
('page_size_hot_qs', '20'),
('page_size_pms', '10'),
('page_size_qs', '20'),
('page_size_q_as', '10'),
('page_size_related_qs', '5'),
('page_size_search', '10'),
('page_size_tags', '30'),
('page_size_tag_qs', '20'),
('page_size_una_qs', '20'),
('page_size_users', '30'),
('page_size_wall', '10'),
('permit_anon_view_ips', '70'),
('permit_anon_view_ips_points', ''),
('permit_close_q', '70'),
('permit_close_q_points', ''),
('permit_delete_hidden', '40'),
('permit_delete_hidden_points', ''),
('permit_edit_a', '100'),
('permit_edit_a_points', ''),
('permit_edit_c', '70'),
('permit_edit_c_points', ''),
('permit_edit_q', '70'),
('permit_edit_q_points', ''),
('permit_edit_silent', '40'),
('permit_edit_silent_points', ''),
('permit_flag', '110'),
('permit_flag_points', ''),
('permit_hide_show', '70'),
('permit_hide_show_points', ''),
('permit_moderate', '100'),
('permit_moderate_points', ''),
('permit_post_a', '150'),
('permit_post_a_points', ''),
('permit_post_c', '150'),
('permit_post_c_points', ''),
('permit_post_q', '150'),
('permit_post_q_points', ''),
('permit_post_wall', '110'),
('permit_post_wall_points', ''),
('permit_retag_cat', '70'),
('permit_retag_cat_points', ''),
('permit_select_a', '100'),
('permit_select_a_points', ''),
('permit_view_new_users_page', '70'),
('permit_view_new_users_page_points', ''),
('permit_view_q_page', '150'),
('permit_view_special_users_page', '40'),
('permit_view_special_users_page_points', ''),
('permit_view_voters_flaggers', '20'),
('permit_view_voters_flaggers_points', ''),
('permit_vote_a', '120'),
('permit_vote_a_points', ''),
('permit_vote_c', '120'),
('permit_vote_c_points', ''),
('permit_vote_down', '120'),
('permit_vote_down_points', ''),
('permit_vote_q', '120'),
('permit_vote_q_points', ''),
('points_a_selected', '30'),
('points_a_voted_max_gain', '20'),
('points_a_voted_max_loss', '5'),
('points_base', '100'),
('points_c_voted_max_gain', '10'),
('points_c_voted_max_loss', '3'),
('points_multiple', '10'),
('points_per_a_voted', ''),
('points_per_a_voted_down', '2'),
('points_per_a_voted_up', '2'),
('points_per_c_voted_down', '0'),
('points_per_c_voted_up', '0'),
('points_per_q_voted', ''),
('points_per_q_voted_down', '1'),
('points_per_q_voted_up', '1'),
('points_post_a', '4'),
('points_post_q', '2'),
('points_q_voted_max_gain', '10'),
('points_q_voted_max_loss', '3'),
('points_select_a', '3'),
('points_to_titles', ''),
('points_vote_down_a', '1'),
('points_vote_down_q', '1'),
('points_vote_on_a', ''),
('points_vote_on_q', ''),
('points_vote_up_a', '1'),
('points_vote_up_q', '1'),
('q2apro_cooltooltips_enabled', '1'),
('q2apro_onsitenotifications_enabled', ''),
('qa-tupm-weekly-enable', ''),
('q_urls_remove_accents', ''),
('q_urls_title_length', '50'),
('recalc_hotness_q_view', '1'),
('register_notify_admin', ''),
('register_terms', 'I agree to the Student Resource Forum Terms &amp; Conditions and Privacy Policy'),
('search_module', ''),
('show_a_c_links', '1'),
('show_a_form_immediate', 'if_no_as'),
('show_compact_numbers', '1'),
('show_custom_answer', ''),
('show_custom_ask', ''),
('show_custom_comment', ''),
('show_custom_footer', ''),
('show_custom_header', ''),
('show_custom_home', ''),
('show_custom_in_head', ''),
('show_custom_register', ''),
('show_custom_sidebar', '1'),
('show_custom_sidepanel', ''),
('show_custom_welcome', '0'),
('show_c_reply_buttons', '1'),
('show_fewer_cs_count', '5'),
('show_fewer_cs_from', '10'),
('show_full_date_days', '7'),
('show_home_description', ''),
('show_message_history', '1'),
('show_notice_visitor', ''),
('show_notice_welcome', ''),
('show_post_update_meta', '1'),
('show_register_terms', '0'),
('show_selected_first', '1'),
('show_url_links', '1'),
('show_user_points', '1'),
('show_user_titles', '1'),
('show_view_counts', '0'),
('show_view_count_q_page', '0'),
('show_when_created', '1'),
('site_language', ''),
('site_maintenance', '0'),
('site_text_direction', 'ltr'),
('site_theme', 'Donut-theme'),
('site_theme_mobile', 'Donut-theme'),
('site_title', 'Student Resource Forum'),
('site_url', 'http://localhost/studentrf/'),
('smtp_active', ''),
('smtp_address', ''),
('smtp_authenticate', ''),
('smtp_password', ''),
('smtp_port', '25'),
('smtp_secure', ''),
('smtp_username', ''),
('sort_answers_by', 'created'),
('ss_enabled', ''),
('suspend_register_users', ''),
('tags_or_categories', 'tc'),
('tag_cloud_count_tags', '100'),
('tag_cloud_font_size', '24'),
('tag_cloud_minimal_font_size', '10'),
('tag_cloud_size_popular', '1'),
('tag_separator_comma', ''),
('tupm-plugin-css', '\n.topusers ol{ list-style:none; margin-left: -15px;}\n.topusers li  {\n    margin-bottom: 15px;\n}\n.topusers .qa-widget-side a {\n	vertical-align:middle;\n                                        display:initial;}\n.topusers img{\nfloat:left;\n}\n.topusers-span {\n    display: inline-block;\n    margin-left: 10px;\n	vertical-align:middle;\n}\n.topusers .uscore{\nfont-family: arial;\n}\n.tupm-title {\n    font-family: Arial;\n    font-weight: bold;\nmargin-top: 10px;\n}\n.topusers-page{\nfont-size: large;\n}\n.topusers-page .tupm-title {\nmargin-bottom: 10px;\n}\n\n				'),
('use_microdata', '1'),
('votes_separated', ''),
('voting_on_as', '1'),
('voting_on_cs', '0'),
('voting_on_qs', '1'),
('voting_on_q_page_only', ''),
('widgetanyw_active', '1'),
('wysiwyg_editor_upload_images', '');

-- --------------------------------------------------------

--
-- Table structure for table `qa_pages`
--

CREATE TABLE `qa_pages` (
  `pageid` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `permit` tinyint(3) UNSIGNED DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_pages`
--

INSERT INTO `qa_pages` (`pageid`, `title`, `nav`, `position`, `flags`, `permit`, `tags`, `heading`, `content`) VALUES
(1, 'Books', 'M', 1, 0, 150, 'books', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `qa_postmetas`
--

CREATE TABLE `qa_postmetas` (
  `postid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_posts`
--

CREATE TABLE `qa_posts` (
  `postid` int(10) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `categoryid` int(10) UNSIGNED DEFAULT NULL,
  `catidpath1` int(10) UNSIGNED DEFAULT NULL,
  `catidpath2` int(10) UNSIGNED DEFAULT NULL,
  `catidpath3` int(10) UNSIGNED DEFAULT NULL,
  `acount` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `amaxvote` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `selchildid` int(10) UNSIGNED DEFAULT NULL,
  `closedbyid` int(10) UNSIGNED DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `lastip` varbinary(16) DEFAULT NULL,
  `upvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `downvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `netvotes` smallint(6) NOT NULL DEFAULT '0',
  `lastviewip` varbinary(16) DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(12000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_posts`
--

INSERT INTO `qa_posts` (`postid`, `type`, `parentid`, `categoryid`, `catidpath1`, `catidpath2`, `catidpath3`, `acount`, `amaxvote`, `selchildid`, `closedbyid`, `userid`, `cookieid`, `createip`, `lastuserid`, `lastip`, `upvotes`, `downvotes`, `netvotes`, `lastviewip`, `views`, `hotness`, `flagcount`, `format`, `created`, `updated`, `updatetype`, `title`, `content`, `tags`, `name`, `notify`) VALUES
(1, 'Q', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, 0x00000000000000000000000000000001, NULL, NULL, 0, 0, 0, 0x00000000000000000000000000000001, 1, 56317700000, 0, '', '2018-12-04 02:27:31', NULL, NULL, 'What is Software Engineering?', '', 'cse', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `qa_posttags`
--

CREATE TABLE `qa_posttags` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `postcreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_posttags`
--

INSERT INTO `qa_posttags` (`postid`, `wordid`, `postcreated`) VALUES
(1, 5, '2018-12-04 02:27:31');

-- --------------------------------------------------------

--
-- Table structure for table `qa_sharedevents`
--

CREATE TABLE `qa_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_sharedevents`
--

INSERT INTO `qa_sharedevents` (`entitytype`, `entityid`, `questionid`, `lastpostid`, `updatetype`, `lastuserid`, `updated`) VALUES
('Q', 1, 1, 1, NULL, 1, '2018-12-04 02:27:32'),
('U', 1, 1, 1, NULL, 1, '2018-12-04 02:27:32'),
('T', 5, 1, 1, NULL, 1, '2018-12-04 02:27:32');

-- --------------------------------------------------------

--
-- Table structure for table `qa_tagmetas`
--

CREATE TABLE `qa_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_tagwords`
--

CREATE TABLE `qa_tagwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_tagwords`
--

INSERT INTO `qa_tagwords` (`postid`, `wordid`) VALUES
(1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `qa_titlewords`
--

CREATE TABLE `qa_titlewords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_titlewords`
--

INSERT INTO `qa_titlewords` (`postid`, `wordid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userevents`
--

CREATE TABLE `qa_userevents` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userfavorites`
--

CREATE TABLE `qa_userfavorites` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `nouserevents` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userfields`
--

CREATE TABLE `qa_userfields` (
  `fieldid` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(40) DEFAULT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `permit` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userfields`
--

INSERT INTO `qa_userfields` (`fieldid`, `title`, `content`, `position`, `flags`, `permit`) VALUES
(1, 'name', NULL, 1, 0, 150),
(2, 'location', NULL, 2, 0, 150),
(3, 'website', NULL, 3, 2, 150),
(4, 'about', NULL, 4, 1, 150);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userlevels`
--

CREATE TABLE `qa_userlevels` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userlimits`
--

CREATE TABLE `qa_userlimits` (
  `userid` int(10) UNSIGNED NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userlimits`
--

INSERT INTO `qa_userlimits` (`userid`, `action`, `period`, `count`) VALUES
(1, 'Q', 428852, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userlogins`
--

CREATE TABLE `qa_userlogins` (
  `userid` int(10) UNSIGNED NOT NULL,
  `source` varchar(16) CHARACTER SET ascii NOT NULL,
  `identifier` varbinary(1024) NOT NULL,
  `identifiermd5` binary(16) NOT NULL,
  `oemail` varchar(80) DEFAULT NULL,
  `ohandle` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_usermetas`
--

CREATE TABLE `qa_usermetas` (
  `userid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_usernotices`
--

CREATE TABLE `qa_usernotices` (
  `noticeid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `content` varchar(12000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userpoints`
--

CREATE TABLE `qa_userpoints` (
  `userid` int(10) UNSIGNED NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `qposts` mediumint(9) NOT NULL DEFAULT '0',
  `aposts` mediumint(9) NOT NULL DEFAULT '0',
  `cposts` mediumint(9) NOT NULL DEFAULT '0',
  `aselects` mediumint(9) NOT NULL DEFAULT '0',
  `aselecteds` mediumint(9) NOT NULL DEFAULT '0',
  `qupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `aupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `adownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qvoteds` int(11) NOT NULL DEFAULT '0',
  `avoteds` int(11) NOT NULL DEFAULT '0',
  `cvoteds` int(11) NOT NULL DEFAULT '0',
  `upvoteds` int(11) NOT NULL DEFAULT '0',
  `downvoteds` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userpoints`
--

INSERT INTO `qa_userpoints` (`userid`, `points`, `qposts`, `aposts`, `cposts`, `aselects`, `aselecteds`, `qupvotes`, `qdownvotes`, `aupvotes`, `adownvotes`, `cupvotes`, `cdownvotes`, `qvoteds`, `avoteds`, `cvoteds`, `upvoteds`, `downvoteds`, `bonus`) VALUES
(1, 120, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userprofile`
--

CREATE TABLE `qa_userprofile` (
  `userid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_users`
--

CREATE TABLE `qa_users` (
  `userid` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `createip` varbinary(16) NOT NULL,
  `email` varchar(80) NOT NULL,
  `handle` varchar(20) NOT NULL,
  `avatarblobid` bigint(20) UNSIGNED DEFAULT NULL,
  `avatarwidth` smallint(5) UNSIGNED DEFAULT NULL,
  `avatarheight` smallint(5) UNSIGNED DEFAULT NULL,
  `passsalt` binary(16) DEFAULT NULL,
  `passcheck` binary(20) DEFAULT NULL,
  `passhash` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `level` tinyint(3) UNSIGNED NOT NULL,
  `loggedin` datetime NOT NULL,
  `loginip` varbinary(16) NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` varbinary(16) DEFAULT NULL,
  `emailcode` char(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sessioncode` char(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sessionsource` varchar(16) CHARACTER SET ascii DEFAULT '',
  `flags` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `wallposts` mediumint(9) NOT NULL DEFAULT '0',
  `oemail` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_users`
--

INSERT INTO `qa_users` (`userid`, `created`, `createip`, `email`, `handle`, `avatarblobid`, `avatarwidth`, `avatarheight`, `passsalt`, `passcheck`, `passhash`, `level`, `loggedin`, `loginip`, `written`, `writeip`, `emailcode`, `sessioncode`, `sessionsource`, `flags`, `wallposts`, `oemail`) VALUES
(1, '2018-12-01 23:44:11', 0x00000000000000000000000000000001, 'arnob.tanjim@gmail.com', 'Arnob Tanjim', NULL, NULL, NULL, NULL, NULL, '$2y$10$ICDcvaXJTPJYitSLS04WLuqeLcpCsL8bGOkWhJ6QeK3bGcEfq0M4i', 120, '2018-12-04 02:32:52', 0x00000000000000000000000000000001, '2018-12-04 02:27:32', 0x00000000000000000000000000000001, '', 'qq907nxo', NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userscores`
--

CREATE TABLE `qa_userscores` (
  `date` date NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qa_userscores`
--

INSERT INTO `qa_userscores` (`date`, `userid`, `points`) VALUES
('2018-12-04', 1, 120);

-- --------------------------------------------------------

--
-- Table structure for table `qa_uservotes`
--

CREATE TABLE `qa_uservotes` (
  `postid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  `votecreated` datetime DEFAULT NULL,
  `voteupdated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_widgetanyw`
--

CREATE TABLE `qa_widgetanyw` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `pages` varchar(800) NOT NULL,
  `position` varchar(30) NOT NULL,
  `ordering` smallint(5) UNSIGNED NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_widgets`
--

CREATE TABLE `qa_widgets` (
  `widgetid` smallint(5) UNSIGNED NOT NULL,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_widgets`
--

INSERT INTO `qa_widgets` (`widgetid`, `place`, `position`, `tags`, `title`) VALUES
(1, 'ST', 3, 'question,users,ask,tag', 'Activity Count'),
(2, 'FT', 1, 'all', 'Related Questions'),
(3, 'ST', 2, 'question,qa,activity,questions,hot,unanswered,tags,categories,users,ask,user,search,admin', 'Tag Cloud');

-- --------------------------------------------------------

--
-- Table structure for table `qa_words`
--

CREATE TABLE `qa_words` (
  `wordid` int(10) UNSIGNED NOT NULL,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `contentcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagwordcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagcount` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_words`
--

INSERT INTO `qa_words` (`wordid`, `word`, `titlecount`, `contentcount`, `tagwordcount`, `tagcount`) VALUES
(1, 'what', 1, 0, 0, 0),
(2, 'is', 1, 0, 0, 0),
(3, 'software', 1, 0, 0, 0),
(4, 'engineering', 1, 0, 0, 0),
(5, 'cse', 0, 0, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `qa_blobs`
--
ALTER TABLE `qa_blobs`
  ADD PRIMARY KEY (`blobid`);

--
-- Indexes for table `qa_cache`
--
ALTER TABLE `qa_cache`
  ADD PRIMARY KEY (`type`,`cacheid`),
  ADD KEY `lastread` (`lastread`);

--
-- Indexes for table `qa_categories`
--
ALTER TABLE `qa_categories`
  ADD PRIMARY KEY (`categoryid`),
  ADD UNIQUE KEY `parentid` (`parentid`,`tags`),
  ADD UNIQUE KEY `parentid_2` (`parentid`,`position`),
  ADD KEY `backpath` (`backpath`(200));

--
-- Indexes for table `qa_categorymetas`
--
ALTER TABLE `qa_categorymetas`
  ADD PRIMARY KEY (`categoryid`,`title`);

--
-- Indexes for table `qa_chat_kicks`
--
ALTER TABLE `qa_chat_kicks`
  ADD PRIMARY KEY (`userid`,`kickedby`);

--
-- Indexes for table `qa_chat_posts`
--
ALTER TABLE `qa_chat_posts`
  ADD PRIMARY KEY (`postid`),
  ADD KEY `posted` (`posted`);

--
-- Indexes for table `qa_chat_users`
--
ALTER TABLE `qa_chat_users`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `active` (`lastpolled`);

--
-- Indexes for table `qa_contentwords`
--
ALTER TABLE `qa_contentwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_cookies`
--
ALTER TABLE `qa_cookies`
  ADD PRIMARY KEY (`cookieid`);

--
-- Indexes for table `qa_iplimits`
--
ALTER TABLE `qa_iplimits`
  ADD UNIQUE KEY `ip` (`ip`,`action`);

--
-- Indexes for table `qa_messages`
--
ALTER TABLE `qa_messages`
  ADD PRIMARY KEY (`messageid`),
  ADD KEY `type` (`type`,`fromuserid`,`touserid`,`created`),
  ADD KEY `touserid` (`touserid`,`type`,`created`),
  ADD KEY `fromhidden` (`fromhidden`),
  ADD KEY `tohidden` (`tohidden`),
  ADD KEY `qa_messages_ibfk_1` (`fromuserid`);

--
-- Indexes for table `qa_monthlytoppers`
--
ALTER TABLE `qa_monthlytoppers`
  ADD PRIMARY KEY (`userid`,`date`),
  ADD KEY `userid` (`userid`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `qa_options`
--
ALTER TABLE `qa_options`
  ADD PRIMARY KEY (`title`);

--
-- Indexes for table `qa_pages`
--
ALTER TABLE `qa_pages`
  ADD PRIMARY KEY (`pageid`),
  ADD UNIQUE KEY `position` (`position`),
  ADD KEY `tags` (`tags`);

--
-- Indexes for table `qa_postmetas`
--
ALTER TABLE `qa_postmetas`
  ADD PRIMARY KEY (`postid`,`title`);

--
-- Indexes for table `qa_posts`
--
ALTER TABLE `qa_posts`
  ADD PRIMARY KEY (`postid`),
  ADD KEY `type` (`type`,`created`),
  ADD KEY `type_2` (`type`,`acount`,`created`),
  ADD KEY `type_4` (`type`,`netvotes`,`created`),
  ADD KEY `type_5` (`type`,`views`,`created`),
  ADD KEY `type_6` (`type`,`hotness`),
  ADD KEY `type_7` (`type`,`amaxvote`,`created`),
  ADD KEY `parentid` (`parentid`,`type`),
  ADD KEY `userid` (`userid`,`type`,`created`),
  ADD KEY `selchildid` (`selchildid`,`type`,`created`),
  ADD KEY `closedbyid` (`closedbyid`),
  ADD KEY `catidpath1` (`catidpath1`,`type`,`created`),
  ADD KEY `catidpath2` (`catidpath2`,`type`,`created`),
  ADD KEY `catidpath3` (`catidpath3`,`type`,`created`),
  ADD KEY `categoryid` (`categoryid`,`type`,`created`),
  ADD KEY `createip` (`createip`,`created`),
  ADD KEY `updated` (`updated`,`type`),
  ADD KEY `flagcount` (`flagcount`,`created`,`type`),
  ADD KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  ADD KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  ADD KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  ADD KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  ADD KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  ADD KEY `lastip` (`lastip`,`updated`,`type`);

--
-- Indexes for table `qa_posttags`
--
ALTER TABLE `qa_posttags`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`,`postcreated`);

--
-- Indexes for table `qa_sharedevents`
--
ALTER TABLE `qa_sharedevents`
  ADD KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  ADD KEY `questionid` (`questionid`,`entitytype`,`entityid`);

--
-- Indexes for table `qa_tagmetas`
--
ALTER TABLE `qa_tagmetas`
  ADD PRIMARY KEY (`tag`,`title`);

--
-- Indexes for table `qa_tagwords`
--
ALTER TABLE `qa_tagwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_titlewords`
--
ALTER TABLE `qa_titlewords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_userevents`
--
ALTER TABLE `qa_userevents`
  ADD KEY `userid` (`userid`,`updated`),
  ADD KEY `questionid` (`questionid`,`userid`);

--
-- Indexes for table `qa_userfavorites`
--
ALTER TABLE `qa_userfavorites`
  ADD PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  ADD KEY `userid` (`userid`,`nouserevents`),
  ADD KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`);

--
-- Indexes for table `qa_userfields`
--
ALTER TABLE `qa_userfields`
  ADD PRIMARY KEY (`fieldid`);

--
-- Indexes for table `qa_userlevels`
--
ALTER TABLE `qa_userlevels`
  ADD UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  ADD KEY `entitytype` (`entitytype`,`entityid`);

--
-- Indexes for table `qa_userlimits`
--
ALTER TABLE `qa_userlimits`
  ADD UNIQUE KEY `userid` (`userid`,`action`);

--
-- Indexes for table `qa_userlogins`
--
ALTER TABLE `qa_userlogins`
  ADD KEY `source` (`source`,`identifiermd5`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `qa_usermetas`
--
ALTER TABLE `qa_usermetas`
  ADD PRIMARY KEY (`userid`,`title`);

--
-- Indexes for table `qa_usernotices`
--
ALTER TABLE `qa_usernotices`
  ADD PRIMARY KEY (`noticeid`),
  ADD KEY `userid` (`userid`,`created`);

--
-- Indexes for table `qa_userpoints`
--
ALTER TABLE `qa_userpoints`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `points` (`points`);

--
-- Indexes for table `qa_userprofile`
--
ALTER TABLE `qa_userprofile`
  ADD UNIQUE KEY `userid` (`userid`,`title`);

--
-- Indexes for table `qa_users`
--
ALTER TABLE `qa_users`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `email` (`email`),
  ADD KEY `handle` (`handle`),
  ADD KEY `level` (`level`),
  ADD KEY `created` (`created`,`level`,`flags`);

--
-- Indexes for table `qa_userscores`
--
ALTER TABLE `qa_userscores`
  ADD PRIMARY KEY (`userid`,`date`),
  ADD KEY `userid` (`userid`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `qa_uservotes`
--
ALTER TABLE `qa_uservotes`
  ADD UNIQUE KEY `userid` (`userid`,`postid`),
  ADD KEY `postid` (`postid`),
  ADD KEY `voted` (`votecreated`,`voteupdated`);

--
-- Indexes for table `qa_widgetanyw`
--
ALTER TABLE `qa_widgetanyw`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position` (`position`,`ordering`);

--
-- Indexes for table `qa_widgets`
--
ALTER TABLE `qa_widgets`
  ADD PRIMARY KEY (`widgetid`),
  ADD UNIQUE KEY `position` (`position`);

--
-- Indexes for table `qa_words`
--
ALTER TABLE `qa_words`
  ADD PRIMARY KEY (`wordid`),
  ADD KEY `word` (`word`),
  ADD KEY `tagcount` (`tagcount`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `qa_categories`
--
ALTER TABLE `qa_categories`
  MODIFY `categoryid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_chat_posts`
--
ALTER TABLE `qa_chat_posts`
  MODIFY `postid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_messages`
--
ALTER TABLE `qa_messages`
  MODIFY `messageid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_pages`
--
ALTER TABLE `qa_pages`
  MODIFY `pageid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qa_posts`
--
ALTER TABLE `qa_posts`
  MODIFY `postid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qa_userfields`
--
ALTER TABLE `qa_userfields`
  MODIFY `fieldid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `qa_usernotices`
--
ALTER TABLE `qa_usernotices`
  MODIFY `noticeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_users`
--
ALTER TABLE `qa_users`
  MODIFY `userid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qa_widgetanyw`
--
ALTER TABLE `qa_widgetanyw`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_widgets`
--
ALTER TABLE `qa_widgets`
  MODIFY `widgetid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `qa_words`
--
ALTER TABLE `qa_words`
  MODIFY `wordid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `qa_categorymetas`
--
ALTER TABLE `qa_categorymetas`
  ADD CONSTRAINT `qa_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_contentwords`
--
ALTER TABLE `qa_contentwords`
  ADD CONSTRAINT `qa_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_messages`
--
ALTER TABLE `qa_messages`
  ADD CONSTRAINT `qa_messages_ibfk_1` FOREIGN KEY (`fromuserid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_messages_ibfk_2` FOREIGN KEY (`touserid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL;

--
-- Constraints for table `qa_postmetas`
--
ALTER TABLE `qa_postmetas`
  ADD CONSTRAINT `qa_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_posts`
--
ALTER TABLE `qa_posts`
  ADD CONSTRAINT `qa_posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `qa_posts` (`postid`),
  ADD CONSTRAINT `qa_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `qa_posts` (`postid`);

--
-- Constraints for table `qa_posttags`
--
ALTER TABLE `qa_posttags`
  ADD CONSTRAINT `qa_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_tagwords`
--
ALTER TABLE `qa_tagwords`
  ADD CONSTRAINT `qa_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_titlewords`
--
ALTER TABLE `qa_titlewords`
  ADD CONSTRAINT `qa_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_userevents`
--
ALTER TABLE `qa_userevents`
  ADD CONSTRAINT `qa_userevents_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userfavorites`
--
ALTER TABLE `qa_userfavorites`
  ADD CONSTRAINT `qa_userfavorites_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userlevels`
--
ALTER TABLE `qa_userlevels`
  ADD CONSTRAINT `qa_userlevels_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userlimits`
--
ALTER TABLE `qa_userlimits`
  ADD CONSTRAINT `qa_userlimits_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userlogins`
--
ALTER TABLE `qa_userlogins`
  ADD CONSTRAINT `qa_userlogins_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_usermetas`
--
ALTER TABLE `qa_usermetas`
  ADD CONSTRAINT `qa_usermetas_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_usernotices`
--
ALTER TABLE `qa_usernotices`
  ADD CONSTRAINT `qa_usernotices_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userprofile`
--
ALTER TABLE `qa_userprofile`
  ADD CONSTRAINT `qa_userprofile_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_uservotes`
--
ALTER TABLE `qa_uservotes`
  ADD CONSTRAINT `qa_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_uservotes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `qa_tupmevent` ON SCHEDULE EVERY 1 MONTH STARTS '2018-01-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
				insert into  qa_userscores (userid, points, date) select userid, points, CURDATE() as date from qa_userpoints order by userid asc;
			insert into qa_monthlytoppers (date, userid, points) select CURDATE() - interval 1 month as date, a.userid, a.points - COALESCE(b.points,0) AS mpoints from qa_userscores a, qa_userscores b where a.userid = b.userid and a.date = CURDATE() and b.date between (a.date - interval 35 day) and (a.date - interval 25 day)  group by a.userid,a.points,b.points  having mpoints>0;

			END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
