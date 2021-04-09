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

if (!isset($data->serverId))
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "variables are empty."));
    die("variables are empty.");
}

$serverId = $data->serverId;

$query = "SELECT users.user_id, users.user_name, users.user_nick, US.SERVER_ID 
          FROM users JOIN userservers US
          on users.user_id = US.User_ID
          Where US.SERVER_ID = :ServerId";

$stmt = $conn->prepare($query);
$stmt->bindParam(":ServerId", $serverId);

$stmt->execute();
$rowNum = $stmt->rowCount();

if ($rowNum > 0)
{
    $stmt->execute();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC))
    {
        $rowUserId    = $row['user_id']; 
        $rowUserName  = $row['user_name'];
	    $rowUserNick = $row['user_nick'];
        $rowServerId = $row['SERVER_ID'];
        $serverMembers[] = array('userId'=>$rowUserId ,'userName'=> $rowUserName, 'userNick'=> $rowUserNick,
                               'serverId' => $rowServerId);
    }
    echo $jsonformat=json_encode(array("serverMembers" => $serverMembers));
}
else
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "server does not have any members"));
}
?>