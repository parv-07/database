create database post; -- here we have creasted a database 
use post;             --   Herer we will now use the database post;
 
--we have created a table name user_profile for the user....
 create table user_profile(u_id int(20) NOT NULL Auto_increment Primary key,
  Name varchar(200),
   Email varchar(200),
   Password varchar(200));

--we have created a posts table in which we took a references from the table from the user_profile
create table posts(post_id int(20) auto_increment primary key,
date datetime default current_timestamp,
user_id int(20),
foreign key(user_id) references user_profile(u_id));
--modify the post table;
alter table posts add column post_desc varchar(255);

--for comment we have make a table comment which has user_id reference from the user taable and post_id reference form the post table
create table comment(c_id int auto_increment primary key, 
user_id int(20),foreign key(user_id) references user_profile(u_id),
post_id int(20),foreign key(post_id) references posts(post_id));
--modify the comment table;
alter table comment add column multi_comment int(20);
alter table comment add foreign key (multi_comment) references comment(c_id);
alter table comment add column comment_desc varchar(255);


--NEW TABLE FOR LIKE AND DISLIKES
create table likes(id int(100) auto_increment primary key,
like_dislike enum('like','dislike'),
user_id int(20),
foreign key(user_id) references user_profile(u_id),
post_id int(20), foreign key(post_id) references posts(post_id),
comment_id int(20),foreign key(comment_id) references comment(c_id));

-- --for comment within comment

-- create table multicomment(mc_id int auto_increment primary key,
-- comment_id int(20),foreign key(comment_id) references comment(c_id),
-- user_id int(20),foreign key(user_id) references user_profile(u_id));

-- --like a post
-- create table post_Like (id int auto_increment primary key, 
-- user_id int(20),foreign key(user_id) references user_profile(u_id),
-- post_id int(20),foreign key(post_id) references posts(post_id), 
-- islike boolean);

-- --dislike a post
-- create table post_Dislike (id int auto_increment primary key, 
-- user_id int(20),foreign key(user_id) references user_profile(u_id),
-- post_id int(20),foreign key(post_id) references posts(post_id), 
-- isdislike boolean);

User TABLE
+------+--------+--------------------+----------+
| u_id | Name   | Email              | Password |
+------+--------+--------------------+----------+
|    1 | parv   | parvbest123@gmail  | try123   |
|    2 | ayush  | ayushbest123@gmail | try123   |
|    4 | kashak | kashak@gmail.com   | 123      |
+------+--------+--------------------+----------+

Post table
+-----------+--------------+------+-----+-------------------+-------------------+
| Field     | Type         | Null | Key | Default           | Extra             |
+-----------+--------------+------+-----+-------------------+-------------------+
| post_id   | int          | NO   | PRI | NULL              | auto_increment    |
| date      | datetime     | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| user_id   | int          | YES  | MUL | NULL              |                   |
| post_desc | varchar(255) | YES  |     | NULL              |                   |
+-----------+--------------+------+-----+-------------------+-------------------+
values insert into posts;

+---------+---------------------+---------+----------------------+
| post_id | date                | user_id | post_desc            |
+---------+---------------------+---------+----------------------+
|       1 | 2023-04-09 23:48:44 |       1 | this is post by parv |
+---------+---------------------+---------+----------------------+


--all the posts by user 
+---------+---------------------+---------+----------------------+------+------+-------------------+----------+
| post_id | date                | user_id | post_desc            | u_id | Name | Email             | Password |
+---------+---------------------+---------+----------------------+------+------+-------------------+----------+
|       1 | 2023-04-09 23:48:44 |       1 | this is post by parv |    1 | parv | parvbest123@gmail | try123   |
+---------+---------------------+---------+----------------------+------+------+-------------------+----------+