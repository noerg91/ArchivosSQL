CREATE DATABASE IF NOT EXISTS noe;

USE noe;

CREATE TABLE IF NOT EXISTS carreras (
	id_carrera INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS cursos (
	id_curso INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_carrera INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_carrera)
		REFERENCES carreras (id_carrera)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS estudiantes (
	id_estudiante INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL, 
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    curso_aprobado TINYINT NOT NULL DEFAULT 0,
    FOREIGN KEY (id_curso)
		REFERENCES cursos (id_curso)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS contacto_estudiantes (
	id_contacto INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    telefono VARCHAR(15) UNIQUE,
    FOREIGN KEY (id_estudiante)
		REFERENCES estudiantes (id_estudiante)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS pagos (
	id_pago INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    pagado TINYINT NOT NULL DEFAULT 0,
    fecha_hora_pago TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    monto INT, 
    FOREIGN KEY (id_estudiante)
		REFERENCES estudiantes (id_estudiante)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (id_curso)
		REFERENCES cursos (id_curso)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS profesores (
	id_profesor INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS contacto_prof (
	id_contacto INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_profesor INT NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    telefono VARCHAR(50),
    FOREIGN KEY (id_profesor)
		REFERENCES profesores (id_profesor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Creación de tabla de auditoría relacionada con la tabla Estudiantes:

CREATE TABLE IF NOT EXISTS new_estudiantes (
	id_estudiante INT NOT NULL PRIMARY KEY,
	first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(50),
	acciono_usuario CHAR(50) DEFAULT NULL,
	fecha DATE DEFAULT NULL,
	hora TIME DEFAULT NULL
);

-- Creación de tabla de auditoría relacionada con la tabla Carreras:
CREATE TABLE deleted_carreras (
	id_carrera INT NOT NULL,
	nombre VARCHAR(50) DEFAULT NULL,
	acciono_usuario CHAR(50) DEFAULT NULL,
	fecha DATE DEFAULT NULL,
	hora TIME DEFAULT NULL
);
