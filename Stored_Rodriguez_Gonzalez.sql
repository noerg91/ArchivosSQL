-- 1) Agrega a un profesor nuevo a la tabla profesores (nombre y apellido).

DELIMITER $$

CREATE PROCEDURE `add_profesor`(IN nombre CHAR(50), IN apellido CHAR(50))
BEGIN    
    IF nombre AND apellido = '' THEN
		SET @mensaje = 'SELECT "ERROR: No product created"';
	ELSE
		SET @mensaje = CONCAT('INSERT INTO noe.profesores (first_name, last_name) VALUES ("', nombre, '", ', '"', apellido, '")');
        /*'INSERT INTO noe.profesores (first_name, last_name) VALUES ('nombre', 'apellido');*/
        SET @seleccionar = 'SELECT * FROM noe.profesores ORDER BY id_profesor DESC';
	END IF;
    
    PREPARE querySQL FROM @mensaje;
    EXECUTE querySQL;
    DEALLOCATE PREPARE querySQL;
    
    PREPARE querySQL FROM @seleccionar;
    EXECUTE querySQL;
    DEALLOCATE PREPARE querySQL;
END $$

-- 2) Procedimiento que te pregunta qué columna de la tabla clases quieres ordenar y cómo la quieres ordenar (ASC o DESC).

DELIMITER $$

CREATE PROCEDURE `sp_order_clases2`(IN orderColumn CHAR(20), ASC_or_DESC CHAR(5))
BEGIN

    SET @clausula = CONCAT('SELECT * FROM noe.clases ORDER BY ', orderColumn, ' ', ASC_or_DESC);
    /* @clausila = 'SELECT * FROM noe.clases ORDER BY nombre ASC' */
    
    PREPARE querySQL FROM @clausula;
    EXECUTE querySQL;
    DEALLOCATE PREPARE querySQL;
END $$
