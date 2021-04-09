<?php
include_once '../config/database.php';
require "../vendor/autoload.php";
use \Firebase\JWT\JWT;

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$data = json_decode(file_get_contents("php://input"));

if (!isset($data->userId))
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "variables are empty."));
    die("variables are empty.");
}

$userId = $data->userId;

$query = "SELECT servers.Server_id, servers.Owner_ID, servers.Server_name
                  FROM userservers UServer JOIN servers 
                  ON UServer.SERVER_ID = servers.server_ID 
                  WHERE user_id = :userId";

$stmt = $conn->prepare($query);
$stmt->bindParam(":userId", $userId);

$stmt->execute();
$rowNum = $stmt->rowCount();

if ($rowNum > 0)
{
    $stmt->execute();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC))
    {
        $rowServerId    = $row['Server_id']; 
        $rowServerName  = $row['Server_name'];
	    $rowServerOwner = $row['Owner_ID'];
        $userServers[] = array('serverId'=>$rowServerId ,'serverName'=> $rowServerName, 'serverOwnerId'=> $rowServerOwner);
    }
    echo $jsonformat=json_encode(array("userServers" => $userServers));
}
else
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "user is not registered on any server"));
}
?>