<?php
/**
 *This class connect to database and register user
 *@autor Chien Nguyen
 *@copyright Copyright (c) 2013, HiDev Mobile
 */
require_once("DBConnection.php");


class User
{
	private $email;
	private $password;
	
	//constructor
	function __construct($email, $password)
	{
		$this->email = $email;
		$this->password= $password;
	}
	//destruct
	function __destruct()
	{
		$this->email = null;
		$this->password = null;
	}
	/**set email field
	*/
	function setEmail($e)
	{
		$this->email = $e;
	}
	/** set password field
	*/
	function setPassword($p)
	{
		$this->password = $p;
	}

	/** Check if user already register
	* return true if user exist or fail to connect to database
	**/
	public function alreadyRegister()
	{
    	$conn = DBConnection::createConnection();
		$check = true;
		
    	if($conn !== null) //successfully connected to database
    	{		
			//prepare statement				
			if ($statement = $conn->prepare('Select email from user_profile where email = ?'))
			{
				$statement->bind_param("s", $this->email);
				$statement->execute();
        		$statement->store_result();
				
				// If the user exists
				if($statement->num_rows == 1) $check=true;
				else $check=false; 
			}
			else echo "Failed to prepare statement";	
		}

		//close connection
		DBConnection::closeConnection();
		return $check;
	}
	/** Register a user
	* Pre: user not register yet
	* Post: user registered; email, hashpassword and salt save to database
	*/
	public function register()
	{
		$check = false;
    	$conn = DBConnection::createConnection();
		//create a random salt with min and max value, the salt is unique
		$salt = uniqid(mt_rand(1,mt_getrandmax()),true);
		//hash password
		$hashPass = hash('sha512', $this->password.$salt);
		
    	if($conn !== null) //successfully connected to database
    	{
			if($insert_statement = $conn->prepare('INSERT INTO user_profile (email, password, salt) VALUES (?, ?, ?)'))
			{
				$insert_statement->bind_param("sss", $this->email, $hashPass, $salt);
				$insert_statement->execute();
				$check= true;
			}
			else echo "Failed to prepare statement";
		}

		//close connection
		DBConnection::closeConnection();
		return $check;
		
	}
}
?>