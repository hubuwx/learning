<?php // Getting Checking user's account to allow login
require_once 'config.php';
$postdata = file_get_contents("php://input");
    $request = json_decode($postdata);
 	@$username = $request->login;
	@$email = $request->email;
	@$lastName = $request->lastname;
	@$name = $request->name;
	@$pass = $request->pass;
	@$phone = $request->phone;
	
$query="INSERT INTO user(name, lastName, login, password, email, phone) VALUES ('$name','$lastName','$username','$pass','$email','$phone') ";	
$result = $db->query($query) or die($db->error.__LINE__); 
if($result){
	$response = array("message" => "User Added Succefully to DB", "success" => true);
	}
else
{
	$response = array("code" => mysql_errno(), "message" => mysql_error(), "success" => false);
	
}


echo $json_response = json_encode($response);
 
?>