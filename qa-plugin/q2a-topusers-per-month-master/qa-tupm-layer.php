<?php

class qa_html_theme_layer extends qa_html_theme_base
{

	function doctype(){
	
		qa_html_theme_base::doctype();

		global $qa_request;
		// adds subnavigation to pages bestusers and users
		if(strncmp($qa_request,'users',5) == 0 || $qa_request == 'topusers' ) {
			$this->content['navigation']['sub']['topusers']= array(
					'label' => qa_lang_html('qa_tupm_lang/subnav_title'),
					'url' => qa_path_html('topusers'),
					'selected' => ($qa_request == 'topusers')
				
			);
		}
		
	}
	function head_custom()
        {
                qa_html_theme_base::head_custom();
                $this->output('<style type="text/css">'.qa_opt('tupm-plugin-css').'</style>');
        }


}
