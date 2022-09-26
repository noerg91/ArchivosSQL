USE mysql;

-- Creación del primer usuario:
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'user1';

-- Este primer usuario solo tendrá permiso de lectura sobre todas las tablas:
GRANT SELECT ON noe.* TO 'user1'@'localhost';

-- Creación del segundo usuario:
CREATE USER 'user2'@'localhost' IDENTIFIED BY 'user2';

-- Este segundo usuario tendrá permisos de lectura, inserción y modificación sobre todas las tablas:
GRANT SELECT, INSERT, UPDATE ON noe.* TO 'user2'@'localhost';