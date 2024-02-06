CREATE OR REPLACE FUNCTION generate_insert_statement(p_id NUMBER) RETURN VARCHAR2
	IS
        	v_insert_statement VARCHAR2(4000);
	BEGIN
        	v_insert_statement := 'INSERT INTO MyTable(id,val) VALUES('||p_id||','||ROUND(dbms_random.VALUE(1,10000))||');';
        
        	RETURN v_insert_statement;
	END generate_insert_statement;