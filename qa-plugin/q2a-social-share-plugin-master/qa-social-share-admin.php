<?php
/*

*/
class qa_ss_admin
{
  function admin_form(&$qa_content)
  {
    $saved=false;

    if (qa_clicked('ss_save_button')) {
      qa_opt('ss_enabled', (bool) qa_post_text('ss_enabled_cb'));
      
      qa_opt('ss_share_question', (bool) qa_post_text('ss_share_question_cb'));
      qa_opt('ss_share_question_message', qa_post_text('ss_share_question_message_field'));

      //qa_opt('ss_share_answer', (bool) qa_post_text('ss_share_answer_cb'));
      //qa_opt('ss_share_answer_message', qa_post_text('ss_share_answer_message_field'));

      qa_opt('ss_addthis_profile_id', qa_post_text('ss_addthis_profile_id_field'));
      
      qa_opt('ss_is_q_post',false);
      //qa_opt('ss_is_a_post',false);
      $saved=true;
    }

    return array(
      'ok' => $saved ? 'Social Share settings saved' : null,

      'fields' => array(
        array(
          'label' => 'Do you want to enable Social Share? (If you have created a tool with floating type, it will show up)',
          'type' => 'checkbox',
          'value' => (bool)qa_opt('ss_enabled'),
          'tags' => 'NAME="ss_enabled_cb"',
        ),
        array(
          'label' => 'Do you want to encourage users to share their question? (This will show popup when the user posts a new question! You will have to create a tool with inline share button.)',
          'type' => 'checkbox',
          'value' => (bool)qa_opt('ss_share_question'),
          'tags' => 'NAME="ss_share_question_cb"',
        ),
        array(
          'label' => 'Message to display when a new question is posted.',
          'value' => qa_html(qa_opt('ss_share_question_message')),
          'tags' => 'name="ss_share_question_message_field"',
        ),
        /*
        array(
          'label' => 'Do you want to encourage users to share their answer?',
          'type' => 'checkbox',
          'value' => (bool)qa_opt('ss_share_answer'),
          'tags' => 'NAME="ss_share_answer_cb"',
        ),
        array(
          'label' => 'Message to display when a new answer is posted.',
          'value' => qa_html(qa_opt('ss_share_answer_message')),
          'tags' => 'name="ss_share_answer_message_field"',
        ),
        */
        array(
          'label' => 'Enter your AddThis profile ID.',
          'value' => qa_html(qa_opt('ss_addthis_profile_id')),
          'tags' => 'name="ss_addthis_profile_id_field"',
        ),
      ),

      'buttons' => array(
        array(
          'label' => 'Save Changes',
          'tags' => 'name="ss_save_button"',
        ),
      ),
    );
  }
}