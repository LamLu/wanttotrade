<?php
/**
 *This is the script of login
 *@author Lam Lu
 */
require_once("Authentication.php");

$email = $emailInputFromUser;
$password = $passwordInputFromUser;


$p = array("login" => "passed");
$f = '{"login":"failed"}';
header("Content-Type: text/json");


if ((!isset($email) || !isset($password)) || 
		(empty($email) || empty($password))) //if email and password is not set yet or empty
    echo ($f);

else
{
	$authentication = new Authentication($email, $password);
	if($authentication->login())
	{
		$p["userProfile"] = $authentication->retrieveUserProfile();
		//echo $p["userProfile"]["userProfileImgScr"];
	//	echo($p["userProfile"]["userProfileImgSrc"]);
		//$img = "<img src = \"".$p["userProfile"]["userProfileImgScr"]."\" />";
		//echo $img;
		//$i = "<img src = \"http://localhost:8888/profile_img/cute_avatar.jpg\" />";
		//echo $i;
		echo(json_encode($p));
	}
	else
		echo($f);
}

//decode json $d = json_decode($e);	

?>