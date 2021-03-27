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
$conn = null;

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$data = json_decode(file_get_contents("php://input"));

if ((!isset($data->taskName) || !isset($data->taskStartDate)) || (!isset($data->taskDeadline)))
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "Task Creation failed, Missing variables"));
    exit();
}

$taskName = $data->taskName;
$taskStartDate = $data->taskStartDate;
$taskDeadline = $data->taskDeadline;
if (isset($data->taskName))
{
    $taskDetails = $data->taskDetails;
}
else
{
    $taskDetails = " ";
}
$query = "INSERT INTO tasks SET Task_Descr  = :taskDescr,  Task_Detail = :taskDetail, 
                                Task_Start_Date = :taskStartDate, Task_End_Date = :taskEndDate";

$stmt = $conn->prepare($query);

$stmt->bindParam(':taskDescr', $taskName);
$stmt->bindParam(':taskDetail', $taskDetails);
$stmt->bindParam(':taskStartDate', $taskStartDate);
$stmt->bindParam(':taskEndDate', $taskDeadline);

$taskName;
$taskDetails;
$taskStartDate;
$taskDeadline;

if($stmt->execute())
{
    http_response_code(200);
    echo json_encode(array("LogMessages" => "Task was successfully Created.", "taskName" => $taskName,
                           "taskDetails" => $taskDetails, "taskStartDate" => $taskStartDate,
                           "taskDeadLine" => $taskDeadline));
                        }
else
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "Unable to create task.", "taskName" => $taskName,
                           "taskDetails" => $taskDetails, "taskStartDate" => $taskStartDate,
                           "taskDeadLine" => $taskDeadline));
}
?>