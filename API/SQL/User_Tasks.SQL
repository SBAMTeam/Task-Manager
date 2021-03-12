CREATE TABLE USER_Tasks
(
    User_ID Integer,
    Task_ID Integer,
    Server_ID Integer,
    STATUS_CODE Integer,
    FOREIGN KEY(User_ID)  REFERENCES Users(User_ID),
    FOREIGN KEY(Task_ID) REFERENCES tasks(Task_ID),
    FOREIGN KEY(Server_ID) REFERENCES servers(Server_ID),
    FOREIGN KEY(STATUS_CODE) REFERENCES datastatus(STATUS_CODE)
)	 ENGINE=InnoDB CHARSET=utf8;