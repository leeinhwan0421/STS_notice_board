# STS_notice_board

개발 진행상황 및 요구사항 링크 📝
https://www.notion.so/Notice-Board-with-Java-Spring-FrameWork-927540ab537a4bc98617820d887d8dc9

여러 블로그를 참조해서 제작하였습니다 😀

출처
https://kimvampa.tistory.com/category/%EC%8A%A4%ED%94%84%EB%A7%81%20%ED%94%84%EB%A0%88%EC%9E%84%EC%9B%8C%ED%81%AC/%EA%B2%8C%EC%8B%9C%ED%8C%90%20%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8
https://melonpeach.tistory.com/category/%EC%9B%B9%EA%B0%9C%EB%B0%9C/%EC%8A%A4%ED%94%84%EB%A7%81%20%EA%B2%8C%EC%8B%9C%ED%8C%90%20%EB%A7%8C%EB%93%A4%EA%B8%B0

두분 감사드립니다 ㅜㅜㅜㅜㅜ

# 만약 이 프로젝트로 진행하신다면!
oracle db를 활용해서 제작하였기 때문에 설정을 모르신다면 oracle db를 사용해주세요.

설치를 다 하셨다면 sqlplus에 테이블을 추가하게 됩니다.

TABLE 추가문

oracle sql 기반으로 작성되었습니다.

```SQL
CREATE TABLE MP_BOARD(
    BNO NUMBER NOT NULL,
    TITLE VARCHAR2(100)     NOT NULL,
    CONTENT VARCHAR2(2000)  NOT NULL,
    WRITER VARCHAR2(100)    NOT NULL,
    REGDATE DATE            DEFAULT SYSDATE,
    PRIMARY KEY(BNO),
    HIT NUMBER DEFAULT 0
);

CREATE SEQUENCE MP_BOARD_SEQ
START WITH 1
INCREMENT BY 1;
```

```SQL
CREATE TABLE MP_FILE
(
    FILE_NO NUMBER,                         --파일 번호
    BNO NUMBER NOT NULL,                    --게시판 번호
    ORG_FILE_NAME VARCHAR2(260) NOT NULL,   --원본 파일 이름
    STORED_FILE_NAME VARCHAR2(36) NOT NULL, --변경된 파일 이름
    FILE_SIZE NUMBER,                       --파일 크기
    REGDATE DATE DEFAULT SYSDATE NOT NULL,  --파일등록일
    DEL_GB VARCHAR2(1) DEFAULT 'N' NOT NULL,--삭제구분
    PRIMARY KEY(FILE_NO)                    --기본키 FILE_NO
);

CREATE SEQUENCE SEQ_MP_FILE_NO
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;
```

```SQL
CREATE TABLE MP_MEMBER(
  USERID VARCHAR2(40) NOT NULL,
  USERPASS VARCHAR2(100) NOT NULL,
  USERNAME VARCHAR2(40) NOT NULL,
  REGDATE DATE DEFAULT SYSDATE,
  PRIMARYKEY(USERID)
);
```

```SQL
create table mp_reply (
    bno number not null,
    rno number not null,
    content varchar2(1000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    primary key(bno, rno)
);

alter table mp_reply add constraint mp_reply_bno foreign key(bno)
references mp_board(bno);

create sequence mp_reply_seq START WITH 1 MINVALUE 0;

commit;
```

# 진행상황
-- 블로그에 기재된 내용 (정말 명강의라 한번씩 보며 따라하세요 )--  
댓글 수정, 삭제, 조회  
게시글 수정, 삭제, 조회  
게시글 조회수 조회 가능  
게시글 첨부파일 업로드/다운로드  
유저 가입, 탈퇴, 등급  

-- 제가 추가한 기능 --  
관리자 등급의 유저는 멤버관리 탭에서 일반 유저를 강퇴, 승급 시킬 수 있습니다.  
관리자 등급의 유저는 일반 유저의 글, 댓글을 삭제할 수 있습니다.  
관리자 등급의 유저는 게시글 작성시 작성자에 [관리자] 라는 표시가 생기게 됩니다.  
리스트에서 댓글 수, 첨부파일 여부 확인 가능  
로그인 하지 않으면 글, 댓글 작성 불가능  
작성자만 댓글 삭제 및 글 삭제 가능  
상단 바 구현  

404, 405, 500 html error에 대해서 커스텀마이징을 진행하였습니다.  
web.xml 참고
