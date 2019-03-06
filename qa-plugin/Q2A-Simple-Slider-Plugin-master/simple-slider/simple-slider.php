<?php

class simple_slider 
{
	private $directory;
	private $urltoroot;
	
	public function load_module( $directory, $urltoroot )
	{
		$this->directory = $directory;
		$this->urltoroot = $urltoroot;
	}
	
	function option_default($option)
	{
		switch ($option) {
			case 'simple_slider_1_title': return 'Slider 1 Title';
			case 'simple_slider_1_image': return 'qa-plugin/simple-slider/images/slider1.jpg';
			case 'simple_slider_1_description': return 'Slider 1 Description';
			case 'simple_slider_2_title': return 'Slider 2 Title';
			case 'simple_slider_2_image': return 'qa-plugin/simple-slider/images/slider2.jpg';
			case 'simple_slider_2_description': return 'Slider 2 Description';
			case 'simple_slider_3_title': return 'Slider 3 Title';
			case 'simple_slider_3_image': return 'qa-plugin/simple-slider/images/slider3.jpg';
			case 'simple_slider_3_description': return 'Slider 3 Description';
		}
	}
	
	function ss_get_option( $option )
	{
		return (strlen(qa_opt($option)) > 3) ? qa_opt($option) : $this->option_default($option);
	}
	
	function admin_form(&$qa_content)
	{
		$saved=false;
		if (qa_clicked('save_button')) {
			qa_opt('simple_slider_1_title', qa_post_text('simple_slider_1_title'));
			qa_opt('simple_slider_1_image', qa_post_text('simple_slider_1_image'));
			qa_opt('simple_slider_1_description', qa_post_text('simple_slider_1_description'));
			qa_opt('simple_slider_2_title', qa_post_text('simple_slider_2_title'));
			qa_opt('simple_slider_2_image', qa_post_text('simple_slider_2_image'));
			qa_opt('simple_slider_2_description', qa_post_text('simple_slider_2_description'));
			qa_opt('simple_slider_3_title', qa_post_text('simple_slider_3_title'));
			qa_opt('simple_slider_3_image', qa_post_text('simple_slider_3_image'));
			qa_opt('simple_slider_3_description', qa_post_text('simple_slider_3_description'));
			$saved=true;
		}
		
		return array(
			'ok' => $saved ? qa_lang_html('ss_lang/settings_saved') : null,
			
			'fields' => array(
				array(
					'label' => qa_lang_html('ss_lang/slider_1_title'),
					'type' => 'text',
					'style' => 'tall',
					'value' => $this->ss_get_option('simple_slider_1_title'),
					'tags' => 'NAME="simple_slider_1_title" ID="simple_slider_1_title"',
				),
				array(
					'label' => qa_lang_html('ss_lang/slider_1_image'),
					'type' => 'text',
					'value' => $this->ss_get_option('simple_slider_1_image'),
					'tags' => 'NAME="simple_slider_1_image" ID="simple_slider_1_image"',
				),
				array(
					'label' => qa_lang_html('ss_lang/slider_1_description'),
					'type' => 'textarea',
					'rows' => 2,
					'value' => $this->ss_get_option('simple_slider_1_description'),
					'tags' => 'NAME="simple_slider_1_description" ID="simple_slider_1_description"',
				),
				array(
					'label' => qa_lang_html('ss_lang/slider_2_title'),
					'type' => 'text',
					'style' => 'tall',
					'value' => $this->ss_get_option('simple_slider_2_title'),
					'tags' => 'NAME="simple_slider_2_title" ID="simple_slider_2_title"',
				),
				array(
					'label' => qa_lang_html('ss_lang/slider_2_image'),
					'type' => 'text',
					'value' => $this->ss_get_option('simple_slider_2_image'),
					'tags' => 'NAME="simple_slider_2_image" ID="simple_slider_2_image"',
				),
				array(
					'label' => qa_lang_html('ss_lang/slider_2_description'),
					'type' => 'textarea',
					'rows' => 2,
					'value' => $this->ss_get_option('simple_slider_2_description'),
					'tags' => 'NAME="simple_slider_2_description" ID="simple_slider_2_description"',
				),
				array(
					'label' => qa_lang_html('ss_lang/slider_3_title'),
					'type' => 'text',
					'style' => 'tall',
					'value' => $this->ss_get_option('simple_slider_3_title'),
					'tags' => 'NAME="simple_slider_3_title" ID="simple_slider_3_title"',
				),
				array(
					'label' => qa_lang_html('ss_lang/slider_3_image'),
					'type' => 'text',
					'value' => $this->ss_get_option('simple_slider_3_image'),
					'tags' => 'NAME="simple_slider_3_image" ID="simple_slider_3_image"',
				),
				array(
					'label' => qa_lang_html('ss_lang/slider_3_description'),
					'type' => 'textarea',
					'rows' => 2,
					'value' => $this->ss_get_option('simple_slider_3_description'),
					'tags' => 'NAME="simple_slider_3_description" ID="simple_slider_3_description"',
				),
			),
			
			'buttons' => array(
				array(
					'label' => qa_lang_html('admin/save_options_button'),
					'tags' => 'name="save_button"',
				),
			),
		);
	}

	function allow_template($template)
	{
		$allow=false;
		switch ($template)
		{
			case 'activity':
			case 'qa':
			case 'questions':
			case 'hot':
			case 'ask':
			case 'categories':
			case 'tag':
			case 'tags':
			case 'unanswered':
			case 'search':
			case 'updates':
			case 'custom':
				$allow=true;
				break;
		}
		
		return $allow;
	}

	
	function allow_region($region)
	{
		return ($region=='main');
	}
	
	function output_widget($region, $place, $themeobject, $template, $request, $qa_content)
	{
		$sliders = array( 
			'slider_1' => array( 
				'title' => $this->ss_get_option('simple_slider_1_title'),
				'image' => $this->ss_get_option('simple_slider_1_image'),
				'description' => $this->ss_get_option('simple_slider_1_description'),
			),
			'slider_2' => array( 
				'title' => $this->ss_get_option('simple_slider_2_title'),
				'image' => $this->ss_get_option('simple_slider_2_image'),
				'description' => $this->ss_get_option('simple_slider_2_description'),
			),
			'slider_3' => array( 
				'title' => $this->ss_get_option('simple_slider_3_title'),
				'image' => $this->ss_get_option('simple_slider_3_image'),
				'description' => $this->ss_get_option('simple_slider_3_description'),
			),
		);
		$themeobject->output('<div class="qa-simple-slider">');
		$themeobject->output('<div class="slider">');
		$themeobject->output('<ul class="items">');
		foreach ( $sliders as $slider ) {	  
			$themeobject->output('<li><img src="' . $slider['image'] . '" alt="" />');
			$themeobject->output('<div class="banner"> <strong class="title">' . $slider['title'] . '</strong>');
			$themeobject->output('<p class="p3">' . $slider['description'] . '</p>');
			$themeobject->output('<a class="button-1" href="#">Learn More</a> </div> </li>');
		}			
		$themeobject->output('</ul>');
		$themeobject->output('<a class="banner-2" href="#"></a> </div>');
		$themeobject->output('<ul class="pags"> <li><a href="#">1</a></li> <li><a href="#">2</a></li> <li><a href="#">3</a></li> </ul>');
		$themeobject->output('</div>');
	}
}


/*
	Omit PHP closing tag to help avoid accidental output
*/