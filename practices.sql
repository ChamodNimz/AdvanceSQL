
/*
    Author - Chamod_Nimsara AKA DEATHSTROKE
    Version - 1.0
    
*/

    --------------  REMEMBER TO USE    practices database with username - C##demon and Password - 123 --------------------------
                                   ---------------------- for this to work -----------------------

/*  

                                 =========================  ledgend  =========================

    # note that the queries are commented 'works' or 'debuggin' after every query as an indication of functioning or not
    # please highlight the full query to run the query
    # note that this will only work if you create the db and the tables as this is
    
            ------------------------- the script will be provided, run the script to make these work --------------------------
                                        ------------        Thank You        ---------------
*/
            

INSERT INTO STUDENT 
(STUDENT_ID,FIRST_NAME,LAST_NAME,TELEPHONE,ADDRESS) 
VALUES (1,'Chamod','Nimsara','0712341233','463/2/1 Pitipana South Homagama');
-- works

SELECT student_id,first_name from student order by student_id asc;
-- works 


DECLARE 
    v_char VARCHAR2(30);
    v_num NUMBER(2);
BEGIN
    v_char:= 'Chamod Nimsara';
    v_num:= 1;
    
   DBMS_OUTPUT.PUT_LINE(v_char);
   dbms_output.put_line(v_num);
END;
-- works

/*
   ================================================== practice 2 question ================================================
*/
DEFINE 

    val1 =100;
    val2 =10;

DECLARE 
    v_val1 NUMBER(3):=&val1;
    v_val2 NUMBER(2):=&val2;
    v_result NUMBER(3);
    
BEGIN
    v_result:=v_val1/v_val2;
    dbms_output.put_line(v_result);
END;
-- works


/*
    ---------------------------------------------------------------------------------  q2 part 3 
*/
DEFINE
        annual_sal=500 000;
    annual_bonus_rate=0.1;
DECLARE
    v_annual_sal NUMBER(7):=0;
    v_annual_rate NUMBER:=0.1;
    v_comp v_annual_sal%TYPE;
BEGIN
   v_comp:= NVL(v_annual_rate,0)*NVL(v_annual_sal,0); -- handling null values
   DBMS_OUTPUT.PUT_LINE(v_comp);
END;
-- works

/*
   ======================================== practice 3 question ========================================================
*/

--------------------------------------------------------------------------- q 3 part 1
    
    -- creating of department table
    CREATE TABLE DEPARTMENT 
    (
        DEPARTMENT_ID NUMBER  PRIMARY KEY NOT NULL, 
        DEPARTMENT_NAME VARCHAR2(40) NOT NULL,
        MANAGER_ID NUMBER NOT NULL,
        LOCATION_ID NUMBER
    );
    
   -- answer 
   
   DECLARE 
    v_dept_id DEPARTMENT.DEPARTMENT_ID%TYPE;
   
   BEGIN 
   
    SELECT MAX(DEPARTMENT_ID) 
    INTO v_dept_id 
    FROM DEPARTMENT;
   
   DBMS_OUTPUT.PUT_LINE(v_dept_id);
   
   END;
   --works
   
 ---------------------------------------------------------------------------------- q 3 part 2

    DECLARE 
    
        v_new_dept DEPARTMENT.DEPARTMENT_NAME%TYPE := 'education';    
        v_dept_id DEPARTMENT.DEPARTMENT_ID%TYPE;
   
   BEGIN 
   
   -- selecting the max id from department
    SELECT MAX(DEPARTMENT_ID) 
    INTO v_dept_id 
    FROM DEPARTMENT;
    
   -- calculation
    v_dept_id := v_dept_id +10;
    
   -- insertion data
    INSERT  INTO DEPARTMENT
    (DEPARTMENT_ID,DEPARTMENT_NAME)
    VALUES
        (
            v_dept_id, v_new_dept
        );
   
   END;
   
   -- selecting the values entered 
   select * from department;
    
  ----------------------------------------------------------------------------------------- q 3 part 3
    DECLARE 
        v_new_location_id DEPARTMENT.LOCATION_ID%TYPE :=1700;
        v_dept_id DEPARTMENT.DEPARTMENT_ID%TYPE;
        
    BEGIN
        
        --SELECTING THE LAST ENTERED DEPT ID BY SELECTING THE MAX ID 
        SELECT MAX(DEPARTMENT_ID)
        INTO v_dept_id
        FROM DEPARTMENT;
        
        --UPDATING THE LAST ENTERED DEPT  VALUE
        UPDATE DEPARTMENT
        SET LOCATION_ID = v_new_location_id 
        WHERE DEPARTMENT_ID = v_dept_id;

        
    END;
    
    -- SELECTING THE ROW TO SHOW THE EFFECT
    SELECT * FROM DEPARTMENT WHERE DEPARTMENT_ID=280
    
    --works
    
----------------------------------------------------------------------------------------- q 3 part 4 
    
    DECLARE 
        v_dept_id DEPARTMENT.DEPARTMENT_ID%TYPE;
        row_count NUMBER;
    BEGIN
        
        --selecting dapartment query (in this case it will be last value - 280)
        SELECT MAX(DEPARTMENT_ID)
        INTO v_dept_id
        FROM DEPARTMENT;
        
        
        --deleting query
        DELETE FROM DEPARTMENT
        WHERE DEPARTMENT_ID = v_dept_id;
        
        --row_count := SQL;
        IF SQL%ROWCOUNT>0 THEN
            DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT||' : of rows affected');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Nothing updated');
        END IF;
    END;
    
    
   --confirmation of deletion
    SELECT * FROM DEPARTMENT WHERE DEPARTMENT_ID =280;
   --works
    
/*
   ======================================== practice 4 question ========================================================
*/
    
   
----------------------------------------------------------------------------------------- q 4 part 1 
    
-- MESSAGE TABLE CREATION
    CREATE TABLE MESSAGE 
    (
        MESSAGE_ID NUMBER NOT NULL PRIMARY KEY
    );


-- DATA INSERTION USING LOOP
    
    DECLARE 
        v_count NUMBER(2):=1;
    BEGIN
         WHILE v_count <=10 LOOP
                
                IF v_count= 6 OR v_count=8 THEN
                   
                     NULL;   
                ELSE
                    -- INSERTION
                    INSERT INTO MESSAGE
                        VALUES
                        (
                            v_count
                        );
                END IF;
                    v_count:= v_count+1;
         END LOOP;
         
         COMMIT;
    END;
    --works
    
    SELECT * from message;

       
----------------------------------------------------------------------------------------- q 4 part 2
    -- TABLE CREATION
    CREATE TABLE EMPLOYEE 
    (
        EMP_ID  NUMBER PRIMARY KEY NOT NULL,
        EMP_SAL NUMBER(7,2) NOT NULL
    );
    
    -- PL/SQL STATEMENT
    
    DEFINE
        p_empno=2;
    DECLARE
        v_empno NUMBER:=&p_empno;
        v_bonus_rate NUMBER;
        v_comp NUMBER;
        v_sal EMPLOYEE.EMP_SAL%TYPE;
    BEGIN
        
        SELECT EMP_SAL INTO v_sal 
        FROM EMPLOYEE
        WHERE EMP_ID = v_empno;
        
        NVL(v_sal,0); -- to handle null values
        
        IF v_sal>10000  THEN
            v_bonus_rate := 0.2;
        ELSE IF v_sal>5000 THEN
            v_bonus_rate := 0.15;
        ELSE
            v_bonus_rate :=0.1;
            
        END IF;
        
        v_comp := v_bonus_rate * v_sal;
        
        DBMS_OUTPUT.PUT_LINE(v_comp);
    END;
    
    --debugging
/*

======================================== practice 5  question ========================================================      

*/    


       
----------------------------------------------------------------------------------------- q 5 part 1
 -- TABLE CREATION
    CREATE TABLE F_SALARY 
    (
        EMP_ID  NUMBER PRIMARY KEY NOT NULL,
        SALARY NUMBER(7,2)
    );

-- PL/SQL STATEMENT
    DEFINE 
        noof_emps;
    DECLARE
    
    --VARIABLE DECLARATION
        v_no_of_emps NUMBER(2):=&noof_emps;
        v_sal_row EMPLOYEE.EMP_SAL%TYPE;
         
        --creating cursor
        CURSOR emp_sal_cursor IS
        SELECT DISTINCT EMP_SAL
        FROM EMPLOYEE
        ORDER  BY EMP_SAL DESC;
        
    BEGIN
        
        OPEN emp_sal_cursor;
        WHILE emp_sal_cursor%ROWCOUNT < v_no_of_emps LOOP 
            FETCH emp_sal_cursor INTO v_sal_row;
            
            --INSEERTING VALUES INTO F_SALARY TABLE
            INSERT INTO F_SALARY VALUES
            (
                v_sal_row
            );
            
        END LOOP;
        
        --CLOSING CURSOR
        CLOSE emp_sal_cursor;
    END;
    --works
-- NOTE ========= this can be acheived by this query also 
        select distinct emp_sal into emp from employee   order by emp_sal desc fetch first 3 rows only;


/*

    ======================================== practice 6  question ========================================================      

*/ 

DECLARE 
    
    --VARIABLE DECLRATION
    v_dept_id DEPARTMENT.DEPARTMENT_ID%TYPE;
    v_dept_name DEPARTMENT.DEPARTMENT_NAME%TYPE; /*NOTE =====
                                                    these variables are for accessing and filling cursor data to these
                                                    variables BUT a more dynamic way is to 
                                                  */
    
    
    --ASSUMING THE DEPARTMENT ID IS NOT DUPLIACTING ANY VALUES
    CURSOR dpt_cursor IS
    SELECT DEPARTMENT_ID,DEPARTMENT_NAME 
    FROM DEPARTMENT 
    WHERE DEPARTMENT_ID <300; --changed the value coz of my data set (value should be 100)

    CURSOR emp_cusor
BEGIN

    OPEN dpt_cursor;
    LOOP
        EXIT WHEN dpt_cursor%NOTFOUND 
        --cursor calling 
            FETCH dept_cursor INTO v_dept_id, v_dept_name 
            emp_cusor();
    END LOOP;

END;


