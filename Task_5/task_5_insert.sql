CREATE OR REPLACE PROCEDURE insert_into_table (
    		p_id VARCHAR2,
    		p_column1 VARCHAR2
)
IS
    v_id NUMBER;
    v_column1 NUMBER;
    v_checker NUMBER;
BEGIN
        v_id := TO_NUMBER(p_id);
        v_column1 := TO_NUMBER(v_column1);
        
        SELECT COUNT(*) INTO v_checker FROM MyTable
        WHERE id = v_id;
        
        IF v_checker = 1 THEN
             DBMS_OUTPUT.PUT_LINE('This ID is already in the table.');
        ELSIF v_checker = 0 THEN
            INSERT INTO MyTable (id, val)
            VALUES (v_id, v_column1);
            DBMS_OUTPUT.PUT_LINE('Values insert into a table.');
        ELSE
            RAISE_APPLICATION_ERROR(-20001,'Something wrong.');
        END IF;

EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Status: ' || SQLERRM);
END insert_into_table;