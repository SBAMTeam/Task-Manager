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
    echo json_encode(array("LogMessages" => "variables are empty."));
    die("variables are empty.");
}

$userId = $data->userId;
$serverId = $data->serverId;

$query = "SELECT tasks.Task_id, tasks.Task_Descr, tasks.Task_Detail, 
                 tasks.Task_Start_Date, tasks.Task_End_Date , tasks.creator_Id
          from tasks join user_tasks UT on tasks.Task_id = UT.Task_ID
          where tasks.server_id = :serverId and UT.user_id = :userId";

$stmt = $conn->prepare($query);
$stmt->bindParam(':userId', $userId);
$stmt->bindParam(':serverId', $serverId);

$stmt->execute();
$rowNum = $stmt->rowCount();

if ($rowNum > 0)
{
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC))
    {
        $taskId         =   $row['Task_id']; 
        $taskName       =   $row['Task_Descr']; 
        $taskDetails    =   $row['Task_Detail'];
        $taskDeadline   =   $row['Task_Start_Date'];
        $taskStartDate  =   $row['Task_End_Date'];
        $taskCreatorId  =   $row['creator_Id'];
        $userTasks[] = array('taskId' => $taskId, 'taskName'=> $taskName,'taskDetails'=> $taskDetails,
                         'taskStartDate' => $taskStartDate, 'taskDeadline' => $taskDeadline,
                         'taskCreatorId' => $taskCreatorId);
    }
    echo $jsonformat=json_encode(array("userTasks" => $userTasks));
}
else
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "user does not have tasks on that server"));
}
?>