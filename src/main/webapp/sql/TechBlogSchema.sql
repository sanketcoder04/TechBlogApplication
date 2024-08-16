CREATE DATABASE techblog;
USE techblog;

CREATE TABLE users (
	name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL PRIMARY KEY,
    password VARCHAR(20) NOT NULL,
    gender VARCHAR(6) NOT NULL,
    about VARCHAR(100),
    signupdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    profile VARCHAR(100) DEFAULT 'default.png'
);
DROP TABLE users;
SELECT * FROM users;

SET SQL_SAFE_UPDATES = 0;		-- for testing purpose
INSERT INTO users(name,email,password,gender) VALUES
("Sanket","sanketganguly545@gmail.com","sanket@tech","male");
DELETE FROM users WHERE email = 'sanket@gmail.com';


CREATE TABLE categories (
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100)
);
DROP TABLE categories;
SELECT * FROM categories;
DESCRIBE categories;

INSERT INTO categories(name,description) VALUES
("PROGRAMMING","Programming is most fundamental in IT Industry"),
("SOFTWARE DEVELOPMENT","The most essential part of IT Industry"),
("FRONTEND DEVELOPMENT","The most required part for User Experience"),
("BACKEND DEVELOPMENT","The most essential part for any Dynamic Application");


CREATE TABLE posts (
	post_id INT PRIMARY KEY AUTO_INCREMENT,
    post_title VARCHAR(150) NOT NULL,
    post_content LONGTEXT,
    post_code LONGTEXT,
    post_link LONGTEXT,
    post_time TIMESTAMP DEFAULT NOW(),
    user_email VARCHAR(50),
    FOREIGN KEY (user_email) REFERENCES users(email)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
DROP TABLE posts;
SELECT * FROM posts;
DESCRIBE posts;

INSERT INTO posts(post_title, post_content, user_email, category_id) VALUES 
("Java Programming", "Java is a high level programming language required for software development", "sanketganguly545@gmail.com", 1);

DELETE FROM posts WHERE post_id = 1;