create database class;

create table std (
id int not null unique identity,
name varchar(90),
email varchar(90) unique,
age int check(age>=17)
);
insert into std (name , email, age) values('irfan' , 'irfan@gmail.com',37),('ali' , 'ali@gmail.com',24),
('rohan' , 'rohan@gmail.com',17),('abbas' , 'abbas@gmail.com',21),('azeem' , 'azeem@gmail.com',32),
('hamza' , 'hamza@gmail.com',18),('new' , 'new@gmail.com',22),('bashir' , 'bashir@gmail.com',33);

select * from std;

select count(*) from std where name  like 'a%';

select * from std where id  between 2 and 13;

select * from std where id = 11 or id = 9;

select distinct age from std;

select * from std where name  like 'a%';

alter table std add phone varchar(92);

update std set name = 'hashim' , email = 'hashim@gmail.com' where id = 12;

select * from std where age not in (26 , 11);

select * from std where name = 'hamza' and age = 13 or age= 12;

select * from std where name = 'hamza' and age = 13 ;

select * from std ;

select * from std where (name = 'affan' or name ='ali') and age= 16;

select * from std order by name asc;