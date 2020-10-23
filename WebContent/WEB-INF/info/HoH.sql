-- 테이블 정리 --

-- 회원(member) 테이블 삭제 --
DROP TABLE member;

-- 회원(member) 테이블 생성 --
CREATE TABLE member(
   id varchar2(100) PRIMARY KEY,
   nickname varchar2(100) NOT NULL UNIQUE,
   password varchar2(100) NOT NULL,
   ageName varchar2(100) NOT NULL,
   point number default 0,
   rank varchar2(10) default 'iron'
)

-- 작성글(board) 시퀀스 삭제 --
DROP SEQUENCE board_seq;
-- 작성글(board) 테이블 삭제 --
DROP TABLE board;

-- 작성글(board) 시퀀스 생성 -- 
CREATE SEQUENCE board_seq nocache;
-- 작성글(board) 테이블 생성 --
CREATE TABLE board(
   post_no number primary key,
   id varchar2(100) not null,
   title varchar2(100) not null,
   view_count number default 0,
   content clob not null,
   like_count number default 0,
   regdate date not null,
   rep_count number default 0,
   constraint fk_boardid foreign key(id) references member(id) on delete cascade
)

--  댓글(reply) 시퀀스 삭제 --
DROP SEQUENCE reply_seq;
-- 댓글(reply) 테이블 삭제 --
DROP TABLE reply;

-- 댓글(reply) 시퀀스 생성 -- 
CREATE SEQUENCE reply_seq nocache;
-- 댓글(reply) 테이블 생성 --
CREATE TABLE reply (
   rep_no number primary key,
   post_no number not null,
   rep_content varchar2(500) not null,
   nick varchar2(30) not null, 
   password varchar2(30) not null,
   constraint fk_boardno foreign key(post_no) references board(post_no) on delete cascade
);

-- 좋아요(like_post) 테이블 삭제 --
DROP TABLE like_post;

-- 좋아요(like_post) 테이블 생성 --
CREATE TABLE like_post (
    post_no number,
    id varchar2(100),
    CONSTRAINT pk_like PRIMARY KEY (POST_NO,ID)
);

-- 스크랩(scrap_post) 테이블 삭제 --
DROP TABLE scrap_post;

-- 스크랩(scrap_post) 테이블 생성 -- 
CREATE TABLE scrap_post (
    post_no number not null,
    id varchar2(100) not null,
    scraped_regdate date DEFAULT sysdate,
    constraint fk_memberid foreign key(id) references member(id) on delete cascade,
    constraint fk_boardpostNo foreign key(post_no) references board(post_no) on delete cascade,
    CONSTRAINT pk_scrap PRIMARY KEY (POST_NO,ID)
);

-- 팔로우(follow) 테이블 삭제--
DROP TABLE follow;

-- 팔로우(follow) 테이블 생성--
create table follow(
   id varchar2(100),
   nickname varchar2(100),
   constraint fk_follow primary key(id,nickname)
)

-- 공지사항(notice_board)시퀀스 삭제 --
DROP SEQUENCE notice_board_seq;
-- 공지사항(notice_board)테이블 삭제 --
DROP TABLE notice_board;

-- 공지사항(notice_board) 시퀀스 생성 --
CREATE SEQUENCE notice_board_seq nocache;
-- 공지사항(notice_board) 테이블 생성 --
CREATE TABLE notice_board(
   post_no number primary key,
   id varchar2(100) not null,
   title varchar2(100) not null,
   view_count number default 0,
   content clob not null,
   regdate date not null,
   constraint fk_notice_boardid foreign key(id) references member(id) on delete cascade
)

-- 관리자 아이디 생성 --
INSERT INTO member(id, nickname, password, ageName) VALUES('adminmts', '관리자', 'donguking', '모든시대');

-- 회원 데이터 넣기 --
INSERT INTO member(id, nickname, password, ageName) VALUES('donguk', '하하동욱', 'donguk', '조선시대');
-- 등급별 회원 등록 --
INSERT INTO member(id, nickname, password, ageName,point) VALUES('iron', 'iron', 'iron', '고조선시대',10);
INSERT INTO member(id, nickname, password, ageName,point) VALUES('bronze', 'bronze', 'bronze', '삼국시대',110);
INSERT INTO member(id, nickname, password, ageName,point) VALUES('silver', 'silver', 'silver', '고려시대',210);
INSERT INTO member(id, nickname, password, ageName,point) VALUES('gold', 'gold', 'gold', '조선시대',410);
INSERT INTO member(id, nickname, password, ageName,point) VALUES('platinum', 'platinum', 'platinum', '고조선시대',710);
INSERT INTO member(id, nickname, password, ageName,point) VALUES('diamond', 'diamond', 'diamond', '삼국시대',1210);
INSERT INTO member(id, nickname, password, ageName,point) VALUES('challenger', 'challenger', 'challenger', '고려시대',2010);