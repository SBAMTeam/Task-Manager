CREATE TABLE USERSERVERS
(
    User_ID Integer,
  	SERVER_ID Integer,
    FOREIGN KEY(User_ID)  REFERENCES Users(User_ID),
    FOREIGN KEY(SERVER_ID) REFERENCES servers(SERVER_ID)
) ENGINE=InnoDB CHARSET=utf8;

ALTER TABLE `userservers` ADD UNIQUE `unique_index`(`user_Id`, `server_id`);