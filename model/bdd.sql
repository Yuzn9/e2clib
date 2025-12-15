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