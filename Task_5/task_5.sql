CREATE OR REPLACE PROCEDURE insert_into_table (
    		p_id NUMBER,
    		p_column1 NUMBER
	)
	IS
	BEGIN
    		INSERT INTO MyTable (id, val)
    		VALUES (p_id, p_column1);
    		DBMS_OUTPUT.PUT_LINE('Запись успешно добавлена.');
	EXCEPTION
    		WHEN OTHERS THEN
        		DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
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
    		DBMS_OUTPUT.PUT_LINE('Запись успешно обновлена.');
	EXCEPTION
    		WHEN OTHERS THEN
        		DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
	END update_table;

	CREATE OR REPLACE PROCEDURE delete_table_data (
    		p_id NUMBER
	)
	IS
	BEGIN
    		DELETE MyTable
   		WHERE id = p_id;
    		DBMS_OUTPUT.PUT_LINE('Запись успешно удалена.');
	EXCEPTION
    		WHEN NO_DATA_FOUND THEN
        		DBMS_OUTPUT.PUT_LINE('Запись с ID ' || p_id || ' не найдена.');
    		WHEN OTHERS THEN
        		DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
	END delete_table_data;

	EXEC insert_into_table(10001,123)
	EXEC update_table(10001,0)
	EXEC delete_table_data(10001)