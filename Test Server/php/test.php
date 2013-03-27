<?php
/**
 *Register user
 *@autor Chien Nguyen
 *@copyright Copyright (c) 2013, HiDev Mobile
 */
require_once("DBConnection.php");
require_once("User.php");

$email =  "chien@sample.com" ;//$_POST['email'];
$password = "nguyen";//$_POST['password'];

//function register()
//{
	$user = new User($email,$password);
	if($user->alreadyRegister()) echo "exist";
	else echo "not exist";
	
	$user->register();
	
	
//}
?>