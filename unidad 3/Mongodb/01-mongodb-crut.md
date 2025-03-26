# Mongo db crud

## crear una base de datos
**solo se crea si contiene por lo menos una coleccion**

```json

use bases de datos

```
`use db1
db.createCollecction('empleado')`

## mostrar collecciones
'show collecciones'

## insercion de un documento

db.Empleado.insertOne(
{
nombre:'Soyla',
apellido:'Vaca',
edad: 32,
ciudad:'san miguel de las piedras'
}

)



