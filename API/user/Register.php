<?php
include_once '../config/database.php';

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$firstName = '';
$lastName = '';
$email = '';
$password = '';
$conn = null;

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$data = json_decode(file_get_contents("php://input"));

if ((!isset($data->userName) || !isset($data->userHash)) || (!isset($data->userEmail) || !isset($data->userNickname)))
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "Account Creation failed, Missing variables"));
    exit();
}

$username = $data->userName;
$userhash = $data->userHash;
$email = $data->userEmail;
$nickname = $data->userNickname;

$query = "INSERT INTO users SET user_name  = :username,  user_hash = :userhash, 
                                user_email = :useremail, user_nick = :nickname, 
                                STATUS_CODE = 1";

$stmt = $conn->prepare($query);

$stmt->bindParam(':username', $username);
$stmt->bindParam(':useremail', $email);
$stmt->bindParam(':nickname', $nickname);
$stmt->bindParam(':userhash', $userhash);


if($stmt->execute())
{
    http_response_code(200);
    echo json_encode(array("LogMessages" => "User was successfully registered.", "userName" => $username,
                           "userHash" => $userhash, "userEmail" => $email, "userNickname" => $nickname));
}
else
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "Unable to register the user.", "userName" => $username,
                           "userEmail" => $email, "userNickname" => $nickname));
}
?>