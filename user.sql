use jspsubway; #DB Name;

SELECT * FROM users;

set sql_safe_updates=0;

delete from users where user_pw= 'rlagudcjf';

#유저 정보
CREATE TABLE users (
    user_id VARCHAR(100) PRIMARY KEY,
    user_pw VARCHAR(100) NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    user_email1 VARCHAR(50), 
    user_email2 VARCHAR(50)
);

DROP TABLE users;