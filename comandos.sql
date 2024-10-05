--Se crea la base de datos--
CREATE DATABASE peliculas;
--Se ingresa a la base de datos--
\c peliculas;
--se crea tabla peliculas y reparto--
CREATE TABLE peliculas(id INT PRIMARY KEY, pelicula VARCHAR(50), año_estreno INT, director VARCHAR(50));
CREATE TABLE reparto(id_pelicula INT, actor VARCHAR(50), FOREIGN KEY (id_pelicula) REFERENCES peliculas(id));
--se cargan los archivos csv--
\copy peliculas (id, Pelicula,año_estreno,director) FROM 'C:\Users\nicole.pinilla\Desktop\curso-py\Modulo-5\desafio3_m5\peliculas.csv' DELIMITER ',' CSV HEADER;
\copy reparto (id_pelicula, actor) FROM 'C:\Users\nicole.pinilla\Desktop\curso-py\Modulo-5\desafio3_m5\reparto.csv' DELIMITER ',' CSV HEADER;
--Obtener el ID de la película “Titanic”--
SELECT id FROM peliculas WHERE pelicula = 'Titanic';
--Resultado--
 id 
----
  2 
(1 fila)
--Listar a todos los actores que aparecen en la película "Titanic".--
SELECT reparto.actor FROM reparto JOIN peliculas ON reparto.id_pelicula = peliculas.id WHERE peliculas.pelicula = 'Titanic';
--Resultado--

       actor
-------------------
 Leonardo DiCaprio
 Kate Winslet
 Billy Zane
 Kathy Bates
 Frances Fisher
 Bernard Hill
 Jonathan Hyde
 Danny Nucci
 David Warner 
 Bill Paxton 
 Gloria Stuart
 Victo Garber
 Suzy Amis
(13 filas)
--Consultar en cuántas películas del top 100 participa Harrison Ford--
SELECT COUNT(*) FROM reparto JOIN peliculas ON reparto.id_peliculas = peliculas.id WHERE reparto.actor = 'Harrison Ford';
--Resultado--
 count
-------
    8
(1 fila)
--Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.--
SELECT pelicula FROM peliculas WHERE año_estreno BETWEEN 1990 AND 1999 ORDER BY año_estreno ASC;
--Resultado--
                  pelicula
-------------------------------------------------
 Uno de los nuestros
 Eduardo Manostijeras
 El Padrino. Parte III
 Terminator 2: el juicio final
 El silencio de los corderos
 La lista de Schindler
 Parque Jurasico
 Pesadilla antes de navidad
 Forest Gump
 Cadena perpetua
 Pulp Fiction 
 Entrevista con el vampiro
 El profesional
 Seven
 Toy Story
 Braveheart
 Trainspotting
 Titanic
 Hombres de negro
 Mejor... imposible
 American History X
 Salvar al soldado Ryan
 El show de Truman 
 Toy Story 2
 La milla verde
 American Beauty
 Matrix
 Star Wars. Episodio I: La amenaza fantasma
 El sexto sentido
 El club de la pelea
(30 filas)
--Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.--
SELECT pelicula, CHAR_LENGTH(pelicula) AS longitud_titulo FROM peliculas;

--Consultar cual es la longitud más grande entre todos los títulos de las películas.--

SELECT MAX(CHAR_LENGTH(pelicula)) FROM peliculas;