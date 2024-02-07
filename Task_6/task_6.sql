CREATE OR REPLACE FUNCTION calculate_total_compensation(
        p_monthly_salary VARCHAR2,
        p_annual_bonus_percentage VARCHAR2
) RETURN NUMBER IS
        v_annual_bonus_ratio NUMBER;
        v_total_compensation NUMBER;
        v_monthly_salary NUMBER;
        v_annual_bonus_percentage NUMBER;
BEGIN  
        BEGIN
            IF ISNUMERIC(p_monthly_salary) THEN
                v_monthly_salary := TO_NUMBER(p_monthly_salary);
            ELSE 
                RAISE_APPLICATION_ERROR(-20003,'Не число');
            END IF;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
        END;

        BEGIN
            IF ISNUMERIC(p_annual_bonus_percentage) THEN
                v_annual_bonus_percentage := TO_NUMBER(p_annual_bonus_percentage);
            ELSE 
                RAISE_APPLICATION_ERROR(-20003,'Не число');
            END IF;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
        END;


        IF p_monthly_salary<0 THEN
            RAISE_APPLICATION_ERROR(-20001,'Месячная зарплата должна быть больше 0');
        END IF;

        IF p_annual_bonus_percentage < 0 or p_annual_bonus_percentage >100 THEN
            RAISE_APPLICATION_ERROR(-20002,'Процент должен быть больше от 0 до 100');
        END IF;


        v_annual_bonus_ratio := p_annual_bonus_percentage / 100;
        v_total_compensation := (1 + v_annual_bonus_ratio) * 12 * p_monthly_salary;
        RETURN v_total_compensation;
EXCEPTION
        WHEN VALUE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
END calculate_total_compensation;
	BEGIN
    		dbms_output.put_line(calculate_total_compensation(100,50));
	EXCEPTION
    		WHEN VALUE_ERROR THEN
        		dbms_output.put_line(2/100);
	END;