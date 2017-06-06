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
drop table freeBoard purge;
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
drop sequence freeBoard_seq;
create sequence freeBoard_seq minvalue 1;

-- 댓 글
drop table remania_comment purge;
create table remania_comment(
	comment_level number(1) default 0,		--댓글 깊이 
	ref number(5)	not null,			-- root 댓글 = 최상위 댓글 고유번호
	step number(5)	not null,			--댓글 출력 순서 구분
	parentComment number(5),			-- 상위 댓글  고유번호
	num number(5) constraint comment_num_pk primary key,		--댓글 고유번호 (pk)
	boardnum number(4),	--파라미터 넘길 필요 없이 그냥 게시물 삭제시 지우게 게시물번호 (fk) -> 게시글 삭제되면 댓글도 같이 삭제 (cascade)
	category varchar2(10), -- 그냥 table 하나로 댓 글 관리하려고 넣었어요.
	email varchar2(50),
	author varchar2(10),
	usercomment varchar2(4000),
	writeday date default sysdate,
	constraint comment_boardnum_fk foreign key(boardnum) references freeBoard(freeboardnum) on delete cascade,
	constraint comment_parentComment_fk foreign key(parentComment) references remania_comment(num) on delete cascade,
	constraint comment_email_fk foreign key(email) references member(email) on delete cascade
);

drop sequence comment_seq;
create sequence comment_seq minvalue 1;

drop sequence comment_seq;
create sequence buy_comment_seq minvalue 1;

-- 문의 게시판
drop table inquiry purge;
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

drop sequence inquiry_seq;
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
create sequence buy_seq minvalue 1;

--삽니다 댓글 테이블 (댓글의 댓글 추가)
Create table buyReple(  
 relevel	number(4) 		default 0,		-- 댓글의 깊이  현재 달고있는 댓글의 레벨 +1 
 ref 		number(4)		not null, 		-- 그룹  frnum 가져와서 세팅.
 step 		number(4) 		default 0,      -- 공백 갯수
 pfrnum 	number(4)  		not null , 		-- 부모의 고유넘버
 buyreplenum 	  	number(4)		constraint buyReple_buyreplenum_pk primary key,	--댓글번호, 댓글의 고유번호 ref
 buynum     	number(4)       not null,   -- 게시판번호 (fk)
 email			varchar2(50),				-- 이메일 (fk)
 author 	varchar2(16)	not null,		-- 작성자
 content	varchar2(4000)  not null,	    -- 내용
 writeday	date            default sysdate,-- 작성일
constraint buyReple_email_fk foreign key(email) references member(email) on delete cascade,
constraint buyReple_buynum_fk foreign key(buynum) references buy(buynum) on delete cascade
);

alter table buyReple add constraint buyReple_pfrnum_fk foreign key(pfrnum)
references buyReple(buyreplenum) on delete cascade;

alter table buyReple add constraint buyReple_ref_fk foreign key(ref)
references buyReple(buyreplenum) on delete cascade;

create sequence buyReple_seq minvalue 1;

create table trade(
  tradenum    number(4)     constraint trade_tradenum_pk primary key, -- 거래번호
  category    varchar2(10)  not null,       -- 게시글 종류(buy, sell)
  categorynum number(4)     not null,       -- 게시글 번호
  buyer       varchar2(50)  not null,       -- 구매자 이메일
  seller      varchar2(50)  not null,       -- 판매자 이메일
  state       varchar2(10)  default '진행중', -- 거래상황
  transfer    varchar2(10)  default null,   -- 인계
  takeover    varchar2(10)  default null    -- 인수
);
create sequence trade_seq minvalue 0;

commit;