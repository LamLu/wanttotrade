<?php
/**
 * regiter php
 */


$emailSignUp =  $_POST['emailsignup'];
$passwordSignUp = $_POST['passwordsignup'];
$passwordSignUpConfirm = $_POST['passwordsignup_confirm'];
$usernameSignUp= $_POST['usernamesignup'];

require_once('../../php/register.php');
/*
echo "This is register.php in include_php";
echo ('<br \>'.$passwordSignUp);
echo ('<br \>'.$emailSignUp);
echo ('<br \>'.$passwordSignUpConfirm);
echo ('<br \>'.$usernameSignUp);
*/

?>