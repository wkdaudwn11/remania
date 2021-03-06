
drop table remania_comment cascade constraints purge;
drop sequence comment_seq;
drop sequence buy_comment_seq;
drop table reportTo cascade constraints purge;
drop table trade cascade constraints purge;
drop sequence trade_seq;
drop table buy cascade constraints purge;
drop sequence buy_seq;
drop table inquiry cascade constraints purge;
drop sequence inquiry_seq;
drop table freeBoard cascade constraints purge;
drop sequence freeBoard_seq;
drop table member cascade constraints purge;
drop sequence member_seq;

--회원 테이블
create table member(
	membernum   number(5)		constraint	member_mnum_pk	primary key,		--회원번호
	email       varchar2(50)	constraint	member_email_uk	unique	not null,	--아이디
	name        varchar2(10)	not null,         	--회원이름
	pwd         varchar2(16)	not null,         	--비밀번호
	tel         varchar2(12)	not null,         	--연락처
	post1       varchar2(3)		null,         		--우편번호1
	post2       varchar2(3)		null,         		--우편번호2
	addr1       varchar2(500)	null,             	--신주소
	addr2       varchar2(500)	null,             	--구주소
	joindate    date			default sysdate,	--가입 날짜 (SNS유저는 최초 로그인날짜)
	logindate   date          	default sysdate,	--로그인 날짜
  	buyCount    number(5)     	default 0,      	--구매횟수
  	sellCount   number(5)     	default 0,        	--판매횟수
	sns         varchar2(10)	default 'remania' 	--sns로그인 (remania면 일반회원)
);

create sequence member_seq minvalue 0;

insert into member(membernum, email, name, pwd, tel, post1, post2, addr1, addr2, joindate, logindate,
                    buyCount, sellCount, sns)
values(member_seq.nextval, 'admin', '관리자', '123', '010', '123', '456', '주소1', '주소2',
        sysdate, sysdate, 0, 0, 'remania');
        
--자유게시판 테이블
create table freeBoard(
	freeboardnum	number(4)		constraint freeBoard_freeBoard_pk primary key,--게시판번호
	email       	varchar2(50)	not null,		--작성자의 이메일
	author			varchar2(16)	not null,		--작성자 이름
	title	  		varchar2(50)	not null,		--제목
	content			varchar2(4000)	not null,		--내용
	writeday		date		    default sysdate,--작성일
	readcnt			number(4)		default 0,		--조회
	replecnt 		number(4)       default 0,      --댓글수
	constraint freeboard_email_fk foreign key(email) references member(email) on delete cascade
);
create sequence freeBoard_seq minvalue 0;

-- 댓 글
create table remania_comment( -- COMMENT_BOARDNUM_FK
	comment_level number(1) default 0,		--댓글 깊이 
	ref number(5)	not null,			-- root 댓글 = 최상위 댓글 고유번호
	step number(5)	not null,			--댓글 출력 순서 구분
	parentComment number(5),			-- 상위 댓글  고유번호
	num number(5) ,		--댓글 고유번호 (pk)
	boardnum number(4),	--파라미터 넘길 필요 없이 그냥 게시물 삭제시 지우게 게시물번호 (fk) -> 게시글 삭제되면 댓글도 같이 삭제 (cascade)
	category varchar2(10), -- 그냥 table 하나로 댓 글 관리하려고 넣었어요.
	email varchar2(50),
	author varchar2(10),
	usercomment varchar2(4000),
	writeday date default sysdate,
	constraint comment_num_category_pk primary key(num,category),
	constraint comment_parentComment_fk foreign key(parentComment) references remania_comment(num) on delete cascade,
	constraint comment_email_fk foreign key(email) references member(email) on delete cascade
);

create sequence comment_seq minvalue 1;
create sequence buy_comment_seq minvalue 1;

-- 문의 게시판
create table inquiry(
 	registernum number(5) constraint inquiry_registernum_pk primary key,	--문의 글번호
 	ref number(5),
 	comment_level number(1),
	category varchar2(10),		-- 문의 유형,분류
	email varchar2(50),		--작성자 이메일
	author varchar2(10),		--작성자 이름
	title varchar2(50),		--제목
	content varchar2(4000),		--내용
	writeday date default sysdate,	--작성일
	state varchar2(10) default '처리 중',
	constraint inquiry_ref_fk foreign key(ref) references inquiry(registernum) on delete cascade,
	constraint inquiry_email_fk foreign key(email) references member(email) on delete cascade
);
create sequence inquiry_seq;

--삽니다
create table buy(
  buynum      	number(4)       constraint buy_buynum_pk primary key,--삽니다번호
  category    	varchar2(20)    not null,     	--분류
  tradeWay    	varchar2(20)    not null,     	--거래방법
  location    	varchar2(20)    default null, 	--거래지역
  priceChoice	varchar2(20)    not null,     	--가격선택 (합의 후 결정, 범위 설정)
  price1      	number(9)       default 0,    	--최소가격
  price2      	number(9)       default 0,    	--최대가격
  email     	varchar2(50)    not null,		--작성자의 이메일
  author		varchar2(16)	not null,		--작성자 이름
  title	  		varchar2(50)	not null,		--제목
  content	  	varchar2(4000)	not null,		--내용
  writeday  	date		    default sysdate,--작성일
  readcnt	  	number(4)		default 0,		--조회
  replecnt 		number(4)       default 0,      --댓글수
  image1    	varchar2(4000)  default null,   --대표사진
  image2    	varchar2(4000)  default null,   --내용에뿌려지는사진들
  state     	varchar2(10)    default null,   --거래상황
  constraint buy_email_fk foreign key(email) references member(email) on delete cascade
);
create sequence buy_seq minvalue 0;

create table trade(
  tradenum    number(4)     constraint trade_tradenum_pk primary key, --거래번호
  category    varchar2(10)  not null,       --게시글 종류(buy, sell)
  categorynum number(4)     not null,       --게시글 번호
  buyer       varchar2(50)  not null,       --구매자 이메일
  seller      varchar2(50)  not null,       --판매자 이메일
  state       varchar2(10)  default '진행중', -- 거래상황
  transfer    varchar2(10)  default null,   --인계
  takeover    varchar2(10)  default null,   --인수
  sellcancel  varchar2(5)   default null,   --판매취소
  buycancel   varchar2(5)   default null    --구매취소
);
create sequence trade_seq minvalue 0;

create table reportTo(
	tradenum number(4),
	victim varchar2(80),
	assailant varchar2(80),
	transfer varchar2(10),
	takeover varchar2(10),
	constraint reportTo_tradenum_fk foreign key(tradenum) references trade(tradenum) on delete cascade
);

commit;
