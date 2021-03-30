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

if (!isset($data->taskUserId) || !isset($data->taskServerId))
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "failed to join server, one or more variables are empty."));
    die("failed to join server, one or more variables are empty.");
}

$taskUserId = $data->taskUserId;
$taskServerId = $data->taskServerId;

$query = "SELECT tasks.Task_Descr, tasks.Task_Detail, tasks.Task_Start_Date, tasks.Task_End_Date 
                from user_tasks UTask JOIN tasks ON UTask.Task_ID = tasks.Task_id
          where UTask.User_ID = :USER_ID AND UTask.Server_ID = :SERVER_ID";

$stmt = $conn->prepare($query);

$stmt->bindParam(':USER_ID'  , $taskUserId);
$stmt->bindParam(':SERVER_ID', $taskServerId);

$stmt->execute();
$rowNum = $stmt->rowCount();

if ($rowNum > 0)
{
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC))
    {
        $taskName      =   $row['Task_Descr']; 
        $taskDetails     =   $row['Task_Detail'];
        $taskDeadline    =   $row['Task_Start_Date'];
        $taskStartDate  =   $row['Task_End_Date'];
        $Tasks[] = array('taskName'=> $taskName,'taskDetails'=> $taskDetails,
                         'taskStartDate' => $taskStartDate, 'taskDeadline' => $taskDeadline);
    }
    echo $jsonformat=json_encode($Tasks);
}
else
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "Server was not found"));
}
?>