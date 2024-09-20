-- member(회원) table
create table member(
  num int primary key auto_increment,
  id varchar(20) not null,
  pass varchar(20) not null,
  name varchar(30) not null,
  age int not null,
  email varchar(30) not null,
  phone varchar(30) not null,
  unique key(id)
);

-- SQL(CRUD), JDBC
-- 검색
select * from member1;

select * from member where num=5;

-- insert(저장)
insert into member(id, pass, name, age, email, phone) 
values('admin','admin','관리자',40,'admin@naver.com','010-2345-6789');

-- update(수정)
update member set age=45, phone='010-1111-2222' where id='admin';

-- delete(삭제)
delete from member where id='admin';

drop table member;

-- filename 컬럼 추가한 member1 table 생성
create table member1(
  num int primary key auto_increment,
  id varchar(20) not null,
  pass varchar(20) not null,
  name varchar(30) not null,
  age int not null,
  email varchar(30) not null,
  phone varchar(30) not null,
  filename varchar(100),
  unique key(id)
);
