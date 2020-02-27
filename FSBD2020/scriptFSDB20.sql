DROP TABLE old_movies CASCADE CONSTRAINTS;
DROP TABLE old_users CASCADE CONSTRAINTS;
DROP TABLE old_events CASCADE CONSTRAINTS;

CREATE TABLE old_movies(
color VARCHAR2(100), 
director_name VARCHAR2(100), 
num_critic_for_reviews VARCHAR2(100), 
duration VARCHAR2(100), 
director_facebook_likes VARCHAR2(100), 
actor_3_facebook_likes VARCHAR2(100), 
actor_2_name VARCHAR2(100), 
actor_1_facebook_likes VARCHAR2(100), 
gross VARCHAR2(100), 
genre1 VARCHAR2(30), 
genre2 VARCHAR2(30), 
genre3 VARCHAR2(30), 
genre4 VARCHAR2(30), 
genre5 VARCHAR2(30), 
actor_1_name VARCHAR2(100), 
movie_title VARCHAR2(100), 
num_voted_users VARCHAR2(100), 
cast_total_facebook_likes VARCHAR2(100), 
actor_3_name VARCHAR2(100), 
facenumber_in_poster VARCHAR2(100), 
keyword1 VARCHAR2(50), 
keyword2 VARCHAR2(50), 
keyword3 VARCHAR2(50), 
keyword4 VARCHAR2(50), 
keyword5 VARCHAR2(50), 
movie_imdb_link VARCHAR2(100), 
num_user_for_reviews VARCHAR2(100), 
language VARCHAR2(100), 
country VARCHAR2(100), 
content_rating VARCHAR2(100), 
budget VARCHAR2(100), 
title_year VARCHAR2(100), 
actor_2_facebook_likes VARCHAR2(100), 
imdb_score VARCHAR2(100), 
aspect_ratio VARCHAR2(100), 
movie_facebook_likes VARCHAR2(100)
);

CREATE TABLE old_users(
nickname    VARCHAR2(100), 
passw       VARCHAR2(100), 
name        VARCHAR2(100), 
surname     VARCHAR2(100), 
sec_surname VARCHAR2(100), 
eMail       VARCHAR2(100), 
phoneN      VARCHAR2(14), 
citizenID   VARCHAR2(9), 
birthdate   VARCHAR2(10),  
age         NUMBER(3),  
contractId  VARCHAR2(16),  
address     VARCHAR2(100),  
town        VARCHAR2(100), 
ZIPcode     VARCHAR2(10),
country     VARCHAR2(100),  
startdate   VARCHAR2(10),
enddate     VARCHAR2(10), 
contract_type VARCHAR2(50)
);

CREATE TABLE old_events(
Etype     VARCHAR(12),
client   VARCHAR2(35), 
club     VARCHAR(60),
ev_date  VARCHAR2(10), 
ev_hour  VARCHAR2(5), 
subject  VARCHAR2(100), 
message  VARCHAR2(1500), 
details1 VARCHAR2(99), 
details2 VARCHAR2(99)
); 


-- WORKLOAD
set define off
@'C:\Users\torib\Desktop\base de datos\FSBD2020\mypelis.sql'
@'C:\Users\torib\Desktop\base de datos\FSBD2020\users.sql'
@'C:\Users\torib\Desktop\base de datos\FSBD2020\events00.sql'

