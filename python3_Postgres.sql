--Identificado como usuario Postgres

createdb Python3

--Ejecutamos el interprete de comandos:

psql

--Nos conectamos a la base de datos:

\c Python3

--Creamos las tablas e insertamos datos:


CREATE TABLE Pais
(
NumCorrelativo_Pais INT,
Nombre_Pais VARCHAR(60),
NumClubs INT,
NumParticipantes INT DEFAULT 10,
CONSTRAINT PK_Pais PRIMARY KEY(NumCorrelativo_Pais),
CONSTRAINT Nombre_Pais CHECK (Nombre_Pais ~* '^[A-Z][a-z]'),  --    SIMILAR TO y  ~ son equivalentes
CONSTRAINT NumClubs CHECK (NumClubs BETWEEN 0 AND 50),
CONSTRAINT NumParticipantes CHECK (NumParticipantes > 0 AND NumParticipantes <= 50)
);

CREATE TABLE Participantes
(
NumAsociado INT PRIMARY KEY,
NumCorrelativo_Pais INT,
Nombre VARCHAR(60) UNIQUE,
Telefono VARCHAR(15),
Direccion VARCHAR(60) NOT NULL,
FOREIGN KEY (NumCorrelativo_Pais) REFERENCES Pais(NumCorrelativo_Pais),
CONSTRAINT Telefono CHECK (Telefono LIKE '+[0-9]{4}[6-9][0-9]{8}')
);


CREATE TABLE Alojamiento
(
Fecha_Alojamiento DATE,
NumAsociado INT,
Codigo_Hotel INT,
CONSTRAINT PK_Alojamiento PRIMARY KEY(Fecha_Alojamiento,NumAsociado,Codigo_Hotel),
CONSTRAINT NumAsociado_check CHECK (NumAsociado > 0),
CONSTRAINT Codigo_Hotel_check_alojamiento CHECK (Codigo_Hotel > 0)
);

ALTER TABLE Participantes DROP CONSTRAINT Telefono;

INSERT INTO Pais (NumCorrelativo_Pais,Nombre_Pais,NumClubs,NumParticipantes) VALUES (1, 'Marruecos', 9, 11);
INSERT INTO Pais (NumCorrelativo_Pais,Nombre_Pais,NumClubs,NumParticipantes) VALUES (2, 'España', 15, 30);
INSERT INTO Pais (NumCorrelativo_Pais,Nombre_Pais,NumClubs,NumParticipantes) VALUES (3, 'Peru', 4, 9);
INSERT INTO Pais (NumCorrelativo_Pais,Nombre_Pais,NumClubs,NumParticipantes) VALUES (4, 'Portugal', 14, 33);
INSERT INTO Pais (NumCorrelativo_Pais,Nombre_Pais,NumClubs,NumParticipantes) VALUES (5, 'Francia', 11, 35);
INSERT INTO Pais (NumCorrelativo_Pais,Nombre_Pais,NumClubs,NumParticipantes) VALUES (6, 'Mexico', 11, 35);
INSERT INTO Pais (NumCorrelativo_Pais,Nombre_Pais,NumClubs,NumParticipantes) VALUES (7, 'Guatemala', 2, 6);

INSERT INTO Participantes (NumAsociado,NumCorrelativo_Pais,Nombre,Telefono,Direccion) VALUES (1, 1, 'Moha Aoui', '+1234656789876','C/Mezquita 3 2A 23432 Casa Blanca' );
INSERT INTO Participantes (NumAsociado,NumCorrelativo_Pais,Nombre,Telefono,Direccion) VALUES (2, 2, 'Pepe Perez', '+34678654543','C/Fresa 5 2A 42934 Madrid' );
INSERT INTO Participantes (NumAsociado,NumCorrelativo_Pais,Nombre,Telefono,Direccion) VALUES (3, 2, 'Maria Mora', '+34654365477','C/Puerro 1 4 64626 Caceres' );
INSERT INTO Participantes (NumAsociado,NumCorrelativo_Pais,Nombre,Telefono,Direccion) VALUES (4, 2, 'Angel Torres', '+34689364859','C/Atayalpo 26 41089 Sevilla' );

INSERT INTO Alojamiento (Fecha_Alojamiento,NumAsociado,Codigo_Hotel) VALUES ('2022-03-2', 3, 1);

commit;