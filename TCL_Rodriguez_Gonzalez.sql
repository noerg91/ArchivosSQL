-- Primera tabla:
START TRANSACTION;

/* Tabla profesores: Se eliminan 2 registros. */
DELETE FROM profesores WHERE id_profesor > 11;

-- ROLLBACK;

-- COMMIT;

/* Reinserción de datos a la tabla profesores */
-- INSERT INTO profesores (id_profesor, first_name, last_name) VALUES (19, 'Michael', 'Jackson');
-- INSERT INTO profesores (id_profesor, first_name, last_name) VALUES (20, 'Pedro', 'Picapiedra');

-- Segunda tabla:
START TRANSACTION;

/* Tabls carreras: Se insertan 8 nuevos registros */
INSERT INTO carreras (id_carrera, nombre) VALUES (6, 'Community Manager');
INSERT INTO carreras (id_carrera, nombre) VALUES (7, 'Production Media');
INSERT INTO carreras (id_carrera, nombre) VALUES (8, 'Finanzas');
INSERT INTO carreras (id_carrera, nombre) VALUES (9, 'Cloud Engineer');

SAVEPOINT sp_1;

INSERT INTO carreras (id_carrera, nombre) VALUES (10, 'Digital Advertising');
INSERT INTO carreras (id_carrera, nombre) VALUES (11, 'Product Design');
INSERT INTO carreras (id_carrera, nombre) VALUES (12, 'UX Writing');
INSERT INTO carreras (id_carrera, nombre) VALUES (13, 'UX Research');

SAVEPOINT sp_2;

ROLLBACK TO sp_1;

/* Eliminación del savepoint de los primeros 4 registros insertados */
-- RELEASE SAVEPOINT sp_1;

-- COMMIT;
