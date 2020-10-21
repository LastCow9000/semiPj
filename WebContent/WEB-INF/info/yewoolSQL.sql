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
DELETE member WHERE id='test';
select * from member where id='testyewool';
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

-- board 테이블 명 hit_count -> view_count로 변경
ALTER TABLE board
RENAME COLUMN hit_count TO view_count;

CREATE SEQUENCE reply_seq nocache;

CREATE TABLE reply (
   rep_no number primary key,
   post_no number not null,
   rep_content varchar2(500) not null,
   constraint fk_boardno foreign key(post_no) references board(post_no) on delete cascade
);


CREATE TABLE scrap_post (
    post_no number,
    id varchar2(100),
    CONSTRAINT pk_scrap PRIMARY KEY (POST_NO,ID)
);

--스크랩 게시물 중복 확인
SELECT post_no
FROM   scrap_post
WHERE  id='testyewool' AND post_no='42'

-- 스크랩 게시물 등록
INSERT INTO scrap_post VALUES('33', 'testyewool');
INSERT INTO scrap_post VALUES('10', 'testyewool');

-- 스크랩 게시물 확인
SELECT  post_no
FROM	scrap_post
WHERE	id='testyewool'
ORDER BY post_no desc;

-- 스크랩 게시물

SELECT m.id, m.nickname, b.title,b.regDate,b.content, 
b.view_count, b.like_count, m.ageName, s.scraped_regdate 
FROM member m, board b, scrap_post s 
WHERE m.id = b.id AND s.post_no = b.post_no AND b.post_no='3'


select * from scrap_post
select * from reply
select * from board;
select * from member;

INSERT INTO member(id, nickname, password, ageName) VALUES('donguk', '욱과짱', 'donguk', '조선시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('lastcow', '쏭쏭이', 'lastcow', '고조선시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('milk', '훌륭한정주임', 'milk', '고려시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('dance_machine', '노래도잘해', 'dance_machine', '삼국시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('rider', '세히찡', 'rider', '조선시대');

insert into board(post_no,id,title,content,regdate) values(board_seq.nextval,'donguk','하이','안녕하세요',sysdate);
insert into board(post_no,id,title,content,regdate) values(board_seq.nextval,'lastcow','안녕','ㅈㄱㄴ',sysdate);
insert into board(post_no,id,title,content,regdate) values(board_seq.nextval,'milk','봉주르','프랑스',sysdate);
insert into board(post_no,id,title,content,regdate) values(board_seq.nextval,'dance_machine','구텐탁','독일',sysdate);
insert into board(post_no,id,title,content,regdate) values(board_seq.nextval,'rider','부아앙~','오토바이',sysdate);

INSERT INTO member(id, nickname, password, ageName) VALUES('ggok', '꾹이', 'donguk', '조선시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('yoeongsub', '잘생긴송영섭', 'lastcow', '고조선시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('yewool', '스텔라', 'milk', '고려시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('socold', '추워', 'dance_machine', '삼국시대');
INSERT INTO member(id, nickname, password, ageName) VALUES('yomi', '요미세히', 'yomi', '조선시대');

INSERT INTO reply(rep_no, post_no, rep_content) VALUES(reply_seq.nextval, '1', 'yomi1');
INSERT INTO reply(rep_no, post_no, rep_content) VALUES(reply_seq.nextval, '2', 'yomi2');
INSERT INTO reply(rep_no, post_no, rep_content) VALUES(reply_seq.nextval, '3', 'yomi3');

INSERT INTO scrap_post VALUES('1', 'donguk');
INSERT INTO scrap_post VALUES('1', 'yewool');
INSERT INTO scrap_post VALUES('3', 'socold');
INSERT INTO scrap_post VALUES('3', 'yomi');
INSERT INTO SCRAP_POST VALUES('42', 'testyewool');
select * from member m, board b, reply r, scrap_post sp where m.id = b.id and b.id=sp.id and r.post_no=b.post_no;

-- 게시글 상세보기
select m.id, m.nickname, b.title, b.regdate,b.content,b.hit_count, b.like_count from member m, board b where m.id = b.id;


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


--댓글 추가
INSERT INTO reply(rep_no, post_no, rep_content) VALUES(reply_seq.nextval, '1', 'reply4');
INSERT INTO reply(rep_no, post_no, rep_content) VALUES(reply_seq.nextval, '6', 'reply5');
INSERT INTO reply(rep_no, post_no, rep_content) VALUES(reply_seq.nextval, '33', 'reply6');
INSERT INTO reply(rep_no, post_no, rep_content) VALUES(reply_seq.nextval, '6', 'reply7');
INSERT INTO reply(rep_no, post_no, rep_content) VALUES(reply_seq.nextval, '5', 'reply8');
INSERT INTO reply(rep_no, post_no, rep_content) VALUES(reply_seq.nextval, '4', 'reply9');
INSERT INTO reply(rep_no, post_no, rep_content) VALUES(reply_seq.nextval, '16', 'reply9');
INSERT INTO reply(rep_no, post_no, rep_content) VALUES(reply_seq.nextval, '11', 'reply9');
INSERT INTO reply(rep_no, post_no, rep_content) VALUES(reply_seq.nextval, '6', 'reply9');


--Home화면에서 핳 게시글 5개 가져오는 쿼리문 + postNo
SELECT b.title, m.nickName, m.ageName, b.post_no
FROM board b, member m 
WHERE b.id=m.id 
ORDER BY like_count DESC, view_count DESC


select * from scrap_post;
alter table scrap_post add(scraped_regdate date default sysdate);
alter table scrap_post RENAME COLUMN regdate to scraped_regdate


SELECT post_no, scraped_regdate
FROM scrap_post 
WHERE id='testyewool'
ORDER BY scraped_regdate desc


INSERT INTO scrap_post(post_no, id) VALUES('77', 'testyewool')

select *
from  BOARD
WHERE post_no = '55';

-- scrap 삭제
DELETE FROM scrap_post WHERE post_no='77' AND id='testyewool'

-- Follow 테이블
create table follow(
   id varchar2(100),
   nickname varchar2(100),
   constraint fk_follow primary key(id,nickname)
)

