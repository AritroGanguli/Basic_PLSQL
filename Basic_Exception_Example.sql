/*

Print out all the DEPT_ID from EMP table which are unavailable in DEPT table

Structure:

Table: DEPT
Columns: DEPT_ID, DEPT_NAME

Table: EMP
Columns: DEPT_ID, EMP_ID, EMP_NAME

*/

SET NULL "NULL";
SET FEEDBACK OFF;
SET ECHO OFF;
SET HEADING OFF;
SET WRAP OFF;
SET LINESIZE 10000;
SET TAB OFF;
SET PAGES 0;
SET DEFINE OFF;

SET SERVEROUTPUT ON;
DECLARE
    CURSOR C1 IS 
    SELECT DISTINCT E.DEPT_ID
        FROM EMP E;
    L_PRESENT DEPT.DEPT_ID%TYPE;
    
BEGIN
    FOR I IN C1 LOOP
        L_PRESENT := 0;
        BEGIN
            SELECT D.DEPT_ID 
                INTO L_PRESENT
            FROM DEPT D 
            WHERE D.DEPT_ID = I.DEPT_ID
            AND ROWNUM = 1;
        EXCEPTION 
            WHEN no_data_found THEN
                dbms_output.put_line('Dept ID :'||I.DEPT_ID||' is not a valid ID');
        END;
    END LOOP;
END;
/
exit;
