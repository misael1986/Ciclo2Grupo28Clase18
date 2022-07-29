CREATE SCHEMA libreria ;-- DDL creacion de BD (Esquema en MySQL)
USE libreria; 

CREATE TABLE ejemplo (
id INTEGER(4) NULL,
nombre VARCHAR(50) null
);

SELECT * FROM ejemplo;

CREATE TABLE libro (
libId integer NOT NULL PRIMARY KEY ,
libNombre char (50) NOT NULL ,
libPub smallint NULL
) ;

create table cliente(
id_cliente int primary key AUTO_INCREMENT,
nombre varchar(50) not null,
documento varchar(12) not null,
tipo_doc ENUM ('CC','CE','VISA','PASAPORTE','OTRO')
);

CREATE TABLE venta (
vta_id_factura INT NOT NULL ,
vta_id_cliente INT NOT NULL ,
vta_cantidad INT ,
PRIMARY KEY ( vta_id_factura ) ,
FOREIGN KEY ( vta_id_cliente ) REFERENCES cliente ( id_cliente )
) ;

/**
ejemplo extraido de la documentacion del proyecto MISION TIC
2022
**/
SHOW COLLATION;

DROP DATABASE IF EXISTS libreria;
CREATE SCHEMA libreria ;
USE libreria ;
CREATE TABLE libro (
libId integer NOT NULL PRIMARY KEY ,
libNombre char (50) NOT NULL ,
libPub smallint NULL
) ;

CREATE TABLE autor (
autId integer AUTO_INCREMENT PRIMARY KEY ,
autApellido varchar (30) NOT NULL DEFAULT "" ,
autNombre varchar (50) NOT NULL ,
autEmail char (30) NULL ,
autPais ENUM ( 'Argentina' , 'Alemania' , 'Colombia' , 'Italia' , 'México ' , 'España' , 'EUA' )
DEFAULT "Colombia "
) COLLATE latin1_spanish_ci;

CREATE TABLE venta (
vtaId integer AUTO_INCREMENT PRIMARY KEY ,
vtaFecha date NOT NULL ,
libId integer NOT NULL ,
vtaCantidad smallint NOT NULL ,
FOREIGN KEY ( libId ) REFERENCES libro ( libId ) 
) ;

SHOW TABLES ;
DESCRIBE libro ;
SHOW COLUMNS FROM libro;

DROP TABLE autor;

INSERT INTO libro ( libId , libNombre , libPub ) 
values (1,'50 Sombras de Gray',2010);
INSERT INTO libro ( libId , libNombre , libPub ) 
VALUES (2, "El olvido que seremos" , 2005);
INSERT INTO libro ( libId , libNombre , libPub ) 
VALUES (201," El renacuajo paseador" , 1867);
INSERT INTO libro ( libId , libNombre , libPub ) 
VALUES (1001, "Cien años de soledad " , 1967);
INSERT INTO libro ( libId , libNombre , libPub ) 
VALUES (1002, "La Vorágine" , 1924);
INSERT INTO libro ( libId , libNombre , libPub ) 
VALUES (1003, "María" , 1867);

SELECT * FROM libro ;
SELECT * FROM autor ;

INSERT INTO autor ( autApellido , autNombre ) 
VALUES ( "García Márquez " , "Gabriel" ) ;
INSERT INTO autor ( autApellido , autNombre ) 
VALUES ( "Isaacs" , "Jorge" ) ;
-- Insertar un a utor con a utPais
INSERT INTO autor ( autApellido , autNombre , autPais ) 
VALUES ( "Alighieri" , "Dante" , "Italia" ) ;
-- Insertar un a utor con correo
INSERT INTO autor ( autApellido , autNombre , autEmail ) 
VALUES ( "Trueba" , "Fernando" , "ftrueba@gmail.com" ) ;
INSERT INTO autor ( autApellido , autNombre ) 
VALUES ( "Rivera" , "Jose Eustasio" ) ;

UPDATE libro SET libPub=2000 WHERE libId = 1003;
UPDATE libro SET libNombre = "La Casa Grande" , 
libPub=1962 WHERE libId = 1003;

DELETE FROM libro where libPub < 1990;
DELETE FROM libro ;
truncate table libro;


-- Adiciona un a tributo de p recio a l ibro con v alor por d efecto en 0
ALTER TABLE libro ADD libPrecio double ( 7,1) DEFAULT 0 ;
-- Borra una columna
ALTER TABLE autor DROP fechaNto ;
-- Renombra un a tributo
ALTER TABLE autor RENAME COLUMN autEmail TO autCorreo ;