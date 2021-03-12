CREATE TABLE user_Perms
(
    User_ID Integer,
    Perm_Code integer,
    Allow Integer,
    FOREIGN KEY(User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY(PERM_CODE) REFERENCES permissions(PERM_CODE)
) ENGINE=InnoDB CHARSET=utf8;