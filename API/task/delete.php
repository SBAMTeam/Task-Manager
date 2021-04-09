<?php
include_once '../config/database.php';

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$taskId;

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$data = json_decode(file_get_contents("php://input"));

if (isset($data->taskId))
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "Task Deletion failed, Missing variables"));
    die("Task Deletion failed, Missing variables");
}

$taskId = $data->taskId;

$query = "UPDATE tasks SET STATUS_CODE = 0; 
          WHERE Task_id = :taskId";

$stmt = $conn->prepare($query);

$stmt->bindParam(':taskId', $taskId);

if($stmt->execute())
{
    http_response_code(200);
    echo json_encode(array("LogMessages" => "Task was successfully Deleted.", "taskId" => $taskId));
}
else
{
    http_response_code(400);
    echo json_encode(array("LogMessages" => "Unable to Delete task.", "taskId" => $taskId));
}
?>