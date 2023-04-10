create database post; -- here we have creasted a database 
use post;             --   Herer we will now use the database post;
 
--we have created a table name user_profile for the user....
 create table user_profile(u_id int(20) NOT NULL Auto_increment Primary key,
  Name varchar(200),
   Email varchar(200),
   Password varchar(200));

--we have created a posts table in which we took a references from the table from the user_profile
 create table posts(post_id int(20) auto_increment primary key,date datetime default current_timestamp,post_desc varchar(250),user_id int,foreign key(user_id) references user_profile(u_id) on delete cascade);

--for comment we have make a table comment which has user_id reference from the user taable and post_id reference form the post table
create table comment (id int primary key , comment_desc varchar(255),user_id int not null, foreign key(user_id) references user_profile(u_id) on delete cascade,post_id int,foreign key(post_id) references posts(post_id) on delete cascade,comment_id int not null, foreign key(comment_id) references comment(id) on delete cascade);

--NEW TABLE FOR LIKE AND DISLIKES
create table likes(id int auto_increment primary key,like_dislike enum('like','dislike'),user_id int not null,foreign key(user_id) references user_profile(u_id) on delete cascade,post_id int, foreign key(post_id) references posts(post_id) on delete cascade,comment_id int,foreign key(comment_id) references comment(id) on delete cascade);

benifits of using delete cascade it will automatically delete the post generated by the user if we delete the user from user_profile

+---------+---------------------+---------------+---------+
| post_id | date                | post_desc     | user_id |
+---------+---------------------+---------------+---------+
|       1 | 2023-04-10 13:41:26 | post by miccu |       4 |
|       2 | 2023-04-10 13:41:39 | post by ayush |       2 |
+---------+---------------------+---------------+---------+


mysql> delete from user_profile where u_id=4;


mysql> select * from posts;
+---------+---------------------+---------------+---------+
| post_id | date                | post_desc     | user_id |
+---------+---------------------+---------------+---------+
|       2 | 2023-04-10 13:41:39 | post by ayush |       2 |
+---------+---------------------+---------------+---------+
after deleting the index will be lost; for example i have deleted miccu(having id =4) from table and now i again add the miccu so it will now have an index of 5 rather than 4;

+------+--------+------------------+----------+   
| u_id | Name   | Email            | Password |
+------+--------+------------------+----------+
|    1 | parv   | parv@gmail.com   | aba      |
|    2 | ayush  | ayush@gmail.com  | abc      |   
|    3 | kashak | kashak@gmail.com | kbc      |
|    5 | micccu | miccu@gmail.com  | mbc      |
+------+--------+------------------+----------+

                                                   DATA IN POST TABLE 
+---------+---------------------+---------------+---------+
| post_id | date                | post_desc     | user_id |
+---------+---------------------+---------------+---------+
|       1 | 2023-04-10 14:03:08 | post by miccu |       5 |
|       2 | 2023-04-10 14:03:11 | post by ayush |       2 |
+---------+---------------------+---------------+---------+

                                                   DATA IN COMMENT TABLE

                                                   
+----+--------------+---------+---------+------------+
| id | comment_desc | user_id | post_id | comment_id |
+----+--------------+---------+---------+------------+
|  1 | wow miccu    |       1 |       1 |          1 |
|  2 | true parv    |       2 |       1 |          1 |
+----+--------------+---------+---------+------------+

                                                      Data in Like table
+----+--------------+---------+---------+------------+
| id | like_dislike | user_id | post_id | comment_id |
+----+--------------+---------+---------+------------+
|  1 | like         |       1 |       1 |       NULL |
|  2 | like         |       1 |    NULL |          2 |
|  3 | like         |       3 |    NULL |          2 |
|  4 | dislike      |       1 |    NULL |          1 |
|  5 | dislike      |       5 |    NULL |          1 |
+----+--------------+---------+---------+------------+
5 rows in set (0.00 sec)


All the post of user;

+---------+---------------------+---------------+---------+------+--------+-----------------+----------+
| post_id | date                | post_desc     | user_id | u_id | Name   | Email           | Password |
+---------+---------------------+---------------+---------+------+--------+-----------------+----------+
|       1 | 2023-04-10 14:03:08 | post by miccu |       5 |    5 | micccu | miccu@gmail.com | mbc      |
|       2 | 2023-04-10 14:03:11 | post by ayush |       2 |    2 | ayush  | ayush@gmail.com | abc      |
+---------+---------------------+---------------+---------+------+--------+-----------------+----------+
2 rows in set (0.01 sec)

fetch all the comment of user

+----+--------------+---------+---------+------------+------+-------+-----------------+----------+
| id | comment_desc | user_id | post_id | comment_id | u_id | Name  | Email           | Password |
+----+--------------+---------+---------+------------+------+-------+-----------------+----------+
|  1 | wow miccu    |       1 |       1 |          1 |    1 | parv  | parv@gmail.com  | aba      |
|  2 | true parv    |       2 |       1 |          1 |    2 | ayush | ayush@gmail.com | abc      |
+----+--------------+---------+---------+------------+------+-------+-----------------+----------+
                                                       
                                                       Fetch all comment of post
+---------+---------------------+---------------+---------+----+--------------+---------+---------+------------+
| post_id | date                | post_desc     | user_id | id | comment_desc | user_id | post_id | comment_id |
+---------+---------------------+---------------+---------+----+--------------+---------+---------+------------+
|       1 | 2023-04-10 14:03:08 | post by miccu |       5 |  1 | wow miccu    |       1 |       1 |          1 |
|       1 | 2023-04-10 14:03:08 | post by miccu |       5 |  2 | true parv    |       2 |       1 |          1 |
+---------+---------------------+---------------+---------+----+--------------+---------+---------+------------+