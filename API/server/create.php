<?php
include_once "../config/database.php";
require "../vendor/autoload.php";
use \Firebase\JWT\JWT;

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");


$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$data = json_decode(file_get_contents('php://input'));

$serverName = $data->serverName;    
$loginCode  = $data->serverCode;
$ownerId    = $data->ownerId;

$query = "INSERT INTO servers SET   Server_name = :serverName,
                                    Login_CODE  = :serverCode,
                                    Owner_ID 	= :ownerId,
                                    STATUS_CODE = 1";

$stmt = $conn->prepare($query);

$stmt->bindParam(':serverName', $serverName);
$stmt->bindParam(':loginCode', $serverCode);
$stmt->bindParam(':ownerId', $ownerId);

if($stmt->execute())
{
    http_response_code(200);
    echo json_encode(array("logMessage" => " Server created successfully"));
}
else
{
    http_response_code(400);
    echo json_encode(array("logMessage" => " Couldn't create server"));
}

?>