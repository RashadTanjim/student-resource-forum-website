<?php
class qa_html_theme_layer extends qa_html_theme_base {
     function body_script(){
        qa_html_theme_base::body_script();

        // only load if enabled
        if(qa_opt('ss_enabled')) {
            $this->output('<!-- Go to www.addthis.com/dashboard to customize your tools --> <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid='.qa_opt('ss_addthis_profile_id').'"></script> ');

            if($_GET['vadt'] == 'true' && (bool)qa_opt('ss_share_question')){
                $this->output('
                <style>
                /* The Overlay (background) */
                .overlay {
                    height: 139px;
                    width: 522px;
                    position: fixed;
                    z-index: 1;
                    left: 23%;
                    top: 29%;
                    background-color: rgba(256,256,256, 0.7);
                    overflow-x: hidden;
                    transition: 0.5s;
                    display: block;
                    border: 1px solid #ccc;
                    border-radius: 17px;
                }
                
                /* Position the content inside the overlay */
                .overlay-content {
                    position: relative;
                    top: 25%; /* 25% from the top */
                    width: 100%; /* 100% width */
                    text-align: center; /* Centered text/links */
                }
                
                /* The navigation links inside the overlay */
                .overlay a {
                    padding: 8px;
                    text-decoration: none;
                    font-size: 36px;
                    color: #818181;
                    display: block; /* Display block instead of inline */
                    transition: 0.3s; /* Transition effects on hover (color) */
                }
                
                /* When you mouse over the navigation links, change their color */
                .overlay a:hover, .overlay a:focus {
                    color: #f1f1f1;
                }
                
                /* Position the close button (top right corner) */
                .overlay .closebtn {
                    position: absolute;
                    top: -2px;
                    right: 3px;
                    font-size: 32px;
                }
                
                /* When the height of the screen is less than 450 pixels, change the font-size of the links and position the close button again, so they don\'t overlap */
                @media screen and (/*max-height: 450px*/) {
                    .overlay a {font-size: 20px}
                    .overlay .closebtn {
                        font-size: 40px;
                        top: -31px;
                        right: 35px;
                    }
                }
                </style>
                <div id="myNav" class="overlay">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                  <!-- Overlay content -->
                  <div class="overlay-content">
                    
                    <p></p>
                    <div class="addthis_inline_share_toolbox">'.qa_html(qa_opt('ss_share_question_message')).'</div>
                  </div>
                
                </div>
                <script>
                function closeNav() {
                    document.getElementById("myNav").style.display = "none";
                }
                </script>

                ');
            }
        } // end enabled
    } // end head_script
}
