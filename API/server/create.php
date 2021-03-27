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

if ((!isset($data->serverName) || !isset($data->serverCode)) || !isset($data->serverOwnerId))
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "Server creation failed, one or more variables are empty."));
    die("Server creation failed, one or more variables are empty.");
}

$serverName    = $data->serverName;    
$serverCode    = $data->serverCode;
$serverOwnerId = $data->serverOwnerId;

$query = "INSERT INTO servers SET   Server_name = :serverName,
                                    Login_CODE  = :serverCode,
                                    Owner_ID 	= :ownerId,
                                    STATUS_CODE = 1";

$stmt = $conn->prepare($query);

$stmt->bindParam(':serverName', $serverName);
$stmt->bindParam(':serverCode', $serverCode);
$stmt->bindParam(':ownerId', $serverOwnerId);

if($stmt->execute())
{
    http_response_code(200);
    echo json_encode(array("logMessage" => " Server created successfully", "serverName" => $serverName,
                            "serverCode" => $serverCode, "serverOwnerId" => $serverOwnerId));
}
else
{
    http_response_code(400);
    echo json_encode(array("logMessage" => " Couldn't create server"));
}

?>