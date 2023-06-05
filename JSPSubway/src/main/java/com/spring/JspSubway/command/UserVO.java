package com.spring.JspSubway.command;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

/*
 #
CREATE TABLE subUsers (
    user_id VARCHAR(100) PRIMARY KEY,
    user_pw VARCHAR(100) NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    user_email1 VARCHAR(50), 
    user_email2 VARCHAR(50)
);
 */

@Getter @Setter @ToString
public class UserVO {
	
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail1;
	private String userEmail2;
	
};
