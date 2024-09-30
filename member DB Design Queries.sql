# Member Information
use member_db_design;
create table Members(uid int primary key);
insert into Members values(222),
						  (111),
						  (444),
						  (333);
select * from Members;

alter table Members
add EMAIL varchar(13);
alter table Members
drop EMAIL;

alter table Members
add name varchar(13);
update Members set name='chandu' where uid=111;
update Members set name='ravi' where uid=222;
update Members set name='charvi' where uid=333;
update Members set name='anjana' where uid=444;

alter table Members
add gender varchar(13);

update Members set gender='female' where uid=111;
update Members set gender='male' where uid=222;
update Members set gender='female' where uid=333;
update Members set gender='female' where uid=444;

select * from Members;


# 1.PERSONAL INFORMATION

create table personalDetailss(
uid int primary key,
name varchar(20),
age int check(age>18),
foreign key(uid) references Members(uid));

insert into personalDetailss values(111,'chandu',24),
								(222,'ravi',30),
                                (333,'charvi',20),
                                (444,'anjana',23);

update personalDetailss set name='niru' where uid=111;

alter table personalDetailss
add PAN varchar(13);
update personalDetailss set PAN='bmzpv326' where uid=111;
update personalDetailss set PAN='cgcg22' where uid=222;
update personalDetailss set PAN='ggg32' where uid=333;
update personalDetailss set PAN='fg578f' where uid=444;
select * from personalDetailss;


# 2.EDUCATIONAL INFORMATION
create table education_Information(
  uid int,
   clg_name varchar(30),
   marks int,
   percenage int,
   class varchar(5),
   foreign key(uid) references Members(uid));
   insert into education_Information values(111,'gvp',800,80,'cse'),
                                    (333,'chaitanya',700,70,'ece'),
									(222,'narayana',600,60,'eee');
                                    
alter table education_Information
add RollNo int unique;

update education_Information set RollNo =101 where uid=111;
update education_Information set RollNo =102 where uid=222;
update education_Information set RollNo =103 where uid=333;

select * from education_Information;
   
   
   
# 3.EMPLOYMENT DETAILS
create table employee_Details(
uid int primary key,
name varchar(30),
salary int,
company_name varchar(15),
foreign key(uid) references Members(uid));
insert into employee_Details values(111,'chandu',6000,'ibc');
insert into employee_Details values(222,'ravi',7000,'ibc');
insert into employee_Details values(333,'charvi',8000,'ibc');
insert into employee_Details values(444,'anjana',9000,'ibc');


alter table employee_Details
add Role varchar(15) not null;
update employee_Details set Role ='developer' where uid=111;
update employee_Details set Role ='tester' where uid=222;
update employee_Details set Role ='hr' where uid=333;
update employee_Details set Role ='team lead' where uid=444;
select * from employee_Details;


# 4. CONTACT DETAILS
create table contactIno(
uid int,
phone_number BIGINT,
Email varchar(20) unique,
foreign key(uid)references Members(uid));
insert into contactIno values(222,1234567890,'abc@gmail.com'),
                           (333,2345678909,'xyz@gmail.com');
                           commit;

alter table contactIno
add linkedinId varchar(30);
update contactIno set linkedinId ='abc_dhf' where uid=222;
update contactIno set linkedinId ='app_dev' where uid=333;

alter table contactIno
drop column linkedId;
select * from contactIno;




# 5.ADDRESS DETAILS 

create table addressInformation(
uid int,
city varchar(20),
state varchar(20),
pincode int(10) not null,
country varchar(20),
foreign key(uid) references Members(uid)
);
insert into addressInformation values(111,'Durg','CG',491441,'India'),
						(222,'Rajnandgaon','CG',491442,'India'),
                        (333,'Vizag','AP',532201,'India');
                        select * from addressInformation;
 # 6.Bank details           
create table bankInfo
(
 accnum bigint primary key,
 code varchar(10),
 bname varchar(20),
 uid int,
 foreign key(uid) references Members(uid)
);

insert into bankInfo values(12341,'123axl','axis',111),
                       (76543,'321bob','bob',222),
                       (11111,'566hdfc','hdfc',333);
                       commit;
                       
                      
alter table bankInfo
add name varchar(30);
update bankInfo set name ='ravi' where uid=222;
update bankInfo set name ='chandu' where uid=111;
update bankInfo set name ='anjana' where uid=444;
update bankInfo set name ='charvi' where uid=333;

 select * from bankInfo;

commit;
