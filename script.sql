--Crear Base de datos 'peliculas'
CREATE DATABASE peliculas_db;

--Ingresar a la Base de datos 'posts'
\ c peliculas_db;

--Crear tabla 'peliculas' con los atributoss id, pelicula, anio_estreno, director
CREATE TABLE peliculas(
    id SERIAL NOT NULL PRIMARY KEY,
    pelicula VARCHAR(255) NOT NULL,
    anio_estreno INTEGER NOT NULL,
    director VARCHAR(255) NOT NULL
);

--Crear una nueva tabla llamada 'reparto', con los atributos actor, id_pelicula
CREATE TABLE reparto(
    id_pelicula bigint NOT NULL,
    actor VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id)
);

---Importar archivos peliculas csv reparto csv
\ copy peliculas
FROM
    'C:\Users\SSI\Desktop\peliculas.csv' csv header;

\ copy reparto
FROM
    'C:\Users\SSI\Desktop\reparto.csv' csv;

--- Obtener el ID de la película “Titanic"
SELECT
    id
FROM
    peliculas
WHERE
    pelicula = 'Titanic';

--- Listar a todos los actores que aparecen en la película "Titanic"
SELECT
    *
FROM
    reparto
WHERE
    id_pelicula = '2';

--- Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT
    COUNT(actor)
FROM
    reparto
WHERE
    actor = 'Harrison Ford';

--- Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT
    *
FROM
    peliculas
WHERE
    anio_estreno BETWEEN '1990'
    AND '1999'
ORDER BY
    pelicula ASC;

----- Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
SELECT
    pelicula,
    LENGTH(pelicula) AS longitud_titulo
FROM
    peliculas;

---Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT
   
    MAX(LENGTH(pelicula)) AS logitud_max_pelicula
   
FROM
    peliculas;












--ALTER TABLE reparto RENAME COLUMN pelicula TO actor;