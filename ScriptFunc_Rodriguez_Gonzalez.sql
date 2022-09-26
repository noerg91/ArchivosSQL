-- Si se ingresa un id de estudiante te regresa el nombre completo concatenado del estudiante

DELIMITER $$

CREATE FUNCTION `nombre_estudiante`(id INT) RETURNS varchar(50)
    READS SQL DATA
BEGIN
	DECLARE nombre VARCHAR (20);
    
    SET nombre = ' ';
    
    SELECT CONCAT (first_name, ' ', last_name) AS Estudiante INTO nombre
    FROM estudiantes
    WHERE id_estudiante = id;
    
    RETURN nombre;
END $$

DELIMITER ;
    
-- Agrega iva del 16% a los montos pagados por los estudiantes

DELIMITER $$

CREATE FUNCTION add_iva (monto_bruto DECIMAL) 
RETURNS decimal(9,2)
DETERMINISTIC
BEGIN
	DECLARE monto_iva DECIMAL(9, 2);
    DECLARE iva DECIMAL(4, 2);
    
    SET monto_iva = 0.00;
    SET iva = 1.16;
    SET monto_iva = monto_bruto * iva;
    
RETURN monto_iva;
END $$

DELIMITER ;
