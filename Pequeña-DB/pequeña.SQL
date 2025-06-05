CREATE TABLE "genero" (
	"id_genero"	INTEGER NOT NULL,
	"genero"	INTEGER NOT NULL,
	PRIMARY KEY("id_genero" AUTOINCREMENT)
);





-- EJEMPLO
CREATE TABLE "clientes" (
	"id_cliente" INTEGER NOT NULL,
	"nombre"	INTEGER NOT NULL,
    "id_genero" INTEGER NOT NULL,
	PRIMARY KEY("id_cliente" AUTOINCREMENT),
    FOREIGN KEY("id_genero") REFERENCES genero("id_genero"), -- para establecer la union entre tablas
    --(primero ponemos la columna en la que estamos paradosn y despues la columna de la otra tabla)

);