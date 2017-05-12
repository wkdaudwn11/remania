--회원 테이블
create table member(
	membernum    number(5)		  constraint	member_mnum_pk	primary key,--회원번호
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
	sns       varchar2(10)	default 'remania' 	--sns로그인 (remania면 일반회원)
);

create sequence member_seq minvalue 0;

insert into member(membernum, email, name, pwd, tel, post1, post2, addr1, addr2, joindate, logindate,
                    buyCount, sellCount, sns)
values(member_seq.nextval, 'admin', '관리자', '123', '010', '123', '456', '주소1', '주소2',
        sysdate, sysdate, 0, 0, 'remania');
        
--자유게시판 테이블
create table freeBoard(
	freeboardnum	number(4)		constraint freeBoard_freeBoard_pk primary key,--게시판번호
	email       	varchar2(16)	not null,		--작성자의 이메일
	author			varchar2(16)	not null,		--작성자 이름
	title	  		varchar2(50)	not null,		--제목
	content			varchar2(4000)	not null,		--내용
	writeday		date		    default sysdate,--작성일
	readcnt			number(4)		default 0,		--조회
	replecnt 		number(4)       default 0,      --댓글수
	constraint freeboard_email_fk foreign key(email) references member(email) on delete cascade
);
create sequence freeBoard_seq minvalue 1;
        

commit;