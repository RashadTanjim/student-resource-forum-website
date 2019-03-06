========================================
Question2Answer Top Users per Month/Week 
========================================
-----------
Description
-----------
This is a plugin for **Question2Answer** that displays the top scoring users of the current month as well as week in two separate sidebar widgets and on a separate page. This code was initially forked from https://github.com/q2apro/q2apro-best-users-per-month-free but changed mostly completely due to give better performance.

-----------
Requirement
-----------
Run the following command in mysql terminal to enable event scheduler. 
SET GLOBAL event_scheduler = ON;


------------
Installation
------------
#. Installstudentrf_
#. Get the source code for this plugin directly from github_
#. Extract the files.
#. Change language strings in file **qa-tupm-lang.php**
#. Upload the files to a subfolder  inside the ``qa-plugins`` folder of your Q2A installation.
#. Then go to **Admin >Layout >Available widgets**, and add the widget "Top Users per Month", set its position to: Side panel - Below sidebar box. Do same for "Weekly Widget"

.. _Question2Answer: http://www.question2answer.org/install.php

----------
Disclaimer
----------
This is **beta** code. It is probably okay for production environments, but may not work exactly as expected. You bear the risk. Refunds will not be given!

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
See the GNU General Public License for more details.

-------
Copyright
-------
All code herein is OpenSource_. Feel free to build upon it and share with the world.

.. _OpenSource: http://www.gnu.org/licenses/gpl.html

---------
About q2a
---------
Question2Answer is a free and open source platform for Q&A sites. For more information, visit: www.question2answer.org

---------
Final Note
---------
If you use the plugin:
+ Consider joining thestudentrf-Forum_, answer some questions or write your own plugin!
+ You can use the code of this plugin to learn more about q2a-plugins. It is commented code.
+ Thanks!

.. _Question2Answer-Forum: http://www.question2answer.org/qa/

