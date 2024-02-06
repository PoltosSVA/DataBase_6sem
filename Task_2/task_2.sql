
	DECLARE
    		v_counter NUMBER := 1;
	BEGIN
    		WHILE v_counter <= 10000 LOOP
        		INSERT INTO MyTable(id, val)
        		VALUES (v_counter,ROUND(dbms_random.VALUE(1,10000)));
        		v_counter := v_counter + 1;
    		END LOOP;
	END;