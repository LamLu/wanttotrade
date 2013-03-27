<?php
/**
 * This is a static class to create the connection to database
 * @author Lam Lu
 * @copyright 2013 @ HiDev Mobile
 */
class DBConnection
{

    private static $db_server = "localhost";
    private static $db_username = "testAdmin";
    private static $db_password = "testadmin";
    private static $db_name = "user_schema";
    private static $conn = null;    
    
    
    /**
     *function to create the connection
     *@return conn if success, null otherwise
     */
    public static function createConnection()
    {
        self::$conn = new mysqli(self::$db_server,self::$db_username, 
        		self::$db_password, self::$db_name);
        if(mysqli_connect_errno())//error connecting
        {
            echo("error connecting");
            return null;
        }
        return self::$conn;
    }
    
    /**
     *function to close the connection
     */
    public static function closeConnection()
    {
        if (self::$conn != null)
            self::$conn->close();
    }
}
?>