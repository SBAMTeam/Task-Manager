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

$query =    "SELECT tasks.Task_id, tasks.Task_Descr, tasks.Task_Detail, tasks.Task_Start_Date,
            tasks.Task_End_Date, tasks.creator_Id, user_tasks.User_ID AS 'Assigned_User'
            FROM tasks LEFT JOIN user_TASKS
            on tasks.Task_id = user_tasks.Task_ID
            WHERE tasks.server_id = :serverId
            AND tasks.STATUS_CODE = 1";

$stmt = $conn->prepare($query);
$stmt->bindParam(":serverId", $serverId);

$stmt->execute();
$rowNum = $stmt->rowCount();

if ($rowNum > 0)
{
    $stmt->execute();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC))
    {
        $taskId             =   $row['Task_id']; 
        $taskName           =   $row['Task_Descr']; 
        $taskDetails        =   $row['Task_Detail'];
        $taskDeadline       =   $row['Task_Start_Date'];
        $taskStartDate      =   $row['Task_End_Date'];
        $taskCreatorId      =   $row['creator_Id'];
        $taskAssignedUser   =   $row['Assigned_User'];
        $serverTasks[] = array('taskId' => $taskId, 'taskName'=> $taskName,'taskDetails'=> $taskDetails,
                         'taskStartDate' => $taskStartDate, 'taskDeadline' => $taskDeadline,
                         'taskCreatorId' => $taskCreatorId, 'taskAssignedUser' => $taskAssignedUser);
    }
    echo $jsonformat=json_encode(array("serverTasks" => $serverTasks));
}
else
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "SERVER does NOT have any TASKS"));
}
?>