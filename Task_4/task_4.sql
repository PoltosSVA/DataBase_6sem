CREATE OR REPLACE FUNCTION generate_insert_statement(p_id VARCHAR2) RETURN VARCHAR2
IS
        v_insert_statement VARCHAR2(4000):='NONE';
        v_temp_check NUMBER;
        v_id NUMBER;
BEGIN
        v_id:=TO_NUMBER(p_id);

        SELECT COUNT(*)INTO v_temp_check from MyTable
        WHERE id = v_id;

        IF v_temp_check = 1 THEN
            v_insert_statement := 'This ID is already in the table.';
        ELSIF v_temp_check = 0 THEN
            v_insert_statement := 'INSERT INTO MyTable(id,val) VALUES('||v_id||','||ROUND(dbms_random.VALUE(1,10000))||');';
        ELSE
            RAISE_APPLICATION_ERROR(-20001,'Something wrong.');
        END IF;

        RETURN v_insert_statement;
EXCEPTION
     WHEN VALUE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE('Argument error' || SQLERRM);
END generate_insert_statement;
