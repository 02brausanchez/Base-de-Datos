CREATE DATABASE tarea3_bancoBD;
USE tarea3_bancoBD;

-- Tabla sucursal
CREATE TABLE sucursal (
    nombre_sucursal VARCHAR(100) PRIMARY KEY,
    ciudad_sucursal VARCHAR(100) NOT NULL,
    activos DECIMAL(15,2) NOT NULL
);

-- Tabla cuenta
CREATE TABLE cuenta (
    numero_cuenta INT PRIMARY KEY,
    nombre_sucursal VARCHAR(100) NOT NULL,
    saldo DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (nombre_sucursal) REFERENCES sucursal(nombre_sucursal)
);

-- Tabla cliente
CREATE TABLE cliente (
    nombre_cliente VARCHAR(100) PRIMARY KEY,
    calle_cliente VARCHAR(255) NOT NULL,
    ciudad_cliente VARCHAR(255) NOT NULL
);

-- Tabla impositor (relaciona clientes con cuentas)
CREATE TABLE impositor (
    nombre_cliente VARCHAR(100),
    numero_cuenta INT,
    PRIMARY KEY (nombre_cliente, numero_cuenta),
    FOREIGN KEY (nombre_cliente) REFERENCES cliente(nombre_cliente),
    FOREIGN KEY (numero_cuenta) REFERENCES cuenta(numero_cuenta)
);

-- Tabla préstamo
CREATE TABLE prestamo (
    numero_prestamo INT PRIMARY KEY,
    nombre_sucursal VARCHAR(100) NOT NULL,
    importe DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (nombre_sucursal) REFERENCES sucursal(nombre_sucursal)
);

-- Tabla prestatario (relaciona clientes con préstamos)
CREATE TABLE prestatario (
    nombre_cliente VARCHAR(100),
    numero_prestamo INT,
    PRIMARY KEY (nombre_cliente, numero_prestamo),
    FOREIGN KEY (nombre_cliente) REFERENCES cliente(nombre_cliente),
    FOREIGN KEY (numero_prestamo) REFERENCES prestamo(numero_prestamo)
);

-- Tabla informacion_credito
CREATE TABLE informacion_credito (
    nombre_cliente VARCHAR(100),
    limite DECIMAL(15,2) NOT NULL,
    saldo_credito DECIMAL(15,2) NOT NULL,
    PRIMARY KEY (nombre_cliente, limite, saldo_credito),
    FOREIGN KEY (nombre_cliente) REFERENCES cliente(nombre_cliente)
);

-- Tabla empleado
CREATE TABLE empleado (
    nombre_empleado VARCHAR(100) PRIMARY KEY,
    calle VARCHAR(255) NOT NULL,
    ciudad VARCHAR(255) NOT NULL
);

-- Tabla trabajo_por_horas
CREATE TABLE trabajo_por_horas (
    nombre_empleado VARCHAR(100) NOT NULL,
    nombre_sucursal VARCHAR(100) NOT NULL,
    sueldo DECIMAL(15,2) NOT NULL,
    PRIMARY KEY (nombre_empleado, nombre_sucursal),
    FOREIGN KEY (nombre_empleado) REFERENCES empleado(nombre_empleado),
    FOREIGN KEY (nombre_sucursal) REFERENCES sucursal(nombre_sucursal)
);

-- Tabla trabajo_a_tiempo_completo
CREATE TABLE trabajo_a_tiempo_completo (
    nombre_empleado VARCHAR(100) NOT NULL,
    nombre_sucursal VARCHAR(100) NOT NULL,
    sueldo DECIMAL(15,2) NOT NULL,
    PRIMARY KEY (nombre_empleado, nombre_sucursal),
    FOREIGN KEY (nombre_empleado) REFERENCES empleado(nombre_empleado),
    FOREIGN KEY (nombre_sucursal) REFERENCES sucursal(nombre_sucursal)
);
-- Inserción de datos
INSERT INTO sucursal (nombre_sucursal, ciudad_sucursal, activos) VALUES
	('Becerril', 'Aluche', 400000),
	('Centro', 'Arganzuela', 9000000),
	('Collado Mediano', 'Aluche', 8000000),
	('Galapagar', 'Arganzuela', 7100000),
	('Moralzarzal', 'La Granja', 2100000),
	('Navacerrada', 'Aluche', 1700000),
	('Navas de la Asunción', 'Alcala de Henares', 300000),
	('Segovia', 'Cerceda', 3700000),
	('Leganes', 'Cadiz', 700000),
	('Majadahonda', 'Mostoles', 1100000),
	('Fuenlabrada', 'Leon', 3900000);
INSERT INTO cuenta (numero_cuenta, nombre_sucursal, saldo) VALUES
	(101, 'Centro', 500),
    (102, 'Navacerrada', 400),
    (201, 'Galapagar', 900),
    (215, 'Becerril', 700),
    (217, 'Galapagar', 750),
    (222, 'Moralzarzal', 700),
    (305, 'Collado Mediano', 350);
INSERT INTO cliente (nombre_cliente, calle_cliente, ciudad_cliente) VALUES
	('Abril', 'Preciados', 'Valsain'),
	('Amo', 'Embajadores', 'Arganzuela'),
	('Badorrey', 'Delicias', 'Valsain'),
	('Fernandez', 'Jazmin', 'Leon'),
	('Gomez', 'Carretas', 'Cerceda'),
	('Gonzalez', 'Arenal', 'La Granja'),
	('Lopez', 'Mayor', 'Peguerinos'),
	('Perez', 'Carretas', 'Cerceda'),
	('Rodriguez', 'Yeserias', 'Cadiz'),
	('Ruperez', 'Ramblas', 'Leon'),
	('Santos', 'Mayor', 'Peguerinos'),
    ('Sotoca', 'Arenal', 'La Granja'),
	('Valdivieso', 'Goya', 'Vigo');
INSERT INTO impositor (nombre_cliente, numero_cuenta) VALUES
	('Abril', 305),
	('Gomez', 215),
	('Gonzalez', 101),
	('Gonzalez', 201),
	('Lopez', 102),
	('Ruperez', 222),
	('Santos', 217);
INSERT INTO prestamo (numero_prestamo, nombre_sucursal, importe) VALUES
	(11, 'Collado Mediano', 900),
	(14, 'Centro', 1500),
	(15, 'Navacerrada', 1500),
	(16, 'Navacerrada', 1300),
	(17, 'Centro', 1000),
	(23, 'Moralzarzal', 2000),
	(93, 'Becerril', 500);
INSERT INTO prestatario (nombre_cliente, numero_prestamo) VALUES
	('Fernandez', 16),
	('Gomez', 11),
	('Gomez', 23),
	('Lopez', 15),
	('Perez', 93),
	('Santos', 17),
	('Sotoca', 14),
	('Valdivieso', 17);
INSERT INTO informacion_credito (nombre_cliente, limite, saldo_credito) VALUES
	('Gomez', 2000, 400),
	('Lopez', 1500, 1500),
	('Perez', 2000, 1750),
	('Santos', 6000, 700);
INSERT INTO empleado (nombre_empleado, calle, ciudad) VALUES
	('Barea', 'Carretas', 'Cerceda'),
	('Cana', 'Preciados', 'Valsain'),
	('Cascallar', 'Mayor', 'Peguerinos'),
	('Catalan', 'Ramblas', 'Leon'),
	('Diaz', 'Embajadores', 'Arganzuela'),
	('Dominguez', 'Viaducto', 'Villaconejos'),
	('Fernandez', 'Yeserias', 'Cadiz'),
	('Gomez', 'Bailen', 'Alcorcon'),
	('Gonzalez', 'Delicias', 'Valsain'),
	('Jimenez', 'Jazmin', 'Leon'),
	('Ribera', 'Preciados', 'Valsain'),
	('Segura', 'Tebeo', 'La Loma'),
	('Valdivieso', 'Fuencarral', 'Mostoles');
INSERT INTO trabajo_por_horas (nombre_empleado, nombre_sucursal, sueldo) VALUES
	('Cana', 'Leganes', 1500),
	('Cascallar', 'Navacerrada', 5300),
	('Catalan', 'Leganes', 1600),
	('Diaz', 'Centro', 1300),
	('Fernandez', 'Navacerrada', 1500),
	('Gonzalez', 'Centro', 1500),
	('Jimenez', 'Centro', 2500),
	('Ribera', 'Navacerrada', 1300);
INSERT INTO trabajo_a_tiempo_completo (nombre_empleado, nombre_sucursal, sueldo) VALUES
	('Segura', 'Majadahonda', 1500),
	('Dominguez', 'Majadahonda', 1300),
	('Barea', 'Fuenlabrada', 5300),
	('Valdivieso', 'Fuenlabrada', 1500);
    
/*
De acuerdo despues de obtener todos los datos En este Script anteriormente
tocara hacer las consultas correspondientes que se nos piden.
*/
use tarea3_bancoBD;
-- SELECT * FROM cliente; 
-- 1.​ Obtener todos los clientes que viven en la ciudad de 'Segovia'.
-- Dado que la ciudad Segovia no se encuentra en la tabla cliente, se encuentra en la tabla surcusal y y pertence a la columna nombre_sucursal. 
SELECT * FROM sucursal WHERE nombre_sucursal = 'Segovia'; 

-- 2. Mostrar todas las sucursales que tienen más de 500 mil en activos pero menos de millones .
SELECT * FROM sucursal WHERE activos > 500000 AND activos < 1000000; 

-- 3.​ Obtener los nombres y ciudad de todos los clientes registrados en el banco.
-- Aqui utilizamos el concepto de proyeccion donde se seleccionan solo las columnas nombre_cliente y ciudad_cliente de cliente
SELECT nombre_cliente, ciudad_cliente FROM cliente; 

-- 4.​ Mostrar los nombres y calles de residencia de todos los empleados.
-- Utilizamos el concepto de proyeccion donde se seleccionan solo las columnas nombre_empleado y calle de empleado
SELECT nombre_empleado, calle FROM empleado; 

-- 5.​ Obtener una lista combinada de todas las ciudades donde hay clientes y empleados, sin duplicados.
-- Se hace la union de los 2 conjuntos de cuidad_cliente y ciudad de la tabla cliente y tabla empleado sin considerar duplicados
SELECT  ciudad_cliente FROM cliente
UNION 
SELECT ciudad FROM empleado; 
-- SELECT * FROM empleado; 
-- 6.​ Mostrar una lista de todos los sueldos de los empleados, sin duplicados.
-- De manera similar anteriormente se hace la union de conjuntos sueldo de las tablas: trabajo_por_horas y trabajo_a_tiempo_completo 
SELECT sueldo FROM trabajo_por_horas
UNION
SELECT sueldo FROM trabajo_a_tiempo_completo; 

-- 7.​ Obtener los nombres de clientes que tienen al menos una cuenta registrada.
-- Hacemos la proyeccion.Se seleccionan unicamente nombre_cliente de impositor
SELECT nombre_cliente FROM impositor;
 
-- 8.​ Listar los nombres de las sucursales que han otorgado al menos un préstamo.
SELECT nombre_sucursal FROM prestamo;  

-- 9.​ Obtener todas las combinaciones posibles de clientes y sucursales.
-- Se utiliza el producto cartesiano de cliente x sucursal
SELECT * FROM cliente, sucursal; 

-- 10.​Obtener todas las combinaciones posibles de empleados y cuentas.
-- Se utiliza el producto cartesiano de empleado x cuenta
SELECT * FROM empleado, cuenta; 

-- 11.​Mostrar los nombres de todas las columnas de los clientes con un alias diferente.
-- Antes
SELECT nombre_cliente FROM cliente; 
-- Despues Renombramos
SELECT nombre_cliente AS cliente_nombre FROM cliente;
 
-- 12. Renombrar la columna saldo_credito de la tabla informacion_credito en una consulta como saldo_usado.
-- Antes 
SELECT saldo_credito FROM informacion_credito; 
-- Despues Renombramos 
SELECT saldo_credito AS saldo_usado FROM informacion_credito; 

-- 13.​Obtener los clientes que tienen una cuenta pero no un préstamo registrado.
SELECT nombre_cliente FROM cliente 
WHERE nombre_cliente NOT IN (SELECT nombre_cliente FROM prestatario);

-- 14.​Mostrar los nombres que aparezcan tanto en clientes como en empleados.
SELECT DISTINCT c.nombre_cliente AS nombre
FROM cliente c
WHERE EXISTS (
	SELECT 1
	FROM empleado e
	WHERE e.nombre_empleado = c.nombre_cliente
);

-- 15.​Obtener la relación entre clientes y sus prestamos.
SELECT * FROM cliente 
NATURAL JOIN prestatario
NATURAL JOIN prestamo; 

-- 16.​Obtener la relación entre clientes y sucursales en las que han solicitado préstamos, utilizando una reunión natural.

