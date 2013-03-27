<?php
/*
* this is to include the php files outside the wwwroot folder for 
* security reason
*/
$emailInputFromUser =  $_POST['username'];
$passwordInputFromUser = $_POST['password'];
require_once('../../php/login.php');

/*
//for testing
echo "This is login.php in include_php";
echo ('<br \>'.$emailInputFromUser);
echo ('<br \>'.$passwordInputFromUser);
*/

?>