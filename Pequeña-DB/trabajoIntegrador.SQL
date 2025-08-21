CREATE TABLE "genero" (
	"id_genero"	INTEGER NOT NULL,
	"genero"	VARCHAR(10) NOT NULL,
	PRIMARY KEY("id_genero" AUTOINCREMENT)
);
INSERT INTO genero (genero) VALUES
("Mujer"),
("Hombre"),
("Otro")
------------

CREATE TABLE "empleados" (
	"id_empleados"	INTEGER NOT NULL,
	"nombre"		VARCHAR(15) NOT NULL,
	"apellido"		VARCHAR(15) NOT NULL,
	"edad"			VARCHAR(2) NOT NULL,
	"puesto"		INTEGER NOT NULL,
	PRIMARY KEY("id_empleados" AUTOINCREMENT)
);
------------

CREATE TABLE "cantidadTalles" (
	"id_Ctalles"	INTEGER NOT NULL,
	"talles"	INTEGER NOT NULL,
	PRIMARY KEY("id_Ctalles" AUTOINCREMENT)
);
INSERT INTO cantidadTalles (talles) VALUES 
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44)
------------

CREATE TABLE "talles" (
	"id_talles"	INTEGER NOT NULL,
	"id_Ctalles"	INTEGER NOT NULL,
	PRIMARY KEY("id_talles" AUTOINCREMENT),
	FOREIGN KEY("id_Ctalles") REFERENCES cantidadTalles ("id_Ctalles")
);
INSERT INTO talles (id_Ctalles) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11)
------------

CREATE TABLE "shoes" (
	"id_shoes"	INTEGER NOT NULL,
	"nombre"	VARCHAR(20) NOT NULL,
	"tipo"	 	VARCHAR(20) NOT NULL,
	"marca"  	VARCHAR(15) NOT NULL,
	"talles"	VARCHAR(5) NOT NULL,
	"precios"	VARCHAR(15) NOT NULL,
	"id_talles" INTEGER NOT NULL,
	PRIMARY KEY("id_shoes" AUTOINCREMENT),
	FOREIGN KEY("id_talles") REFERENCES talles ("id_talles")

);
------------

CREATE TABLE "metodoDePago" (
    "id_metodo" INTEGER,
    "metodo"    VARCHAR (20) NOT NULL,
    PRIMARY KEY("id_metodo" AUTOINCREMENT)
);
INSERT INTO metodoDePago (metodo) VALUES
("Mercado Pago"),
("PayPal")
------------

CREATE TABLE "opcionesPago" (
    "id_pago"   INTEGER,
    "id_cliente"INTEGER NOT NULL,
    "id_metodo" INTEGER NOT NULL,
    PRIMARY KEY("id_pago" AUTOINCREMENT),
    FOREIGN KEY("id_metodo") REFERENCES metodoDePago("id_metodo"),
	FOREIGN KEY("id_clientes") REFERENCES clientes("id_clientes");
);

CREATE TABLE "clientes" (
	"id_cliente" INTEGER NOT NULL,
	"nombre"	VARCHAR(15) NOT NULL,
	"apellido"	VARCHAR(15) NOT NULL,
    "id_genero" INTEGER NOT NULL,
	"id_shoes"	INTEGER NOT NULL,
	"gasto"		VARCHAR(10) NOT NULL,
	"direccion"	VARCHAR(40) NOT NULL,
	"email"		VARCHAR(45) NOT NULL UNIQUE,
	"numero"	VARCHAR(10) NOT NULL UNIQUE,
	"habitual"	VARCHAR(2) NOT NULL,
	"id_empleado"	INTEGER NOT NULL,

	PRIMARY KEY("id_cliente" AUTOINCREMENT),
    FOREIGN KEY("id_genero") REFERENCES genero("id_genero"),
	FOREIGN KEY("id_empleado") REFERENCES empleados ("id_empleado"),
	FOREIGN KEY("id_shoes") REFERENCES shoes ("id_shoes"),
   
);
INSERT INTO metodoDePago (metodo) VALUES
("Mercado Pago"),
("PayPal"),
(""),
