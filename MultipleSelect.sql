/*
Print out all the book id, title, publisher, author in given format.
Format : BOOKID.............TITLE.............publisher.............Author 

Structure:
Table: PUBLISHER
Columns: PUBLISHERID, PUBLISHERNAME

Table: BOOK
Columns: BOOKID, TITLE, PUBLISHERID, AUTHOR_ID

Table: AUTHOR
Columns: AUTHORID, FIRSTNAME, LASTNAME

**Use only first 10 characters of the title
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
        SELECT *
        FROM BOOK B
        ORDER BY B.TITLE ASC;
    L_PUB PUBLISHER.PUBLISHERNAME%TYPE;
    L_FNAME AUTHOR.FIRSTNAME%TYPE;
    L_LNAME AUTHOR.LASTNAME%TYPE;
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('BOOKID.............TITLE.............publisher.............Author ');
    
    FOR I IN C1 LOOP
        SELECT PUBLISHERNAME 
        INTO L_PUB
        FROM PUBLISHER
        WHERE PUBLISHERID = I.PUBLISHERID
        AND ROWNUM = 1;
        
        SELECT FIRSTNAME, LASTNAME
        INTO L_FNAME, L_LNAME
        FROM AUTHOR
        WHERE AUTHORID = I.AUTHOR_ID
        AND ROWNUM = 1;
        
        DBMS_OUTPUT.PUT_LINE(I.BOOKID || '...........' || SUBSTR(I.TITLE, 1, 10) ||  '...........' || L_PUB|| '...........' ||  L_FNAME || ' ' || L_LNAME || ' ');
    END LOOP;
END;
/
exit;
