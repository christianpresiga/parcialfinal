
CREATE TYPE number_array AS VARRAY(100) OF INTEGER;

DECLARE
   ARRAY number_array := number_array(1,2,3,4,5,6);
   k INTEGER := 5;
BEGIN
    FOR i IN 1..ARRAY.COUNT LOOP
    FOR j IN 1..ARRAY.COUNT LOOP
    IF ((i<j) and ( mod (ARRAY(i) + ARRAY(j),k)=0))
    THEN
    DBMS_OUTPUT.PUT_LINE('['||ARRAY(i)||','||ARRAY(j)||']');
    END IF;
    END LOOP;
    END LOOP;
END;

CREATE OR REPLACE FUNCTION divisible_sum_pairs(ARRAY IN number_array, K IN INTEGER) 
RETURN INTEGER IS 
NUMERO integer;
FALLO EXCEPTION;
ARRAY_ERROR EXCEPTION;
BEGIN
NUMERO := 0;
   IF k < 1 AND k > 100 THEN
     RAISE FALLO;
     END IF ;
      FOR i IN 1..ARRAY.COUNT LOOP
        IF ARRAY(i) < 1 AND ARRAY(i) > 100 THEN
            RAISE ARRAY_ERROR;
        END IF;
        FOR j IN 1..ARRAY.COUNT LOOP
            IF ((i < j) AND (MOD(ARRAY(i) + ARRAY(j), k) = 0))
            THEN
                NUMERO := NUMERO+1;
            END IF;
        END LOOP;
        
    END LOOP;
    RETURN NUMERO;
    
    EXCEPTION  
    WHEN FALLO THEN 
        DBMS_OUTPUT.PUT_LINE('el valor de k no esta definido entre  1 y 100 ');
        RETURN -1;
    WHEN ARRAY_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Tel valor de k no esta definido entre  1 y 100');
        RETURN -1;
END;

DECLARE
RESULT INTEGER;
K INTEGER := 5;
ARRAY  NUMBER_ARRAY := NUMBER_ARRAY(1,3,2,6,1,2);

BEGIN   
    RESULT:=DIVISIBLE_SUM_PAIRS(ARRAY,K);
    DBMS_OUTPUT.PUT_LINE(RESULT);
END;

      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
