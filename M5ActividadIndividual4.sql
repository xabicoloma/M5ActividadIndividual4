CREATE DATABASE registros;
USE registros;

CREATE TABLE usuarios(
	id_usuario VARCHAR(30) PRIMARY KEY, /* Se utilizara un varchar para dar una estructura de user000 para identificar a los usuarios */
    nombre VARCHAR(30) NOT NULL, /* Corresponde solo a letras para el nombre */
    apellido VARCHAR(30) NOT NULL, /*Corresponde solo a letras para el apellido */
    contrasena VARCHAR(50) NOT NULL, /* Se utiliza VARCHAR para poder ingresar caracteres o numeros ademas de letras*/
    zona_horaria VARCHAR(7) DEFAULT 'UTC-3', /* Se utuliza VARCHAR debido a la estructura que tienen las zonas horarias*/
    genero VARCHAR(1), /* VARCHAR CON LARGO DE 1 PARA DEFINIR M O F */
    telefono VARCHAR(20) /* Se utiliza VARCHAR para aceptar la estructura de +569 u otros*/
);

CREATE TABLE ingresos_usuarios(
	id_ingreso INT AUTO_INCREMENT PRIMARY KEY, /*Se utiliza solo un INT para poder registrar un numero unico */
    id_usuario VARCHAR(30), /* Se utilizara un varchar para dar una estructura de user000 para identificar a los usuarios */
    registro_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP, /* Utilizado para poder registrar fecha y hora de registro*/
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) /* Hace referencia a la id del usuario al cual se le está generando el registro*/
);

CREATE TABLE registro_usuarios(
	id_registro INT AUTO_INCREMENT PRIMARY KEY, /* Se utiliza solo un INT para poder registrar un numero unico*/
	id_usuario VARCHAR(30), /* Se utilizara un varchar para dar una estructura de user000 para identificar a los usuarios */
    cantidad_visitas INT DEFAULT 0, /* Se utiliza entero para contar la cantidad de visitas */
    FOREIGN KEY (id_usuario) REFERENCES ingresos_usuarios(id_usuario) /* Hace referencia a la tabla de ingresos lo que permite vincular el id de usario con un registro de ingreso */
);

INSERT INTO usuarios VALUES
	('user001', 'María', 'López', 'contrasena1', 'JST', 'F', '+56987654321'),
	('user002', 'Juan', 'García', 'contrasena2', Default, 'M', '+56976543210'),
	('user003', 'Ana', 'Martínez', 'contrasena3', 'Default', 'F', '+56965432109'),
	('user004', 'Carlos', 'Rodríguez', 'contrasena4', 'AEST', 'M', '+56954321098'),
	('user005', 'Laura', 'Pérez', 'contrasena5', Default, 'F', '+56943210987'),
	('user006', 'Luis', 'Sánchez', 'contrasena6', 'GMT', 'M', '+56932109876'),
	('user007', 'Elena', 'Ramírez', 'contrasena7', Default, 'F', '+56921098765'),
	('user008', 'Javier', 'López', 'contrasena8', 'IST', 'M', '+56910987654');
    
INSERT INTO ingresos_usuarios (id_ingreso, id_usuario) VALUES
	(default,'user001'),
    (default,'user002'),
    (default,'user003'),
    (default,'user004'),
    (default,'user005'),
    (default,'user006'),
    (default,'user007'),
    (default,'user008');
    
INSERT INTO registro_usuarios VALUES 
	(default,'user001',default),
    (default,'user002',5),
    (default,'user003',default),
    (default,'user004',10),
    (default,'user005',15),
    (default,'user006',default),
    (default,'user007',default),
    (default,'user008',20);

DROP TABLE registro_usuarios