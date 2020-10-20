DROP TABLE member;
DROP TABLE board;
DROP TABLE reply;
DROP TABLE scrap_post;
DROP SEQUENCE board_seq;
DROP SEQUENCE reply_seq;

CREATE TABLE member(
   id varchar2(100) PRIMARY KEY,
   nickname varchar2(100) NOT NULL UNIQUE,
   password varchar2(100) NOT NULL,
   ageName varchar2(100) NOT NULL,
   point number default 0
)


CREATE SEQUENCE board_seq nocache;

CREATE TABLE board(
   post_no number primary key,
   id varchar2(100) not null,
   title varchar2(100) not null,
   view_count number default 0,
   content clob not null,
   like_count number default 0,
   regdate date not null,
   constraint fk_boardid foreign key(id) references member(id) on delete cascade
)

CREATE SEQUENCE reply_seq nocache;

CREATE TABLE reply (
   rep_no number primary key,
   post_no number not null,
   rep_content varchar2(500) not null,
   nick varchar2(30) not null, 
   password varchar2(30) not null,
   constraint fk_boardno foreign key(post_no) references board(post_no) on delete cascade
);



CREATE TABLE scrap_post (
    post_no number,
    id varchar2(100),
    CONSTRAINT pk_scrap PRIMARY KEY (POST_NO,ID)
);

select * from scrap_post
select * from reply
select * from board;
select * from member;

INSERT INTO member(id, nickname, password, ageName) VALUES('donguk', '욱과짱', 'donguk', '조선시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('lastcow', '쏭쏭이', 'lastcow', '고조선시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('milk', '훌륭한정주임', 'milk', '고려시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('dance_machine', '노래도잘해', 'dance_machine', '삼국시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('rider', '세히찡', 'rider', '조선시대');

insert into board(post_no,id,title,content,regdate, like_count) values(board_seq.nextval,'donguk','하이','안녕하세요',sysdate, 20);
insert into board(post_no,id,title,content,regdate, like_count) values(board_seq.nextval,'lastcow','안녕','ㅈㄱㄴ',sysdate, 55);
insert into board(post_no,id,title,content,regdate, like_count) values(board_seq.nextval,'milk','봉주르','프랑스',sysdate, 1);
insert into board(post_no,id,title,content,regdate, like_count) values(board_seq.nextval,'dance_machine','구텐탁','독일',sysdate, 9);
insert into board(post_no,id,title,content,regdate, like_count) values(board_seq.nextval,'rider','부아앙~','오토바이',sysdate, 105);

INSERT INTO member(id, nickname, password, ageName) VALUES('ggok', '꾹이', 'donguk', '조선시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('yoeongsub', '잘생긴송영섭', 'lastcow', '고조선시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('yewool', '스텔라', 'milk', '고려시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('socold', '추워', 'dance_machine', '삼국시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('yomi', '요미세히', 'yomi', '조선시대');

INSERT INTO scrap_post VALUES('1', 'donguk');
INSERT INTO scrap_post VALUES('1', 'yewool');
INSERT INTO scrap_post VALUES('3', 'socold');
INSERT INTO scrap_post VALUES('3', 'yomi');
select * from member m, board b, reply r, scrap_post sp where m.id = b.id and b.id=sp.id and r.post_no=b.post_no;

ALTER TABLE board 
RENAME COLUMN hit_count TO view_count;


DROP SEQUENCE board_seq;

CREATE SEQUENCE board_seq nocache;

DELETE FROM board WHERE post_no=1;
DELETE FROM board WHERE post_no=2;
DELETE FROM board WHERE post_no=3;
DELETE FROM board WHERE post_no=4;
DELETE FROM board WHERE post_no=5;

insert into board(post_no,id,title,content,regdate, like_count) values(board_seq.nextval,'donguk','하이','안녕하세요',sysdate, 20);
insert into board(post_no,id,title,content,regdate, like_count) values(board_seq.nextval,'lastcow','안녕','ㅈㄱㄴ',sysdate, 55);
insert into board(post_no,id,title,content,regdate, like_count) values(board_seq.nextval,'milk','봉주르','프랑스',sysdate, 1);
insert into board(post_no,id,title,content,regdate, like_count) values(board_seq.nextval,'dance_machine','구텐탁','독일',sysdate, 9);
insert into board(post_no,id,title,content,regdate, like_count) values(board_seq.nextval,'rider','부아앙~','오토바이',sysdate, 105);

SELECT * FROM board;

--board(post_no,id,title,view_count,content,like_count,regdate
--id: rider,donguk,ggok 시대:'조선시대'
insert into board values(board_seq.nextval,'rider','제목1','8','내용1','3',sysdate);
insert into board values(board_seq.nextval,'rider','제목2','7','내용2','6',sysdate);
insert into board values(board_seq.nextval,'rider','제목3','2','내용3','1',sysdate);
insert into board values(board_seq.nextval,'rider','제목4','6','내용4','4',sysdate);
insert into board values(board_seq.nextval,'rider','제목5','5','내용5','2',sysdate);
insert into board values(board_seq.nextval,'rider','제목6','4','내용6','3',sysdate);
insert into board values(board_seq.nextval,'rider','제목7','1','내용7','0',sysdate);
insert into board values(board_seq.nextval,'rider','제목8','0','내용8','0',sysdate);
insert into board values(board_seq.nextval,'rider','제목9','3','내용9','2',sysdate);
insert into board values(board_seq.nextval,'rider','제목10','11','내용10','10',sysdate);
insert into board values(board_seq.nextval,'donguk','제목11','64','내용11','40',sysdate);
insert into board values(board_seq.nextval,'donguk','제목12','984','내용12','800',sysdate);
insert into board values(board_seq.nextval,'donguk','제목13','65','내용13','62',sysdate);
insert into board values(board_seq.nextval,'donguk','제목14','32','내용14','25',sysdate);
insert into board values(board_seq.nextval,'donguk','제목15','85','내용15','46',sysdate);
insert into board values(board_seq.nextval,'ggok','제목16','89','내용16','65',sysdate);
insert into board values(board_seq.nextval,'ggok','제목17','56','내용17','12',sysdate);
insert into board values(board_seq.nextval,'ggok','제목18','5','내용18','0',sysdate);
insert into board values(board_seq.nextval,'ggok','제목19','31','내용19','20',sysdate);
insert into board values(board_seq.nextval,'ggok','제목20','32','내용20','19',sysdate);

----id: lastcow,yoeongsub 시대:'고조선시대'
insert into board values(board_seq.nextval,'lastcow','제목1','45','내용1','30',sysdate);
insert into board values(board_seq.nextval,'lastcow','제목2','42','내용2','41',sysdate);
insert into board values(board_seq.nextval,'lastcow','제목3','0','내용3','0',sysdate);
insert into board values(board_seq.nextval,'lastcow','제목4','4','내용4','3',sysdate);
insert into board values(board_seq.nextval,'lastcow','제목5','6','내용5','5',sysdate);
insert into board values(board_seq.nextval,'lastcow','제목6','86','내용6','65',sysdate);
insert into board values(board_seq.nextval,'yoeongsub','제목7','44','내용7','43',sysdate);
insert into board values(board_seq.nextval,'yoeongsub','제목8','2','내용8','1',sysdate);
insert into board values(board_seq.nextval,'yoeongsub','제목9','33','내용9','16',sysdate);
insert into board values(board_seq.nextval,'yoeongsub','제목10','45','내용10','41',sysdate);
insert into board values(board_seq.nextval,'yoeongsub','제목11','758','내용11','654',sysdate);
insert into board values(board_seq.nextval,'yoeongsub','제목12','452','내용12','100',sysdate);
insert into board values(board_seq.nextval,'lastcow','제목13','125','내용13','124',sysdate);
insert into board values(board_seq.nextval,'lastcow','제목14','89','내용14','12',sysdate);
insert into board values(board_seq.nextval,'lastcow','제목15','453','내용15','3',sysdate);
insert into board values(board_seq.nextval,'yoeongsub','제목16','1','내용16','0',sysdate);
insert into board values(board_seq.nextval,'yoeongsub','제목17','42','내용17','0',sysdate);

----id: dance_machine,socold 시대:'삼국시대'
insert into board values(board_seq.nextval,'dance_machine','제목1','76','내용1','65',sysdate);
insert into board values(board_seq.nextval,'dance_machine','제목2','54','내용2','42',sysdate);
insert into board values(board_seq.nextval,'dance_machine','제목3','123','내용3','22',sysdate);
insert into board values(board_seq.nextval,'dance_machine','제목4','544','내용4','0',sysdate);
insert into board values(board_seq.nextval,'dance_machine','제목5','35','내용5','0',sysdate);
insert into board values(board_seq.nextval,'dance_machine','제목6','55','내용6','0',sysdate);
insert into board values(board_seq.nextval,'socold','제목7','687','내용7','68',sysdate);
insert into board values(board_seq.nextval,'socold','제목8','455','내용8','45',sysdate);
insert into board values(board_seq.nextval,'socold','제목9','667','내용9','41',sysdate);
insert into board values(board_seq.nextval,'socold','제목10','123','내용10','12',sysdate);
insert into board values(board_seq.nextval,'socold','제목11','11','내용11','7',sysdate);
insert into board values(board_seq.nextval,'socold','제목12','786','내용12','456',sysdate);

----id: milk,yewool 시대:'고려시대'
insert into board values(board_seq.nextval,'milk','제목1','785','내용1','20',sysdate);
insert into board values(board_seq.nextval,'milk','제목2','456','내용2','1',sysdate);
insert into board values(board_seq.nextval,'milk','제목3','45','내용3','44',sysdate);
insert into board values(board_seq.nextval,'milk','제목4','453','내용4','24',sysdate);
insert into board values(board_seq.nextval,'milk','제목5','78','내용5','44',sysdate);
insert into board values(board_seq.nextval,'yewool','제목6','4523','내용6','311',sysdate);
insert into board values(board_seq.nextval,'yewool','제목7','456','내용7','77',sysdate);
insert into board values(board_seq.nextval,'yewool','제목8','12','내용8','1',sysdate);
insert into board values(board_seq.nextval,'yewool','제목9','748','내용9','500',sysdate);
insert into board values(board_seq.nextval,'yewool','제목10','44','내용10','30',sysdate);

--스크랩 추가
INSERT INTO scrap_post VALUES('3', 'milk');
INSERT INTO scrap_post VALUES('5', 'dance_machine');
INSERT INTO scrap_post VALUES('33', 'dance_machine');
INSERT INTO scrap_post VALUES('6', 'yomi');
INSERT INTO scrap_post VALUES('33', 'donguk');
INSERT INTO scrap_post VALUES('11', 'yomi');
INSERT INTO scrap_post VALUES('12', 'donguk');
INSERT INTO scrap_post VALUES('36', 'donguk');
INSERT INTO scrap_post VALUES('16', 'donguk');

SELECT  b.*, m.*
FROM  ( SELECT row_number() over(ORDER BY post_no DESC) AS rnum, post_no, id, title, view_count, content, like_count, TO_CHAR(regdate, 'YYYY-MM-DD') AS regdate
FROM   board) b, member m
WHERE  b.id = m.id AND m.agename='조선시대' AND rnum BETWEEN 1 AND 5

SELECT  B.RNUM ,B.POST_NO, B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,AGEDATE 
FROM (
SELECT ROW_NUMBER() OVER(ORDER BY POST_NO desc) AS RNUM ,b.post_no,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE
FROM BOARD B, MEMBER M WHERE B.ID=M.ID AND M.AGENAME=?) B, MEMBER M 
WHERE B.NICKNAME=M.NICKNAME and rnum between ? and ? order by rnum asc



																							-- 주말이후 다시 적용할 것들 
-- alter 구문
/*
1. 테이블 컬럼 추가하기(ALTER TABLE ADD)
[문법] ALTER TABLE 테이블명 ADD(컬럼명 데이타타입(사이즈));
( EX ) USER라는 테이블에 USER_NAME이라는 컬럼을 VARCHAR2(13) 타입으로 추가할 때
-> ALTER TABLE USER ADD(USER_NAME VARCHAR2(13)); 

2. 테이블 컬럼 수정하기(ALTER TABLE MODIFY)
[문법] ALTER TABLE 테이블명 MODIFY(컬럼명 테이타타입(사이즈));
( EX ) USER라는 테이블에 USER_AGE 라는 컬럼을 NUMBER(3) 타입으로 수정할 때
-> ALTER TABLE USER MODIFY(USER_AGE NUMBER(3));
 
3. 테이블 컬럼 삭제하기(ALTER TABLE DROP)
[문법] ALTER TABLE 테이블명 DROP COLUMN 컬럼명
( EX ) USER라는 테이블에 USER_NAME 이라는 컬럼을 삭제할 때
-> ALTER TABLE USER DROP COLUMN USER_NAME;

4. 테이블 컬럼 이름 변경하기(ALTER TABLE RENAME)
[문법] ALTER TABLE 테이블명 RENAME COLUMN 원래컬럼명 TO 바꿀컬럼명;
( EX ) USER라는 테이블에 USER_NAME 이라는 컬럼을 USER_FIRST_NAME으로 변경할 때
-> ALTER TABLE USER RENAME COLUMN USER_NAME TO USER_FIRST_NAME;
*/

DROP TABLE reply;
DROP SEQUENCE reply_seq;

CREATE TABLE reply (
   rep_no number primary key,
   post_no number not null,
   rep_content varchar2(500) not null,
   nick varchar2(30) not null, 
   password varchar2(30) not null,
   constraint fk_boardno foreign key(post_no) references board(post_no) on delete cascade
);

CREATE SEQUENCE reply_seq nocache;

--댓글 추가
INSERT INTO reply(rep_no, post_no, rep_content, nick, password) VALUES(reply_seq.nextval, '2', 'yomi2', '나는왕이다2', '1111');
INSERT INTO reply(rep_no, post_no, rep_content, nick, password) VALUES(reply_seq.nextval, '3', 'yomi3', '나는왕이다', '1111');
INSERT INTO reply(rep_no, post_no, rep_content, nick, password) VALUES(reply_seq.nextval, '6', 'reply5', '나는왕이다', '1111');
INSERT INTO reply(rep_no, post_no, rep_content, nick, password) VALUES(reply_seq.nextval, '33', 'reply6', '나는왕이다', '1111');
INSERT INTO reply(rep_no, post_no, rep_content, nick, password) VALUES(reply_seq.nextval, '6', 'reply7', '나는왕이다', '1111');
INSERT INTO reply(rep_no, post_no, rep_content, nick, password) VALUES(reply_seq.nextval, '5', 'reply8', '나는왕이다', '1111');
INSERT INTO reply(rep_no, post_no, rep_content, nick, password) VALUES(reply_seq.nextval, '4', 'reply9', '나는왕이다', '1111');
INSERT INTO reply(rep_no, post_no, rep_content, nick, password) VALUES(reply_seq.nextval, '16', 'reply9', '나는왕이다', '1111');
INSERT INTO reply(rep_no, post_no, rep_content, nick, password) VALUES(reply_seq.nextval, '11', 'reply9', '나는왕이다', '1111');
INSERT INTO reply(rep_no, post_no, rep_content, nick, password) VALUES(reply_seq.nextval, '6', 'reply9', '나는왕이다', '1111');

SELECT * FROM reply;
ALTER TABLE board ADD(rep_count number default 0); 


SELECT  B.RNUM ,B.POST_NO, B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,AGEDATE, B.rep_count 
FROM ( SELECT ROW_NUMBER() OVER(ORDER BY POST_NO desc) AS RNUM ,b.post_no,B.TITLE,M.NICKNAME,B.LIKE_COUNT,B.VIEW_COUNT,TO_CHAR(REGDATE, 'YYYY-MM-DD') AS AGEDATE, B.rep_count
FROM BOARD B, MEMBER M WHERE B.ID=M.ID AND M.AGENAME='삼국시대') B , MEMBER M WHERE B.NICKNAME=M.NICKNAME and rnum between 1 and 3;
			
																-- 10/20 추가사항 --
ALTER TABLE member add(rank varchar2(10) default 'iron');
select* from member;
			
