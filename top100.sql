/*1*/
CREATE DATABASE peliculas;
\c peliculas
/*2*/
CREATE TABLE peliculas(id SERIAL, pelicula VARCHAR(100) NOT NULL, año_estreno INT NOT NULL, director VARCHAR(100) NOT NULL, PRIMARY KEY(id));
CREATE TABLE reparto (pelicula_id INT NOT NULL, actor VARCHAR(100) NOT NULL, FOREIGN KEY(pelicula_id) REFERENCES peliculas(id));
/*3*/
\copy peliculas(id, pelicula, año_estreno, director) FROM './Desktop/top100/peliculas.csv' CSV HEADER;
\copy reparto(pelicula_id, actor) FROM './Desktop/top100/reparto.csv' CSV;
/*4*/
SELECT * FROM peliculas JOIN reparto ON peliculas.id=reparto.pelicula_id WHERE id=2;

