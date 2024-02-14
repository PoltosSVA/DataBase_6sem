CREATE OR REPLACE PROCEDURE delete_table_data (
    		p_id VARCHAR2
)
IS
    v_id NUMBER;
    v_checker NUMBER;
BEGIN
        v_id := TO_NUMBER(p_id);

        SELECT COUNT(*) INTO v_checker FROM MyTable
        WHERE id = v_id;

        IF v_checker !=1 THEN
            RAISE_APPLICATION_ERROR(-20001,'Data not founded.');
        ELSE
            DELETE MyTable
            WHERE id = v_id;
            DBMS_OUTPUT.PUT_LINE('Data deleted.');
        END IF;      

EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Status: ' || SQLERRM);
END delete_table_data;
