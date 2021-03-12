CREATE TABLE Users 
(
    user_id Integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(128) NOT NULL,
    user_hash VARCHAR(128) NOT NULL,
    user_email VARCHAR(128),
    user_nick VARCHAR(250),
    STATUS_CODE integer,
    FOREIGN KEY(STATUS_CODE) REFERENCES datastatus(STATUS_CODE),
    INDEX (email) 
) ENGINE=InnoDB CHARSET=utf8;