CREATE OR REPLACE FUNCTION calculate_total_compensation(
        p_monthly_salary VARCHAR2,
        p_annual_bonus_percentage VARCHAR2
) RETURN NUMBER IS
        v_annual_bonus_ratio NUMBER;
        v_total_compensation NUMBER;
        v_monthly_salary NUMBER;
        v_annual_bonus_percentage NUMBER;
BEGIN  

        v_monthly_salary := TO_NUMBER(p_monthly_salary);
        v_annual_bonus_percentage := FLOOR(TO_NUMBER(p_annual_bonus_percentage));

        IF v_monthly_salary<0 THEN
            RAISE_APPLICATION_ERROR(-20001,'Month salart need be > 0');
        END IF;

        IF v_annual_bonus_percentage < 0 or v_annual_bonus_percentage >100 THEN
            RAISE_APPLICATION_ERROR(-20002,'Percent need be [0,100]');
        END IF;


        v_annual_bonus_ratio := v_annual_bonus_percentage / 100;
        v_total_compensation := (1 + v_annual_bonus_ratio) * 12 * v_monthly_salary;
        RETURN v_total_compensation;
EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20005,'Something wrong');
            DBMS_OUTPUT.PUT_LINE('Status: ' || SQLERRM);
END calculate_total_compensation;

BEGIN
        dbms_output.put_line(calculate_total_compensation(1,100));
EXCEPTION
        WHEN VALUE_ERROR THEN
            dbms_output.put_line(2/100);
END;
