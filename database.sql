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

--for comment we have make a table comment which has user_id reference from the user taable and post_id reference form the post table
create table comment(c_id int auto_increment primary key, 
user_id int(20),foreign key(user_id) references user_profile(u_id),
post_id int(20),foreign key(post_id) references posts(post_id));

--for comment within comment

create table multicomment(mc_id int auto_increment primary key,
comment_id int(20),foreign key(comment_id) references comment(c_id),
user_id int(20),foreign key(user_id) references user_profile(u_id));

--like a post
create table post_Like (id int auto_increment primary key, 
user_id int(20),foreign key(user_id) references user_profile(u_id),
post_id int(20),foreign key(post_id) references posts(post_id), 
islike boolean);

--dislike a post
create table post_Dislike (id int auto_increment primary key, 
user_id int(20),foreign key(user_id) references user_profile(u_id),
post_id int(20),foreign key(post_id) references posts(post_id), 
isdislike boolean);
