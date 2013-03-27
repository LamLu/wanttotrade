<?php
/**
 *Register user
 *@autor Chien Nguyen
 *@copyright Copyright (c) 2013, HiDev Mobile
 */
require_once("DBConnection.php");
require_once("User.php");



   $email = $emailSignUp;
   $password =$passwordSignUp;
   $count = 0;


   //create user
   $user = new User ($email,$password);
   
   if ((!isset($email) || !isset($password)) || (empty($email) || empty($password))) //if email and password is not set yet or empty
   {
   	echo ($f);
   	exit();
   }
   if($user->alreadyRegister() == true) 
   {
      echo '{"register": "failed", "error": "Username has been used"}';
	  //possible prompt for user to re-enter email and send it back to User class
	  //$user->setEmail("new email");
   } 
   else 
   {
	   //user can't register due to duplicate salt, try 10 time;
      if(!$user->register() && $count<5)
	  {
	  	$user->register();
		$count++;
	  }
	  else echo '{"register":"passed"}';
   }


?>