CREATE OR REPLACE FUNCTION even_odd_count RETURN VARCHAR2
	IS
    		v_even_count NUMBER(10) := 0;
    		v_odd_count NUMBER(10) := 0;
    		v_result VARCHAR2(10);
	BEGIN
    		SELECT COUNT(*) INTO v_even_count
    		FROM MyTable
    		WHERE MOD(val,2) = 0;
    
    		SELECT COUNT(*) INTO v_odd_count
    		FROM MyTable
   	 	WHERE MOD(val,2) != 0;
    
    		IF v_even_count > v_odd_count THEN
        		v_result := 'TRUE';
    		ELSIF v_even_count< v_odd_count THEN
        		v_result := 'FALSE';
    		ELSE
        		v_result := 'EQUAL';
    		END IF;
    		RETURN v_result;
	END even_odd_count;

	
	BEGIN

        	dbms_output.PUT_LINE(even_odd_count());
	END;