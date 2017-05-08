--회원 테이블
create table member(
	memnum    number(5)		  constraint	member_mnum_pk	primary key,	--회원번호
	email     varchar2(50)	constraint	member_email_uk	unique	not null,	--아이디
	name      varchar2(10)	not null,         	--회원이름
	pwd       varchar2(16)	not null,         	--비밀번호
	tel       varchar2(12)	not null,         	--연락처
	post1     varchar2(3)	null,         		--우편번호1
	post2     varchar2(3)	null,         		--우편번호2
	addr1     varchar2(500)	null,             	--신주소
	addr2     varchar2(500)	null,             	--구주소
	joindate  date			default sysdate,	--가입 날짜 (SNS유저는 최초 로그인날짜)
	logindate date          default sysdate,	--로그인 날짜
    buyCount  number(5)     default 0,      	--구매횟수
    sellCount number(5)     default 0,        	--판매횟수
	sns       varchar2(10)	default 'remania' 	--sns로그인 (null이면 momo유저)
);

drop table member;

create sequence member_seq minvalue 0;

insert into member(memnum, email, name, pwd, tel, post1, post2, addr1, addr2, joindate, logindate,
                    buyCount, sellCount, sns)
values(member_seq.nextval, 'admin', '관리자', '123', '010', '123', '456', '주소1', '주소2',
        sysdate, sysdate, 0, 0, 'remania');
        
commit;