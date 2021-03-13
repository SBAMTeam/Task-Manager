<?php
session_start();
include_once '../config/database.php';
require "../vendor/autoload.php";
use \Firebase\JWT\JWT;

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$username = '';
$password = '';

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$data = json_decode(file_get_contents("php://input"));

if (!isset($data->username) || !isset($data->userhash))
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "Login failed, Empty username or password."));
    exit();
}

$username = $data->username;
$password = $data->userhash;

$query = "SELECT  * FROM users WHERE user_name = ? LIMIT 0,1";

$stmt = $conn->prepare($query);
$stmt->bindParam(1, $username);
$stmt->execute();
$num = $stmt->rowCount();

if($num > 0)
{
    $row       = $stmt->fetch(PDO::FETCH_ASSOC);
    $id        = $row['user_id'];
    $usernick  = $row['user_nick'];
    $email     = $row['user_email'];
    $userhash = $row['user_hash'];
    if($password == $userhash)
    {
        
        $keyVars = new HDVariables(); // here set your secret key and issuer claim and audience claim data
        $secret_key     = $keyVars->$hd_secret_key;
        $issuer_claim   = $keyVars->$hd_issuer_claim; 
        $audience_claim = $keyVars->$hd_audience_claim;

        $issuedat_claim = time(); // issued at
        $notbefore_claim = $issuedat_claim + 10; //not before in seconds
        $expire_claim = $issuedat_claim + 60; // expire time in seconds
        $token = array
        (
            "iss" => $issuer_claim,
            "aud" => $audience_claim,
            "iat" => $issuedat_claim,
            "nbf" => $notbefore_claim,
            "exp" => $expire_claim,
            "data" => array(
                "id" => $id,
                "nickname" => $usernick,
                "email" => $email
        ));

        http_response_code(200);

        $jwt = JWT::encode($token, $secret_key);
        echo json_encode(
            array(
                "LogMessages" => "Successful login.",
                "id" => $id,
                "Nickname" =>$usernick,
                "email" => $email,
                "jwt" => $jwt,
                "expireAt" => $expire_claim
            ));
    }
    else
    {

        http_response_code(400);
        echo json_encode(array("LogMessages" => "Login failed.", "password" => $password));
    }
}
?>