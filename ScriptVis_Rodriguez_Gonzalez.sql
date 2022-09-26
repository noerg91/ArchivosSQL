USE noe;

-- 1. Visualizar nombre completo de alumnos y en qué curso está cada uno.

CREATE OR REPLACE VIEW vEstudiantes_cursos
AS
	SELECT 
		c.nombre AS 'curso',
		e.first_name, e.last_name
	FROM cursos c
	JOIN estudiantes e ON c.id_curso = e.id_curso
;

-- 2. Visualizar nombre completo de estudiantes que hayan pagado durante este año 2022.

CREATE OR REPLACE VIEW vEstudiantes_pago_2022
AS
	SELECT 
		e.first_name, e.last_name, 
        p.fecha_hora_pago AS 'Pagos 2022'
	FROM pagos p
	JOIN estudiantes e ON e.id_estudiante = p.id_estudiante
	WHERE p.fecha_hora_pago >= '2022-01-01'
;

-- 3. Visualiza las clases y qué profesor imparte cada una.

CREATE OR REPLACE VIEW vClases_profesores
AS
	SELECT 
		p.first_name, p.last_name,
		c.nombre AS 'clase'
	FROM profesores p
	JOIN clases c ON p.id_profesor = c.id_profesor
;
    
-- 4. Visualiza cuántos cursos tiene cada una de las carreras.

CREATE OR REPLACE VIEW vCount_cursos
AS
	SELECT
		ca.nombre AS 'Carrera',
		COUNT(cu.nombre) AS 'no. de Cursos'
	FROM carreras ca
	JOIN cursos cu ON ca.id_carrera = cu.id_carrera
	GROUP BY cu.id_carrera
;

-- 5. Visualiza el email de cada uno de los estudiantes

CREATE OR REPLACE VIEW vEmail_estudiantes
AS
	SELECT
		e.first_name, e.last_name,
        c.email
	FROM estudiantes e
    JOIN contacto_estudiantes c ON e.id_estudiante = c.id_estudiante
;

