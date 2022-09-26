USE noe;

INSERT INTO carreras (id_carrera, nombre)
VALUES
	(1, 'Programacion'),
    (2, 'Data'),
    (3, 'Marketing Digital'),
    (4, 'Diseño UX/UI'),
    (5, 'Artes Digitales')
;

INSERT INTO cursos (id_curso, id_carrera, nombre)
VALUES
	(1, 1, 'Back-End Development'),
    (2, 1, 'Fron-End Development'),
    (3, 1, 'React'),
    (4, 1, 'Python'),
    (5, 2, 'Data Science'),
    (6, 2, 'SQL'),
    (7, 2, 'Power Bi'),
    (8, 3, 'Product Marketing'),
    (9, 3, 'Social Media Ads'),
    (10, 4, 'UX/UI Development'),
    (11, 5, 'Photoshop e Illustrator'),
    (12, 5, 'Animacion')
;

INSERT INTO profesores (id_profesor, first_name, last_name)
VALUES
	(1, 'Lionel', 'Messi'),
    (2, 'Guillermo', 'Ochoa'),
    (3, 'Mohamed', 'Salah'),
    (4, 'Chicharito', 'Hernandez'),
    (5, 'Alisson', 'Becker')
;
    
INSERT INTO clases (id_clase, id_curso, id_profesor, nombre)
VALUES
	(1, 1, 1, 'JavaScript'),
    (2, 1, 2, 'SQL'),
    (3, 1, 1, 'Back-End Development'),
    (4, 2, 2, 'Desarrollo Web'),
    (5, 2, 1, 'JavaScript'),
    (6, 2, 1, 'React'),
    (7, 3, 1, 'Fundamentos React'),
    (8, 3, 1, 'Programacion con React'),
    (9, 4, 1, 'Introduccion Python'),
    (10, 4, 1, 'Programacion con Python'),
    (11, 4, 1, 'Operadores y Controladores'),
    (12, 5, 2, 'Data Analytics'),
    (13, 5, 2, 'SQL'),
    (14, 6, 2, 'Lenguaje SQL'),
    (15, 6, 2, 'Consultas y Subconsultas'),
    (16, 6, 2, 'Sublenguajes'),
    (17, 7, 2, 'Introducción Power Bi'),
    (18, 7, 2, 'Visualización de Datos'),
    (19, 8, 3, 'Community Manager y Publicidad'),
    (20, 8, 3, 'Customer Experience'),
    (21, 8, 3, 'Inbound Marketing'),
    (22, 9, 3, 'Facebook Ads'),
    (23, 9, 3, 'Google Ads'),
    (24, 10, 4, 'Diseño UX/UI'),
    (25, 10, 4, 'Desarrollo Web'),
    (26, 11, 5, 'Color y Tipografía'),
    (27, 11, 5, 'Branding'),
    (28, 12, 5, 'Introducción a la Animación'),
    (29, 12, 5, 'De la hoja a illustrator'),
    (30, 12, 5, 'After Effects')
;

INSERT INTO estudiantes (id_estudiante, id_curso, first_name, last_name, curso_aprobado)
VALUES
	(1, 1, 'Noe', 'Rodriguez', 1),
    (2, 1, 'Andrea', 'Mendivil', 1),
    (3, 1, 'Ricardo', 'Garcia', 0),
    (4, 1, 'Roberto', 'Mendivil', 0),
    (5, 1, 'Luisa', 'Lopez', 1),
    (6, 2, 'Pedro', 'Puga', 0),
    (7, 2, 'Sergio', 'Caballero', 0),
    (8, 2, 'German', 'Ortega', 1),
    (9, 2, 'Gabriel', 'Bravo', 1),
    (10, 2, 'Michael', 'Jackson', 1),
    (11, 3, 'Michael', 'Jordan', 1),
    (12, 3, 'Paul', 'McCartney', 0),
    (13, 3, 'John', 'Lennon', 1),
    (14, 3, 'Ringo', 'Star', 1),
    (15, 3, 'George', 'Harrison', 1),
    (16, 4, 'Rafael', 'Marquez', 0),
    (17, 4, 'Rigo', 'Tovar', 0),
    (18, 4, 'Alfredo', 'Adame', 1),
    (19, 4, 'Pablo', 'Marmol', 1),
    (20, 5, 'Eric', 'Cartman', 1),
    (21, 5, 'John', 'Snow', 1),
    (22, 5, 'Brad', 'Pitt', 1),
    (23, 5, 'Roberto', 'Bolaños', 1)
;

INSERT INTO contacto_estudiantes (id_contacto, id_estudiante, email, telefono)
VALUES
	(NULL, 1, 'noe91@hotmail.com', '333-432-2324'),
	(NULL, 2, 'andream@gmail.com', '412-452-5675'),
    (NULL, 3, 'richardg@yahoo.com', '333-568-9356'),
    (NULL, 4, 'robertm@hotmail.com', '612-234-5345'),
    (NULL, 5, 'wicha2010@yahoo.com', '919-654-7867'),
    (NULL, 6, 'pedrop@hotmail.com', '333-453-4890'),
    (NULL, 7, 'sergio91@hotmail.com', '333-876-4623'),
    (NULL, 8, 'germano91@gmail.com', '333-432-6720'),
    (NULL, 9, 'gabob@hotmail.com', '333-023-9465'),
    (NULL, 10, 'jackson5@hotmail.com', '333-455-2232'),
	(NULL, 11, 'jordan2000@gmail.com', '333-889-9978'),
	(NULL, 12, 'paulmc@gmail.com', '413-455-6455'),
    (NULL, 13, 'lenno_on@gmail.com', '614-545-6657'),
    (NULL, 14, 'ringo_s@gmail.com', '819-232-2234'),
    (NULL, 15, 'harrisong@hotmail.com', '333-554-4445'),
    (NULL, 16, 'rafam9@hotmail.com', '333-666-5656'),
    (NULL, 17, 'rigo_2000@hotmail.com', '333-090-7878'),
    (NULL, 18, 'alfredoa@gmail.com', '333-333-2323'),
    (NULL, 19, 'pablom@hotmail.com', '333-778-7776'),
    (NULL, 20, 'cartman_colorado@hotmail.com', '333-344-5633'),
    (NULL, 21, 'snowj@hotmail.com', '333-787-2321'),
    (NULL, 22, 'pitt_b@gmail.com', '333-999-0903'),
    (NULL, 23, 'chespirito@hotmail.com', '333-111-2121')
    ;
    
INSERT INTO contacto_prof (id_contacto, id_profesor, email, telefono)
VALUES
	(NULL, 1, 'messi10@hotmail.com', '412-222-0000'),
    (NULL, 2, 'memoo1@gmail.com', '333-122-3211'),
    (NULL, 3, 'salah_liv@hotmail.com', '612-111-7756'),
    (NULL, 4, 'chichah10@hotmail.com', '333-122-3344'),
    (NULL, 5, 'becker_liv@hotmail.com', '412-440-6561')
;

INSERT INTO pagos (id_pago, id_estudiante, id_curso, pagado, fecha_hora_pago, monto)
VALUES
	(NULL, 1, 1, 0, NULL, 0),
    (NULL, 2, 1, 1, '2021-11-23', 5939),
    (NULL, 3, 1, 1, '2021-12-09', 5000),
    (NULL, 4, 1, 1, '2021-11-17', 6050),
    (NULL, 5, 1, 0, NULL, 0),
    (NULL, 6, 2, 1, '2022-06-18', 4500),
    (NULL, 7, 2, 0, NULL, 0),
    (NULL, 8, 2, 1, '2022-07-05', 6500),
    (NULL, 9, 2, 1, '2022-07-09', 6500),
    (NULL, 10, 2, 1, '2022-05-23', 5000),
    (NULL, 11, 3, 1, '2022-07-27', 5394),
    (NULL, 12, 3, 0, NULL, 0),
    (NULL, 13, 3, 0, NULL, 0),
    (NULL, 14, 3, 0, NULL, 0),
    (NULL, 15, 3, 1, '2022-08-20', 5400),
    (NULL, 16, 4, 1, '2022-08-18', 5933),
    (NULL, 17, 4, 1, '2022-08-20', 7000),
    (NULL, 18, 4, 1, '2022-08-21', 7000),
    (NULL, 19, 4, 0, NULL, 0),
    (NULL, 20, 5, 1, '2022-07-28', 6340),
    (NULL, 21, 5, 0, NULL, 0),
    (NULL, 22, 5, 1, '2021-06-03', 4299),
    (NULL, 23, 5, 0, NULL, 0)
;
    
    
    