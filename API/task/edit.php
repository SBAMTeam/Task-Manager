<?php
include_once '../config/database.php';

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$taskName;
$taskDetails;
$taskStartDate;
$taskDeadline;
$taskCreatorId;
$taskServerId;
$taskId;
$conn = null;

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$data = json_decode(file_get_contents("php://input"));

if (((!isset($data->taskName)) || (!isset($data->taskStartDate))) 
    || ((!isset($data->taskDeadline)) || (!isset($data->taskCreatorId)))
    || (isset($data->taskId)))
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "Task Editing failed, Missing variables"));
    die("Task Editing failed, Missing variables");
}

$taskName      = $data->taskName;
$taskStartDate = $data->taskStartDate;
$taskDeadline  = $data->taskDeadline;
$taskCreatorId = $data->taskCreatorId;
$taskDetails = $data->taskDetails;
$taskServerId = $data->taskServerId;
$taskId = $data->taskId;

$query = "UPDATE tasks SET Task_Descr  = :taskDescr,  Task_Detail = :taskDetail, 
                                Task_Start_Date = :taskStartDate, Task_End_Date = :taskEndDate,
                                creator_Id = :taskCreatorId, server_id = :taskServerId
          WHERE Task_id = :taskId";

$stmt = $conn->prepare($query);

$stmt->bindParam(':taskDescr', $taskName);
$stmt->bindParam(':taskDetail', $taskDetails);
$stmt->bindParam(':taskStartDate', $taskStartDate);
$stmt->bindParam(':taskEndDate', $taskDeadline);
$stmt->bindParam(':taskCreatorId', $taskCreatorId);
$stmt->bindParam(':taskServerId', $taskServerId);
$stmt->bindParam(':taskId', $taskId);

if($stmt->execute())
{
    http_response_code(200);
    echo json_encode(array("LogMessages" => "Task was successfully Updated.", "taskName" => $taskName,
                           "taskDetails" => $taskDetails, "taskStartDate" => $taskStartDate,
                           "taskDeadLine" => $taskDeadline, "taskServerId" => $taskServerId,
                           "taskId" => $taskId));
}
else
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "Unable to Update task.", "taskName" => $taskName,
                           "taskDetails" => $taskDetails, "taskStartDate" => $taskStartDate,
                           "taskDeadLine" => $taskDeadline, "taskServerId" => $taskServerId,
                           "taskId" => $taskId));
}
?>