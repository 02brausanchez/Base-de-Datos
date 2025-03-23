-- ===================================================
-- TAREA 5: TIPOS DE DATOS, RESTRICCIONES Y ALTER EN MYSQL
-- Base de datos utilizada: Lab5
-- Integrantes: Sánchez Morales Braulio Eduardo && Silva Martinez Jesús Alfredo
-- ===================================================
-- SCRIPT SQL: TAREA 5 - ALTER TABLE Y MODIFICACIÓN DE TABLAS
-- Objetivo: Practicar la modificación de estructuras de bases de datos en MySQL.
-- Instrucciones: Esta tarea se debe resolver después de haber ejecutado todas las consultas del script Lab5.sql
--    Para usar la base en ese estado en el que queda al final. Completa las consultas en los espacios indicados.
-- ===========================================================
USE TiposDatos;
-- ===========================================================
-- 1. AGREGAR UNA NUEVA COLUMNA A UNA TABLA
-- - Agrega una columna fecha_creacion de tipo DATETIME a la tabla tipos_numericos.
-- - La columna debe tener un valor por defecto de la fecha y hora actual (CURRENT_TIMESTAMP).
-- ===========================================================
ALTER TABLE tipos_numericos 
ADD COLUMN fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
-- ===========================================================
-- 2. AGREGAR UNA COLUMNA CON VALORES ÚNICOS
-- - Agrega una columna codigo_identificacion de tipo VARCHAR(15) a la tabla tipos_cadena.
-- - La columna debe ser UNIQUE para evitar valores duplicados.
-- ===========================================================
ALTER TABLE tipos_cadena
ADD COLUMN codigo_identificacion VARCHAR(15) NOT NULL UNIQUE; 
-- ===========================================================
-- 3. MODIFICAR EL TIPO DE UNA COLUMNA EXISTENTE
-- - Cambia la longitud de la columna fecha_nacimiento en la tabla tipos_fecha_hora a DATETIME.
-- ===========================================================
ALTER TABLE tipos_fecha_hora 
MODIFY COLUMN fecha_nacimiento DATETIME NOT NULL; 
-- ===========================================================
-- 4. ELIMINAR UNA COLUMNA DE UNA TABLA
-- - Elimina la columna activo de la tabla tipos_booleanos.
-- ===========================================================
ALTER TABLE tipos_booleanos 
DROP COLUMN activo; 
-- ===========================================================
-- 5. RESTAURAR LA CLAVE FORÁNEA DE UNA TABLA
-- - En la tabla clave_foranea, agrega la columna usuario_id como INT
-- - Luego modificala para que usuario_id haga referencia a id en la tabla restricciones.
-- - DEBE HACERSE EN DOS PASOS AGREGAR LA COLUMNA y LUEGO MODIFICARLA PARA QUE SEA CLAVE FORANEA
-- ===========================================================
-- Paso 1 agregar la columna usuario_id 
ALTER TABLE clave_foranea 
ADD COLUMN usuario_id INT NOT NULL; 

-- Paso 2 la restricion de clave foranea 
ALTER TABLE clave_foranea
ADD CONSTRAINT fk_usuario FOREIGN KEY (usuario_id) REFERENCES restricciones(id); 
-- ===========================================================
-- 6. HACER UNA COLUMNA OPCIONAL (NULL) EN LUGAR DE OBLIGATORIA (NOT NULL)
-- - Permitir valores NULL en la columna valor_decimal de numeros_datos.
-- ===========================================================
-- Es independiente a la ya antes creada en la tabla tipos_numericos
    ALTER TABLE numeros_datos 
    ADD COLUMN valor_decimal DECIMAL(10,2) NULL; 
-- ===========================================================
-- 7. RENOMBRAR UNA COLUMNA EN UNA TABLA
-- - Cambia el nombre de la columna archivo en la tabla tipos_binario a archivo_binario.
-- ===========================================================
   ALTER TABLE tipos_binarios 
   RENAME COLUMN archivo TO archivo_binario; 
-- ===========================================================
-- 8. RENOMBRAR UNA TABLA COMPLETA
-- - Renombra la tabla tipos_fecha_hora como tipos_fecha_y_hora.
-- ===========================================================
ALTER TABLE tipos_fecha_hora 
RENAME TO tipos_fecha_y_hora; 
-- ===========================================================
-- 9. AGREGAR UNA RESTRICCIÓN CHECK A UNA COLUMNA
-- - Restringir numero_int de la tabla numeros_datos para que solo acepte valores positivos
-- ===========================================================
ALTER TABLE numeros_datos 
ADD CONSTRAINT chk_numero_int CHECK(numero_int >= 0);  
-- ===========================================================
-- 10. AGREGAR UN CHECK EN A UNA COLUMNA 
-- - Añade una restricción CHECK para que numero_integer de la tabla numeros_datos solo acepte valores múltiplos de 5.
-- ===========================================================
ALTER TABLE numeros_datos
ADD CONSTRAINT chk_numero_integer CHECK(numero_integer % 5 = 0) ; 

