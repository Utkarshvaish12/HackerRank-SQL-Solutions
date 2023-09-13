DELIMITER $$

CREATE PROCEDURE FINDPRIME(X1 INT)
BEGIN
  DECLARE prime_list TEXT DEFAULT '';
  DECLARE I INT;
  DECLARE C INT;
  DECLARE X INT;
  SET X=2;
  WHILE X <=X1 DO
    SET I = 2;
    SET C = 0;
    
    WHILE I <= X / 2 DO
      IF X % I = 0 THEN
        SET C = C + 1;
      END IF;
      SET I = I + 1;
    END WHILE;

    IF C = 0 THEN
      IF LENGTH(prime_list) = 0 THEN
        SET prime_list = CONCAT_WS('', prime_list, X);
      ELSE
        SET prime_list = CONCAT_WS('&', prime_list, X);
      END IF;
    END IF;
    SET X = X + 1;
  END WHILE;
  
  SELECT prime_list AS prime_numbers;
END $$

DELIMITER ;

CALL FINDPRIME(1000);