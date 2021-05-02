/*EMP 테이블에 1개의 새로운 칼럼을 추가하는 SQL문을 작성하고 실행 후, 테이블의 구조를 출력하라.*/
ALTER TABLE EMP
ADD (ADDRESS CHAR(80));

/*EMP 테이블에 존재하는 칼럼 2가지에 대해 MODIFY를 실행하는 SQL문을 작성하고 실행 후, 테이블의 구조를 출력하라. 
(단, 각 칼럼에 대해서 다른 유형에 대한 MODIFY를 해야 한다.)*/
ALTER TABLE EMP
MODIFY (ADDRESS VARCHAR2(80),
        JOB NOT NULL);
        
/*EMP 테이블의 특정 칼럼 1개의 이름을 바꾸는 SQL문을 작성하고 실행 후, 테이블의 구조를 출력하라.*/
ALTER TABLE EMP
RENAME COLUMN ENAME TO NAME;

/*● EMP 테이블의 칼럼 1개에 대해 새로운 제약조건을 생성하는 SQL문을 작성하고 
실행 후, 이를 확인할 수 있도록 출력하라.*/
ALTER TABLE EMP
ADD UNIQUE(NAME);
