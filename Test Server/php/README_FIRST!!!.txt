/****************************************************
This is note from Lam Lu and Chien Nguyen for a secure
registration and login system
*****************************************************/
This note is written based on our limited understanding 
of information security perspectives. If you find any
incorrect information, please correct them and let us
know so we can share experiences together.  

To make it easy to explain, we define the following:
iPhone app -> client side
php files  -> server side 
mysql      -> database
we are using MAMP/LAMP/WAMP as local server and php 
5.4.10 and above. 

/****************************************************
Security Aspects when creating a login/register system
*****************************************************/
Let say our server points to wwwroot folder to display the
website files such as html/php/jQuery/css..

- If you put a folder called php_folder that contains .php files. 
the user can access the php folder from browser like 
this : website-url/php_folder and they can see all the .php files.
To prevent this:
1. move the php_folder outside wwwroot folder and create a include.php
 file in wwwroot. The include.php will contain require_once(link to php_folder)
. so when you need to use php in php_folder, just use include.php
2. create a .htaccess 
	Options -Indexes 
	# or #
	IndexIgnore *
and put it into wwroot so all access to other folders without indexes
are denied


- All communication using TCP/IP (such as iPhone <-> php files)
must be in secure channel (such as SSL). Communication using Unix
socket (such as php <-> mysql when php is in the same machine/host 
with mysql) does not need secure channel since all communication 
can only passed through local hosts

- iPhone and php communication should be in background (possibly another thread?)
to make sure the communication does not freeze the main thread for the app.

- password has to be hashed with salt when storing into database

- salt and username have to unique. salt has to be long enough (256 or 512 bytes?)

- always use prepare statement in sql queries to prevent 
sql injections

- always close connection when done

- create specific user for the database(schema) you gonna use. don't 
use root user. need to change the root user password as well. for the specific user
, only grant the select/update/insert (possible delete) privileges. 

- if you are using php version below 5.4, make sure to read through register_global,
escape string and stripslash to understand the security issues about them.


- hash functions md5, sha256 are considerably broken, so do not user them

/****************************************************
		register procedure
*****************************************************/

1. Create a secure channel communication from client side
to server side

2. Get email and password from app from client side
let call them client-side-email and client-side-password

3. generate salt, salt has to be unique
salt is a random string;

4. hash the client-side-password with salt. 
hashed_password= hash (sha512, client-side-password + salt);

5. store salt, hashed_password, client-side-email into database



/****************************************************
		Login procedure
*****************************************************/
1. Create a secure channel communication from client side
to server side

2. Get email and password from app from client side
let call them client-side-email and client-side-password

3. In server side, get the email,password and salt
from database

4. Compare password == hash (client-side-password, salt)

5. if equal -> login success; failed otherwise






