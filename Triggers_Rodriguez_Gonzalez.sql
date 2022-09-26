-- 1) Trigger que reportan a tabla LOG new_estudiante cuando se inserta uno nuevo

	-- SCRIPT creación de tabla auditoría
    CREATE TABLE new_estudiantes (
	id_estudiante INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(50),
    acciono_usuario CHAR(50),
    fecha DATE,
    hora TIME
	);
    
    -- SCRIPT del TRIGGER
    DELIMITER $$
    
    CREATE TRIGGER `tr_add_estudiante`
	BEFORE INSERT ON `estudiantes`
	FOR EACH ROW
	INSERT INTO `new_estudiantes` (id_estudiante, first_name, last_name, acciono_usuario, fecha, hora)
	VALUES (NEW.id_estudiante, NEW.first_name, NEW.last_name, session_user(), current_date(), current_time()); 
    
    DELIMITER $$
    
-- 2) Trigger que reporta a tabla LOG deleted_carreras

	-- SCRIPT creación de tabla auditoría
    CREATE TABLE new_carreras (
	id_carrera INT PRIMARY KEY,
    nombre VARCHAR(50),
    acciono_usuario CHAR(50),
    fecha DATE,
    hora TIME
	);
    
    -- SCRIPT del TRIGGER
    DELIMITER $$
    
    CREATE TRIGGER `tr_delete_carrera`
	AFTER DELETE ON `carreras`
	FOR EACH ROW
	INSERT INTO `new_carreras` (id_carrera, nombre, acciono_usuario, fecha, hora)
	VALUES (OLD.id_carrera, OLD.nombre, session_user(), current_date(), current_time());
    
    DELIMITER $$
    