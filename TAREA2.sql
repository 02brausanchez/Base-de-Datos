CREATE DATABASE musica; 

USE musica; 

CREATE TABLE artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre_artista VARCHAR(100) NOT NULL UNIQUE,
    pais_artista VARCHAR(150) NOT NULL
);


CREATE TABLE albums(
	id_album INT PRIMARY KEY AUTO_INCREMENT, 
    titulo_album VARCHAR(250) NOT NULL, 
    anio_lanzamiento INT, 
    genero_musical VARCHAR(250) NOT NULL, 
    artista_publicacion VARCHAR(250) NOT NULL, 
    id_artista INT, 
    FOREIGN KEY (id_artista) REFERENCES artistas(id_artista) ON DELETE CASCADE
);     

INSERT INTO artistas(nombre_artista, pais_artista) VALUES 
('Michael Jackson','Estados Unidos'),
('Dua Lipa' ,'Reino Unido'),
('Taylor Swift' ,'Estados Unidos'),
('Lady Gaga','Estados Unidos'),
('AC/DC','Australia'),
('Nirvana' , 'Estados Unidos'),
('Pink Floyd','Reino Unido'),
('Elvis Presley' , 'Estados Unidos'),
('Little Richard','Estados Unidos'),
('Chuck Berry' , 'Estados Unidos'),
('Bengala','Mexico'),
('The Weeknd ', 'Estados Unidos'),
('Ryan Librada', 'Estados Unidos'),
('IVOXYGEN ', 'Estados Unidos'),
('REO Speedwagon', 'Estados Unidos');


SELECT * FROM artistas; 

SELECT * FROM albums; 

INSERT INTO albums(titulo_album, anio_lanzamiento, genero_musical, artista_publicacion, id_artista) VALUES 
('Thriller',1982,'Pop', 'Michael Jackson',1),
( 'Future Nostalgia',2020,'Pop', 'Dua Lipa',2),
('1989',2014, 'Pop','Taylor Swift',3),
('Back in Black',1980, 'Rock','AC/DC',4),
('Nevermind',1911, 'Rock','Nirvana',5),
('The Dark Side of the Moon',1973, 'Rock','Pink Floyd',6),
('Elvis Presley',1956, 'Rock & Roll','Elvis Presley',7),
("Here's Little Richard",1957, 'Rock & Roll','Little Richard',8),
('Chuck Berry Is on Top',1959, 'Rock & Roll','Chuck Berry',9),
('Oro',2008, 'Rock alternativo','Bengala(banda)',10),
('Dawn FM',2022, 'Pop/Dance/Electronica','The Weeknd',11),
('RENO',2020, 'Hip-hop/rap & Pop','Ryan librada',12),
('Casino143',2024, 'Dance/Electronica & Hip-hop','IVOXYGEN',13),
('Hi infidelity',1980, 'Rock','Reo Speedwagon',14);


/*1. Mostrar todos los albumes registrados */
SELECT * FROM albums; 

/*2. Mostrar solo los titulos de los albumes y el genero musical */
SELECT titulo_album, genero_musical FROM albums; 

/*3. Mostrar todos los albumes publicados despues del año 2000.*/
SELECT * FROM albums WHERE anio_lanzamiento > 2000; 

/*4. Mostrar todos los albumes publicado entre 1980 y 1995*/
SELECT * FROM albums WHERE anio_lanzamiento >= 1980 && anio_lanzamiento <= 1995; 

/*5. Mostrar los artistas registrados en la base de datos */
SELECT * FROM artistas; /*junto con el pais */

/*Aqui solo se muestran solamente los nombres de los artistas*/
SELECT nombre_artista FROM artistas; 

/*6. Mostrar los artistas que sean de un pais especifico*/
SELECT * FROM artistas WHERE pais_artista = 'Mexico'; /*En este caso solo hay un artista de Mexico*/

/*7. Insertar un nuevo artista en la base de datos y mostrar nuevamente la lista de artistas*/
INSERT INTO artistas(nombre_artista, pais_artista) VALUES 
('Antonio Vega', 'España');
/* Ahora mostramos la base de datos actualizada con el nuevo dato*/
SELECT * FROM artistas; 

/*8. Agregar un nuevo album para el artista recien creado que en nuestro caso es Antonio Vega */
INSERT INTO albums(titulo_album, anio_lanzamiento, genero_musical, artista_publicacion, id_artista) VALUES
('El momento', 1985, 'Pop', 'Antonio Vega', 15); 

/*9. Eliminar un artista de la base de datos y observar que sucede con los albumes relacionados, en este caso se va a eliminar
a Lady Gaga */ 
DELETE FROM artistas WHERE id_artista = 4; 

/* Mostramos la BD de artistas */ 
SELECT * FROM artistas;

/* Mostramos si queda albumes del artista eliminado anteriormente */ 
SELECT * FROM albums; 
SELECT VERSION();


