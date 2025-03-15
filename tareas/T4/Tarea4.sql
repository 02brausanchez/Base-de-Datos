-- ===========================================================
-- Tarea 4: OPERACIONES AVANZADAS EN MYSQL
-- Base de datos utilizada: banco
-- Integrantes: Sanchez Morales Braulio Eduardo && Silva Martínez Jesús Alfredo
-- ===========================================================
USE banco;
-- ===========================================================
-- 1. PROYECCIÓN GENERALIZADA
-- Permite modificar el valor de un atributo en una consulta.
-- Se usa para hacer cálculos o transformar datos sin modificar la base.
-- ===========================================================
-- Ejercicio 1: Aplicar un descuento del 10% al saldo de todas las cuentas en la consulta.
-- Debe mostrar las columnas numero_cuenta, nombre_sucursal y saldo_descuento
SELECT numero_cuenta, nombre_sucursal, saldo * 0.90 AS saldo_actualizado
FROM cuenta;
-- Ejercicio 2: Mostrar nombres de clientes en mayúsculas
-- Debe mostrar la columna nombre_mayusculas
-- Se usa la función UPPER() para convertir el texto a mayúsculas.
SELECT nombre_cliente, UPPER(nombre_cliente) AS nombre_mayusculas 
FROM cliente; 
-- ===========================================================
-- 2. FUNCIONES DE AGREGACIÓN
-- Se usan para realizar cálculos sobre un conjunto de filas.
-- ===========================================================
-- Ejercicio 1: Suma total de los importes de todos los préstamos
SELECT SUM(importe) AS total_importes FROM prestamo; 
-- Ejercicio 2: Promedio de sueldo de los empleados que trabajan por horas
SELECT AVG(sueldo) AS sueldo_promedio_por_horas FROM trabajo_por_horas; 
-- Ejercicio 3: Monto mínimo de un préstamo
SELECT MIN(importe) AS monto_minimo_prestamo FROM prestamo; 
-- Ejercicio 4: Cantidad de empleados registrados
-- En este caso lo hara sin considerar los que sean NULOS. 
SELECT COUNT(nombre_empleado) AS empleados_registrados FROM empleado; 
-- En dado que sea con nulos seria: 
SELECT COUNT(*) AS empleados_registrados FROM empleado; 
-- Ejercicio 5: Número total de ciudades en las que hay al menos una sucursal
-- (usando COUNT y DISTINCT)
SELECT COUNT(DISTINCT ciudad_sucursal) AS ciudades_sucursales FROM sucursal;
-- ===========================================================
-- 3. AGRUPACIÓN (GROUP BY)
-- Permite agrupar datos en función de un atributo y aplicar funciones de agregación.
-- ===========================================================
-- Ejercicio 1: Importe total de los préstamos por sucursal.
-- Debe mostrar nombre_sucursal y total_prestamo
SELECT nombre_sucursal, SUM(importe) AS total_importes 
FROM prestamo 
GROUP BY nombre_sucursal; 
-- Ejercicio 2: Número de clientes en cada ciudad
SELECT ciudad_cliente, COUNT(*) AS total_clientes_por_cuidad
FROM cliente 
GROUP BY ciudad_cliente; 
-- Ejercicio 3: Mostrar los nombres de los empleados por ciudad
-- Debe mostrar ciudad y empleados
SELECT ciudad,
GROUP_CONCAT(nombre_empleado ORDER BY nombre_empleado SEPARATOR ', ') AS empleados_por_ciudad
FROM empleado
GROUP BY ciudad; 
-- ===========================================================
-- 4. ORDENAMIENTO (ORDER BY)
-- Se usa para organizar los resultados de una consulta.
-- ===========================================================
-- Ejercicio 1: Listar sucursales ordenadas por activos (de mayor a menor)
SELECT nombre_sucursal, activos FROM sucursal ORDER BY activos DESC; 
-- Ejercicio 2: Mostrar empleados ordenados por ciudad en orden ascendente de la A-Z. 
SELECT nombre_empleado, ciudad FROM empleado ORDER BY ciudad ASC; 
-- ===========================================================
-- 5. REUNIONES EXTERNAS (OUTER JOIN)
-- Permiten combinar datos de dos tablas, incluyendo registros sin coincidencias.
-- ===========================================================

-- Ejercicio 1: LEFT JOIN - Mostrar todos los clientes y sus cuentas (incluso si no tienen cuenta)
-- Mostrar nombre_cliente numero_cuenta

-- Ejercicio 2: RIGHT JOIN - Mostrar todas las sucursales y las cuentas asociadas (incluso si no tienen)
-- Debe mostrar nombre_sucursal y numero_cuenta

-- ===========================================================
-- 6. TRATAMIENTO DE VALORES NULL
-- MySQL maneja NULL de manera especial en comparaciones y operaciones.
-- ===========================================================

-- Ejercicio 1: Mostrar empleados que no trabajan por horas
-- Debe mostrar nombre_empleado

-- Ejercicio 2: Contar clientes sin información de crédito

-- Ejercicio 3: Reemplazar valores NULL por 0 en el sueldo de empleado a tiempo completo con COALESCE()
-- Debe mostrar nombre_empleado, ciudad y sueldo_con_ceros

-- Ejercicio 4: Reemplazar valores NULL por "Desconocido" en el nombre_sucursal de empleado a tiempo 
-- completo con COALESCE()
-- Debe mostrar nombre_empleado, ciudad y nombre_sucursal_con_desconocidos
