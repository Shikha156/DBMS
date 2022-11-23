create database bank1_singh;
use bank1_singh;

create table branch
(branch_name varchar(30) primary key,
branch_city varchar(30) ,
assets int
);

create table bank_account
(acc_no int primary key ,
branch_name varchar(30),
foreign key(branch_name)references branch(branch_name),
balance int
);

create table bank_customer
(customer_name varchar(30) primary key,
customer_street varchar(30),
city varchar(30)
);

create table depositor
(customer_name varchar(30) ,
acc_no int ,foreign key(customer_name)references bank_customer(customer_name),
foreign key(acc_no)references bank_account(acc_no));

create table loan
(loan_number varchar(30) primary key,
branch_name varchar(30),
amount int,
foreign key(branch_name)references branch(branch_name)
);

insert into branch
 values("SBI_CHAMRAJPET","BANGLORE",50000),("SBI_RESIDENCYROAD","BANGLORE",10000),("SBI_SHIVAJIROAD","BOMBAY",20000),("SBI_PARLIMENTROAD","DELHI",10000),("SBI_JANTARMANTAR","DELHI",20000);

select* from branch;


insert into bank_account
values(1,"SBI_CHAMRAJPET",2000),(2,"SBI_RESIDENCYROAD",5000),(3,"SBI_SHIVAJIROAD",6000),(4,"SBI_PARLIMENTROAD",9000),(5,"SBI_JANTARMANTAR",8000);

select* from bank_account;

insert into bank_customer
values("Avinash","bull_temple_road","BANGLORE"),("Dinesh","bannerghatta_road","BANGLORE"),("Mohan","nationalcollege_road","BANGLORE"),("Nikhill","akbar_road","DELHI"),("Ravi","prithviraj_road","DELHI");


select* from bank_customer;

insert into depositor
values("Avinash",1),("Dinesh",2),("Mohan",3),("Nikhill",4),("Ravi",5);
select * from depositor;
insert into loan
values("1038A","SBI_CHAMRAJPET",1000),("1034B","SBI_RESIDENCYROAD",2000),("1113C","SBI_SHIVAJIROAD",3000),("11325D","SBI_PARLIMENTROAD",4000),("113654E","SBI_JANTARMANTAR",5000);
select *from loan;


select branch_name,assets/100000 as assets_in_lacks from branch;

select d.customer_name from depositor d, bank_account a where
d.acc_no=a.acc_no group by a.branch_name having(count(a.acc_no)>=2) and
a.branch_name="SBI_RESIDENCYROAD";

create view ab as select branch_name, sum(amount)
from loan
group by branch_name;
select * from ab;
select * from bank_account;

select a.branch_name, a.balance+1000 as updated_balance
from bank_account a, bank_customer b, depositer d
where b.customer_name=d.customer_name and
a.acc_no=d.acc_no and b.customer_city='Bangalore';
