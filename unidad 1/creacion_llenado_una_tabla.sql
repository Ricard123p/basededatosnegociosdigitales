-- CREACION DE LA BASE DE DATOS TIENDA 1

-- CREA LA BASE DE DATOS TIENDA 1
create database tienda1;

--UTILIZAR UNA BASE DE DATOS 
use tienda1;
--SQL-LDD
-- CREAR LA TABLA CATEGORIA
create table categoria(
categoriaid int not null,
nombre varchar(20)  not null, 
constraint pk_categoria
primary key (categoriaid),
constraint unico_nombre
unique(nombre)
);

-- SQL-LMD
--AGREGAR REGISTROS A LA TABLA CATEGORIA
insert into categoria 
values(1,'carnes frias');

insert into categoria(categoriaid,nombre)
values(2, 'linea blanca');

insert into categoria(nombre,categoriaid)
values('vinos y licores',3);


insert into categoria
values (4,'ropa'),
       (5,'dulces'),
	   (6,'lacteos');

	   insert into categoria(nombre,categoriaid)
	   values('panaderia',7),
	         ('zapateria',8),
			 ('jugueteria',9);

			 insert into categoria
			 values(10,'panaderia')

	   select * from categoria
	   order by categoriaid asc;
	   -- tabla productos
create table productos1 (
productoid int not null,
nombreProducto varchar(20) not null,
descripcion varchar(80) null,
precio money not null,
existencia int not null,
categoriaid int null,
constraint pk_producto1
primary key(productoid),
constraint unico_descripcion
unique (nombreProducto),
constraint chk_preccio
check (precio>0.0 and precio <=1000),
constraint chk_existencia
check (existencia>0 and existencia<=200),
constraint fk_categoria_producto1
foreign key (categoriaid)
references categoria(categoriaid)

)

select * from categoria 
insert into productos1
values (2,'tupsi pop','dulce sano para la lombris',34.5,45,5);

insert into productos1
values (3,'plancha','plancha facil',256.3,134,2);

select * from productos1
where categoriaid=5

select * from categoria 