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

if (!isset($data->userId) || !isset($data->serverId))
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "failed to join server, one or more variables are empty."));
    exit();   
}

$userId = $data->userId;
$serverId = $data->serverId;

$query = "SELECT tasks.Task_Descr, tasks.Task_Detail, tasks.Task_Start_Date, tasks.Task_End_Date 
                from user_tasks UTask JOIN tasks ON UTask.Task_ID = tasks.Task_id
          where UTask.User_ID = :USER_ID AND UTask.Server_ID = :SERVER_ID";

$stmt = $conn->prepare($query);

$stmt->bindParam(':USER_ID'  , $userId);
$stmt->bindParam(':SERVER_ID', $serverId);

$stmt->execute();
$rowNum = $stmt->rowCount();

if ($rowNum > 0)
{
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC))
    {
        $TaskDescr      =   $row['Task_Descr']; 
        $TaskDetail     =   $row['Task_Detail'];
        $TaskEndDate    =   $row['Task_Start_Date'];
        $TaskStartDate  =   $row['Task_End_Date'];
        $Tasks[] = array('Describtion'=> $TaskDescr,'Detail'=> $TaskDetail,
                         'StartDate' => $TaskEndDate, 'EndDate' => $TaskEndDate);
    }
    echo $jsonformat=json_encode($Tasks);
}
else
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "Server was not found"));
}
?>