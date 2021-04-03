<?php
include_once '../config/database.php';
require "../vendor/autoload.php";
use \Firebase\JWT\JWT;

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");


// $secret_key = "SOME_BIG_RANDOM_KEY";
// $jwt = null;
$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$data = json_decode(file_get_contents("php://input"));

if (!isset($data->userId) || !isset($data->serverCode))
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "failed to join server, one or more variables are empty."));
    die("failed to join server, one or more variables are empty.");
}

$userId = $data->userId;
$serverCode = $data->serverCode;

$query = "select Server_id from servers where Login_CODE = :serverCode LIMIT 0,1";

$stmt = $conn->prepare($query);

$stmt->bindParam(':serverCode', $serverCode);

$stmt->execute();
$rowNum = $stmt->rowCount();

if ($rowNum > 0)
{

    $row       = $stmt->fetch(PDO::FETCH_ASSOC);
    $serverID  = $row['Server_id'];
    //check if user exists
    $Existquery = "select User_ID from userservers where User_ID = :userId and SERVER_ID = :serverId LIMIT 0,1";

    $Existstmt = $conn->prepare($Existquery);

    $Existstmt->bindParam(':serverId', $serverID);
    $Existstmt->bindParam(':userId', $userId);
    
    $Existstmt->execute();
    $rowNum = $Existstmt->rowCount();
    if ($rowNum > 0)
    {
        http_response_code(400);
        echo json_encode(array("LogMessages" => "User exists in server"));
        die("User exists in server");
    }

    $query = "INSERT into userservers SET User_ID = :userID, SERVER_ID = :serverID";

    $stmt = $conn->prepare($query);

    $stmt->bindParam(':userID', $userId);
    $stmt->bindParam(':serverID', $serverID);

    if($stmt->execute())
    {
        http_response_code(200);
        echo json_encode(array("LogMessages" => "User successfully joined server", "serverId" => $serverID));
    }
    else
    {
        http_response_code(400);
        echo json_encode(array("LogMessages" => "User could not joined server"));
    }
}
else
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "Server was not found"));
}
?>