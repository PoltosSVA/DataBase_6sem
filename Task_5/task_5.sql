CREATE OR REPLACE PROCEDURE insert_into_table (
    		p_id NUMBER,
    		p_column1 NUMBER
	)
	IS
	BEGIN
    		INSERT INTO MyTable (id, val)
    		VALUES (p_id, p_column1);
    		DBMS_OUTPUT.PUT_LINE('������ ������� ���������.');
	EXCEPTION
    		WHEN OTHERS THEN
        		DBMS_OUTPUT.PUT_LINE('������: ' || SQLERRM);
	END insert_into_table;


	CREATE OR REPLACE PROCEDURE update_table (
    		p_id NUMBER,
   		p_column1 NUMBER
	)
	IS
	BEGIN
    		UPDATE MyTable
    		SET val = p_column1
    		WHERE id = p_id;
    		DBMS_OUTPUT.PUT_LINE('������ ������� ���������.');
	EXCEPTION
    		WHEN OTHERS THEN
        		DBMS_OUTPUT.PUT_LINE('������: ' || SQLERRM);
	END update_table;

	CREATE OR REPLACE PROCEDURE delete_table_data (
    		p_id NUMBER
	)
	IS
	BEGIN
    		DELETE MyTable
   		WHERE id = p_id;
    		DBMS_OUTPUT.PUT_LINE('������ ������� �������.');
	EXCEPTION
    		WHEN NO_DATA_FOUND THEN
        		DBMS_OUTPUT.PUT_LINE('������ � ID ' || p_id || ' �� �������.');
    		WHEN OTHERS THEN
        		DBMS_OUTPUT.PUT_LINE('������: ' || SQLERRM);
	END delete_table_data;

	EXEC insert_into_table(10001,123)
	EXEC update_table(10001,0)
	EXEC delete_table_data(10001)