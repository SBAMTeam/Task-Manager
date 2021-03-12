CREATE TABLE Group_Perms
(
    GROUP_ID Integer,
  	Perm_Code integer,
	Allow Integer,
    FOREIGN KEY(GROUP_ID) REFERENCES groups(GROUP_ID),
    FOREIGN KEY(PERM_CODE) REFERENCES permissions(PERM_CODE)
) ENGINE=InnoDB CHARSET=utf8;