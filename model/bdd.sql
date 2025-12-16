SHOW DATABASES; 
CREATE DATABASE nom_base_de_données;
USE nom_base_de_données
SHOW TABLES;
CREATE USER 'e2clib_admin'@'localhost'  IDENTIFIED BY 'oIqe6kEjoiDVvum9';
GRANT ALL PRIVILEGES ON e2clib.* TO 'e2clib_admin'@'localhost';
/*connexion
mysql -h localhost -u e2clib_admin -p 
*/
CREATE TABLE IF NOT EXISTS  users (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    pseudo VARCHAR(15) NOT NULL UNIQUE,
    biography TINYTEXT,
    age TINYINT UNSIGNED NOT NULL,
    is_admin BOOLEAN NOT NULL DEFAULT 0
)ENGINE=InnoDB;

DESCRIBE users;

INSERT INTO users (password, email, pseudo, age, is_admin)
    VALUES ("azerty12345", 'th.mlv17@gmail.com', "Yuzs1", 21, 1 ); 

SELECT * FROM users;

INSERT INTO users (password, email, pseudo, age)
    VALUES ("supermotdepasse", "xcxdz2s@gmail.com", "Ixcey", 16),
           ("mdptrescool", "legobagel@gmail.com", "Pokaguare", 19),
           ("qwerty123", "surement@gmail.com", "Surement", 21),
           ("fandevita5", "antoinedol@gmail.com", "Penka", 20);

UPDATE users 
 SET age=19 WHERE pseudo=Pokaguare;

CREATE TABLE IF NOT EXISTS genres (
    id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS formats (
    id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS languages (
    id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

INSERT INTO languages (name)
    VALUES ('Français'),('Anglais'),('Allemand'),('Arabe');

INSERT INTO formats (name)
    VALUES ('Poche'),('Roman'),('Manga'),('BD'),('Magazine');

INSERT INTO genres (name)
    VALUES ('Non classé'),('Policier'),('Drame'),('Action'),('Science-fiction'),('Thriller'),('Fantaisie'),('Bande dessinée'),('Educatif'),('Manga'),('Politique');

CREATE TABLE IF NOT EXISTS books (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL, 
    auteur VARCHAR(255) NOT NULL DEFAULT 'Inconnu',
    synopsis TINYTEXT NOT NULL,
    year SMALLINT,
    editor VARCHAR(255),
    cover VARCHAR(255),
    pages SMALLINT,
    genres_id TINYINT UNSIGNED NOT NULL DEFAULT 1, 
    languages_id TINYINT UNSIGNED NOT NULL DEFAULT 1,
    formats_id TINYINT UNSIGNED,
    CONSTRAINT fk_genres
        FOREIGN KEY (genres_id)
        REFERENCES genres(id),
    CONSTRAINT fk_languages 
        FOREIGN KEY (languages_id)
        REFERENCES languages(id),
    CONSTRAINT fk_formats 
        FOREIGN KEY (formats_id)
        REFERENCES formats(id)
)ENGINE=InnoDB;

SELECT books.title AS Titre, books.auteur AS Auteur, books.pages AS 'Nombre de pages', genres.name AS Genre, formats.name AS Format, languages.name AS Langue FROM books
INNER JOIN genres ON books.genres_id = genres.id
INNER JOIN formats ON books.formats_id = formats.id
INNER JOIN languages ON books.languages_id = languages.id;

/* faire une vue */
CREATE VIEW books_vw AS (SELECT books.title AS Titre, books.auteur AS Auteur, books.pages AS 'Nombre de pages', genres.name AS Genre, formats.name AS Format, languages.name AS Langue FROM books
INNER JOIN genres ON books.genres_id = genres.id
INNER JOIN formats ON books.formats_id = formats.id
INNER JOIN languages ON books.languages_id = languages.id);
