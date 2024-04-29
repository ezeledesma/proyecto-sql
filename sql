DROP SCHEMA IF EXISTS ETL_PRESTAMOS;
CREATE SCHEMA IF NOT EXISTS ETL_PRESTAMOS;
USE ETL_PRESTAMOS;

DROP TABLE IF EXISTS USUARIOS;
CREATE TABLE IF NOT EXISTS USUARIOS	(
						ID_USUARIO int not null auto_increment,
                        NOMBRE varchar(100) not null,
                        APELLIDO varchar(100),
                        NRO_DOC varchar(11) not null,
                        EMAIL varchar(30),
                        TELEFONO varchar(20),
                        DESCRIPCION varchar(100),
                        FECHA_ALTA datetime,
                        PRIMARY KEY (ID_USUARIO)
						);

DROP TABLE IF EXISTS MONEDAS;
CREATE TABLE IF NOT EXISTS MONEDAS	(
						ID_MONEDA int not null auto_increment primary key,
                        LETRA varchar(10) not null,
                        NOMBRE varchar(100) not null,
                        COT_ORIG float,
                        FECHA_ALTA datetime
						);

DROP TABLE IF EXISTS PRESTAMOS;
CREATE TABLE IF NOT EXISTS PRESTAMOS	(
						ID_PRESTAMO int not null auto_increment primary key,
                        ID_USUARIO int not null,
                        CONCEPTO varchar(100) not null,
                        CAPITAL float not null,
                        ID_MONEDA int not null,
                        DESCRIPCION varchar(100),
                        FECHA_ORIG datetime not null,
                        FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID_USUARIO),
						FOREIGN KEY (ID_MONEDA) REFERENCES MONEDAS(ID_MONEDA)
						);

DROP TABLE IF EXISTS CUOTAS;
CREATE TABLE IF NOT EXISTS CUOTAS		(
						ID_CUOTA int not null auto_increment primary key,
                        ID_PRESTAMO int not null,
                        CUOTA int not null,
                        CAPITAL float not null,
                        INTERES float not null,
                        DESCRIPCION varchar(100),
                        FECHA_VTO datetime not null,
                        FOREIGN KEY (ID_PRESTAMO) REFERENCES PRESTAMOS(ID_PRESTAMO)
						);

DROP TABLE IF EXISTS MONEDAS_HIST;
CREATE TABLE IF NOT EXISTS MONEDAS_HIST	(
							ID_MONEDA_HIST int not null auto_increment primary key,
                            ID_MONEDA int not null,
                            COTIZACION float not null,
                            FECHA_COT datetime not null,
                            FECHA_ALTA datetime,
                            FOREIGN KEY (ID_MONEDA) REFERENCES MONEDAS(ID_MONEDA)
							);
                            
