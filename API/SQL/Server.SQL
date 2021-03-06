CREATE TABLE Servers
(
    Server_id Integer AUTO_INCREMENT PRIMARY KEY,
    Server_name VARCHAR(250) NOT NULL,
    Login_CODE VARCHAR(250) NOT NULL,
    STATUS_CODE integer,
    Owner_ID integer,
    FOREIGN KEY(STATUS_CODE) REFERENCES datastatus(STATUS_CODE),
    FOREIGN KEY(Owner_ID) REFERENCES users(user_id)
) ENGINE=InnoDB CHARSET=utf8;