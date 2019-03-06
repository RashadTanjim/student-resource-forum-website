<?php
class qa_tupm_admin {

	function allow_template($template)
	{
		return ($template!='admin');
	}

	function option_default($option) {

		switch($option) {
			case 'tupm-plugin-css':
				return '
.topusers ol{ list-style:none; margin-left: -15px;}
.topusers li  {
    margin-bottom: 15px;
}
.topusers .qa-widget-side a {
	vertical-align:middle;
                                        display:initial;}
.topusers img{
float:left;
}
.topusers-span {
    display: inline-block;
    margin-left: 10px;
	vertical-align:middle;
}
.topusers .uscore{
font-family: arial;
}
.tupm-title {
    font-family: Arial;
    font-weight: bold;
margin-top: 10px;
}
.topusers-page{
font-size: large;
}
.topusers-page .tupm-title {
margin-bottom: 10px;
}

				';
			case 'qa-tupm-plugin-title':
				return 'Top Monthly Users';
			case 'qa-tupm-widget-count':
				return '10';
			case 'qa-tupm-weekly-widget-count':
				return '10';
			case 'qa-tupm-page-count':
				return '20';
			case 'qa-tupm-hide-admin':
				return '';
			case 'qa-tupm-hide-points':
				return '';
			case 'qa-tupm-reward-enable':
				return '';
			case 'qa-tupm-reward-html':
				return '200 points';
			case 'qa-tupm-weekly-enable':
				return '';
			case 'qa-tupm-weekly-hide-admin':
				return '';
			case 'qa-tupm-weekly-hide-points':
				return '';
			case 'qa-tupm-weekly-reward-enable':
				return '';
			case 'qa-tupm-weekly-reward-html':
				return '200 points';
			default:
				return null;

		}
	}
	function admin_form(&$qa_content)
	{

		//	Process form input

		$ok = null;
		if (qa_clicked('tupm-save-button')) {
			foreach($_POST as $i => $v) {

				qa_opt($i,$v);
			}
			if(!isset($_POST['qa-tupm-hide-admin']))
				qa_opt('qa-tupm-hide-admin', '0');
			if(!isset($_POST['qa-tupm-hide-points']))
				qa_opt('qa-tupm-hide-points', '0');
			if(!isset($_POST['qa-tupm-reward-enable']))
				qa_opt('qa-tupm-reward-enable', '0');
			if(!isset($_POST['qa-tupm-weekly-enable']))
				qa_opt('qa-tupm-weekly-enable', '0');
			if(!isset($_POST['qa-tupm-weekly-hide-admin']))
				qa_opt('qa-tupm-weekly-hide-admin', '0');
			if(!isset($_POST['qa-tupm-weekly-hide-points']))
				qa_opt('qa-tupm-weekly-hide-points', '0');
			if(!isset($_POST['qa-tupm-weekly-reward-enable']))
				qa_opt('qa-tupm-weekly-reward-enable', '0');

			$ok = qa_lang('admin/options_saved');
		}
		else if (qa_clicked('tupm-reset-button')) {
			foreach($_POST as $i => $v) {
				$def = $this->option_default($i);
				if($def !== null) qa_opt($i,$def);
			}
			$ok = qa_lang('admin/options_reset');
		}			
		//	Create the form for display


		$fields = array();


		$fields[] = array(
				'label' => 'Top Users per Month custom css',
				'tags' => 'NAME="tupm-plugin-css"',
				'value' => qa_opt('tupm-plugin-css'),
				'type' => 'textarea',
				'rows' => 20
				);
		$fields[] = array(
				'label' => 'Top Users per Month Title',
				'tags' => 'NAME="qa-tupm-plugin-title"',
				'value' => qa_opt('qa-tupm-plugin-title'),
				'type' => 'text',
				);
		$fields[] = array(
				'label' => 'Top Users Count in Widget',
				'tags' => 'NAME="qa-tupm-widget-count"',
				'value' => qa_opt('qa-tupm-widget-count'),
				'type' => 'number',
				);
		$fields[] = array(
				'label' => 'Top Users Count in Page',
				'tags' => 'NAME="qa-tupm-page-count"',
				'value' => qa_opt('qa-tupm-page-count'),
				'type' => 'number',
				);
		$fields[] = array(
				'label' => 'Enable Rewards',
				'tags' => 'NAME="qa-tupm-reward-enable"',
				'value' => qa_opt('qa-tupm-reward-enable'),
				'type' => 'checkbox',
				);
		$fields[] = array(
				'label' => 'Reward HTML',
				'tags' => 'NAME="qa-tupm-reward-html"',
				'value' => qa_opt('qa-tupm-reward-html'),
				'type' => 'textarea',
				'rows' => 20,
				);
		$fields[] = array(
				'label' => 'Hide admins from Top Users List',
				'tags' => 'NAME="qa-tupm-hide-admin"',
				'value' => qa_opt('qa-tupm-hide-admin'),
				'type' => 'checkbox',
				);
		$fields[] = array(
				'label' => 'Hide points from Top Users List',
				'tags' => 'NAME="qa-tupm-hide-points"',
				'value' => qa_opt('qa-tupm-hide-points'),
				'type' => 'checkbox',
				);
		$fields[] = array(
				'label' => 'Enable Weekly Toppers',
				'tags' => 'NAME="qa-tupm-weekly-enable"',
				'value' => qa_opt('qa-tupm-weekly-enable'),
				'type' => 'checkbox',
				);
		$fields[] = array(
				'label' => 'Top Users Count in Weekly Widget',
				'tags' => 'NAME="qa-tupm-weekly-widget-count"',
				'value' => qa_opt('qa-tupm-weekly-widget-count'),
				'type' => 'number',
				);
		$fields[] = array(
				'label' => 'Enable Weekly Rewards',
				'tags' => 'NAME="qa-tupm-weekly-reward-enable"',
				'value' => qa_opt('qa-tupm-weekly-reward-enable'),
				'type' => 'checkbox',
				);
		$fields[] = array(
				'label' => 'Weekly Reward HTML',
				'tags' => 'NAME="qa-tupm-weekly-reward-html"',
				'value' => qa_opt('qa-tupm-weekly-reward-html'),
				'type' => 'textarea',
				'rows' => 20,
				);
		$fields[] = array(
				'label' => 'Hide admins from Weekly Top Users List',
				'tags' => 'NAME="qa-tupm-weekly-hide-admin"',
				'value' => qa_opt('qa-tupm-weekly-hide-admin'),
				'type' => 'checkbox',
				);
		$fields[] = array(
				'label' => 'Hide points from Weekly Top Users List',
				'tags' => 'NAME="qa-tupm-weekly-hide-points"',
				'value' => qa_opt('qa-tupm-weekly-hide-points'),
				'type' => 'checkbox',
				);


		return array(
				'ok' => ($ok && !isset($error)) ? $ok : null,

				'fields' => $fields,

				'buttons' => array(
					array(
						'label' => qa_lang_html('main/save_button'),
						'tags' => 'NAME="tupm-save-button"',
					     ),
					array(
						'label' => qa_lang_html('admin/reset_options_button'),
						'tags' => 'NAME="tupm-reset-button"',
					     ),
					),
			    );
	}


}
