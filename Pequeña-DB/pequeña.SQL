CREATE TABLE "genero" (
	"id_genero"	INTEGER NOT NULL,
	"genero"	VARCHAR(10) NOT NULL,
	PRIMARY KEY("id_genero" AUTOINCREMENT)
);

-- EJEMPLO
CREATE TABLE "clientes" (
	"id_cliente" INTEGER NOT NULL,
	"nombre"	VARCHAR(15) NOT NULL,
	"apellido"	VARCHAR(15) NOT NULL,
    "id_genero" INTEGER NOT NULL,
	"id_shoes"	INTEGER NOT NULL,
	"gasto"		VARCHAR(10) NOT NULL,
	"id_metodo"	INTEGER NOT NULL,
	"direccion"	VARCHAR(40) NOT NULL,
	"email"		VARCHAR(45) NOT NULL UNIQUE,
	"numero"	VARCHAR(10) NOT NULL UNIQUE,
	"habitual"	VARCHAR(2) NOT NULL,
	"id_empleado"	INTEGER NOT NULL,

	PRIMARY KEY("id_cliente" AUTOINCREMENT),
    FOREIGN KEY("id_genero") REFERENCES genero("id_genero"), -- para establecer la union entre tablas
	FOREIGN KEY("id_empleado") REFERENCES empleados ("id_empleado"),
	FOREIGN KEY("id_shoes") REFERENCES shoes ("id_shoes"),
	FOREIGN KEY("id_metodo") REFERENCES opcionesPagos ("id_metodo")
    --(primero ponemos la columna en la que estamos parados y despues la columna de la otra tabla)
);

CREATE TABLE "empleados" (
	"id_empleados"	INTEGER NOT NULL,
	"nombre"		VARCHAR(15) NOT NULL,
	"apellido"		VARCHAR(15) NOT NULL,
	"edad"			VARCHAR(2) NOT NULL,
	"puesto"		INTEGER NOT NULL,
	PRIMARY KEY("id_empleados" AUTOINCREMENT)
);

CREATE TABLE "shoes" (
	"id_shoes"	INTEGER NOT NULL,
	"tipo"	 	VARCHAR(20) NOT NULL,
	"marca"  	VARCHAR(15) NOT NULL,
	"talles"	VARCHAR(5) NOT NULL,
	"precios"	VARCHAR(15) NOT NULL,
	"id_ubicacion"	INTEGER NOT NULL,
	PRIMARY KEY("id_shoes" AUTOINCREMENT),
	FOREIGN KEY("id_ubicacion") REFERENCES ubicacionLocal ("id_ubicacion")
);
---
CREATE TABLE "ubicacionLocal" (
    "id_ubicacion"  INTEGER,
    "ubicacion" VARCHAR (40) NOT NULL,
    PRIMARY KEY("id_ubicacion" AUTOINCREMENT)
);

CREATE TABLE "metodoDePago" (
    "id_metodo" INTEGER,
    "metodo"    VARCHAR (20) NOT NULL,
    PRIMARY KEY("id_metodo" AUTOINCREMENT)
);
CREATE TABLE "opcionesPago" (
    "id_pago"   INTEGER,
    "id_cliente"INTEGER NOT NULL,
    "id_metodo" INTEGER NOT NULL,
    PRIMARY KEY("id_pago" AUTOINCREMENT),
    FOREIGN KEY("id_cliente") REFERENCES clientes("id_cliente"),
    FOREIGN KEY("id_metodo") REFERENCES metodo("id_metodo")
);
-- DATO:
-- varchar --> Es para definir la longitud de los textos que contendra la columna