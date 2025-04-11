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

## insercion de un documento mas complejo con ARRAY
```json
db.Empleado.insertOne({
  
   nombre:'Ivan',
   apellido:'Baltazar',
   apellido2:'Rodriguez',
   aficiones:['cervez','canabis','Crico','Mentir']
})
```
**ELIMINAR UNA COLLECION**
```json
db.colleccion.drop()
```
```json
_EJEMPLO:_
db.empleado.drop()
```

## insercion de documentos mas complejos con anidados, arrays y ID

```json
db.alumnos.insertOne(
 {
   nombre: 'Jose Luis',
   Apellido1: 'Herrera',
   Apellido2: 'Gallardo',
   edad:41,
   estudios:[
    'Ingeneriia en Sistema Computacionales',
    'Maestria en Administacion de Tecnologia de la Informacion'
   ],
   Experienxia:{
     lenguaje:'sql',
     sgp:'sqlServer',
    anios_Experiencia: 20

   }
 }
 
 )
```
```json
db.alumnos.insertOne({
    _id:3,
    nombre:'Sergio',
    apellido:'Ramos',
    equipo:'Monterrey',
    aficiones:['Dinero','aficiones','fiesta'],
    talentos:{
        futbol:true,
        bañarse:false
    }
})
```
## insertar multiples documentos
```json
db.alumnos.insertMany(
[
    {
        _id:12,
        nombre:'Osgualdo',
        apellido:'Venado',
        edad:20,
        descripcion:'Es un quejumbroso'
    },
    {
        nombre: 'Maritza',
        apellido:'Rechiken',
        edad:20,
        habilidades:[
            'Ser vivora', 'ilucionar', 'Caguamear'
        ],
        direccion:{
            calle:'del infierno',
            numero:666
        },
        esposos:[
            {
                nombre:'Joshua',
                edad:20,
                pencion:-34,
                hijos:['Ivan','Jose']
            },
            {
                nombr:'Leo',
                edad:15,
                pencion:70,
                complaciente:true
            }
        ]
    }
]
)
```
# busquedas, condiciones simples de igualdad. metodo find()
1. seleccionar todos los documentos de la coleccion libros
```json
db.libros.find({

})
```
2. seleccionar todos los documentos que sean de la editorial biblio
```json
db.libros.find({
    editorial:'Biblio'
})

```
 3. mostrar todos los documentos que el precio sea 25
 ```json
 db.libros.find({
    precio:25
})
 ```
 4. seleccionar todos los docuementos donde el titulo sea json para todos
```json
db.libros.find({
    titulo:'JSON para todos'
})
```
## operadores de comparacion
[operadores de comparacion](
https://www.mongodb.com/docs/manual/reference/operator/query/)

![operadores de comparacion](./img/operadores-Relacionales.png)

1. mostrar todos los docmentos donde el precio sea mayor a 25
```json
db.libros.find({precio:{$gt:25}})
```

2. mostrar los documentos donde el precio sea 25
```json
db.libros.find({precio:{$eq:25}})
```

3. mostrar los documentos cuya cantidad sea menor a 5
```json
db.libros.find({cantidad:{$lt:5}})
```

4. mostrar los documentos que pertenecen al editorial biblio o planeta
```json
db.libros.find(
{
    editorial:{
        $in:['Biblio','Planeta']
    }
}
)
```
5.mostrar todos los documentos de libros que cuesten 20 o 25
```json
db.libros.find(
{
    precio:{
        $in:[20,25]
    }
}
)
```
6. recuperar todos los documentos que no cuesten 20 o 25
```json
db.libros.find(
{
    precio:{
        $nin:[20,25]
    }
}
)
```
## INSTRUCCION FINDONE
7.  recuperar solo una fila(devuelve el primer elemento que cumpla la condicion)
db.libros.findOne(
{
    precio:{
        $in:[20,25]
    }
}
)

## OPERADORES LOGICOS

[operadores logicos](https://www.mongodb.com/docs/manual/reference/operator/query-logical/)
### operador and

- Dos posibles acciones
 1. forma simple, mediante condiciones separadas por (,)
  - db.libros.find({condicion1, condicion2, ...})-> con esto asume que es un AND
1. usando el operador $and
{ $and: [ { <expression1> }, { <expression2> } , ... , { <expressionN> } ] }
  - db.libros.find({$and:[{condicion 1}, {condicion 2}]})


1. Mostrar todos aquellos libros que cuesten mas de 25 y cuya cantidad sea inferior a 15

db.libros.find(
    {
        precio:{$gt:25},
        cantidad:{$lt:15}
    }
)

db.libros.find(
    {
        $and:[
            {precio:{$gt:25}},
            {cantidad:{$lt:15}}
        ]
    }
)


### OPERADOR OR ($or)
- Mostrar todos aquellos libros que cuesten mas de 25 o cuya cantidad sea inferior

```json
db.libros.find(
{
    $or:[
        {precio:{$gt:25}},
        {cantidad:{$lt:15}}
    ]
})
```

### Ejemplo con 'and' y 'or' combinados

-Mostrar todos los libros de la editorial Biblio con precio mayor a 40 libros de la editorial Planeta con precio mayor a 30

db.inventory.find( {
    $and: [
        { $or: [ { qty: { $lt : 10 } }, { qty : { $gt: 50 } } ] },
        { $or: [ { sale: true }, { price : { $lt : 5 } } ] }
    ]
} )

```json
bd.libros.find({
    $and:[{precio:{$gt:40}},[editorial:{$in:{editorial:'Biblio'}}],
    $or:[{editorial:{Paneta}},
    [{precio:{$gt:30}}]]
    
    
    
})

db.libros.find(
{
$and: [
    { $or: [{editorial:'Biblio'},{precio:{$gt:40}} ]},
    { $or: [{editorial:{$eq:'Biblio'}},{precio:{$gt:30}} ]}
]
})


db.libros.find(
{
$and: [
    { $or: [{editorial:'Biblio'},{precio:{$gt:30}} ]},
    { $or: [{editorial:{$eq:'Biblio'}},{precio:{$gt:20}} ]}
]
})

```
### PREYECCION (ver ciertas columnas)

**sintaxis**

db.colleccion.find(filtro, columnas)
1. seleccionar todos los libros, solo mostrando el titulo 

db.libros.find({},{titulo: 1})

db.libros.find({},{titulo: 1, _id:0})

db.getCollection('libros').find(
  { editorial: 'Planeta' },
  { _id: 0, titulo: 1, editorial: 1, precio: 1 }
);

### OPERARDOR EXIST ( este permite si un campo se encuentra o no en un documento)
[operador exists](https://www.mongodb.com/docs/manual/reference/operator/query/exists/)

{ field: { $exists: <boolean> } }

db.libros.find({editorial:{$exists:true}})

db.libros.insertOne(
    {
        _id:10,
        tiutlo: 'Mongo en Negocios Digitales',
        editorial: 'terra',
        precio: 125
    }
)

- Buscar todos los documentos que no tengan cantidad
db.libros.find({
    cantidad:{$exists:false}
})

### OPERADOR TYPE (permite solicitar a mongodb si un campo corresponde a un tipo)

[operador type](https://www.mongodb.com/docs/manual/reference/operator/query/type/)

- Mostrar todos los documentos donde el precio sea de tipo doble o entero o cuaquier otro tipo de dato

db.libros.find(
    {
        precio:{$type:1}
    }
)

db.libros.find(
    {
        precio:{$type:16}
    }
)

db.libros.find(
    {
        precio:{$type:'int'}
    }
)

db.libros.insertMany(
    [
        {
_id:12,
titulo:'IA',
editorial:'terra',
precio:125,
cantidad:20
    },
    {
        _id:13,
        titulo:'Python para todos',
        editorial:2001,
        precio:200,
        cantidad:30
    }
]    
)

- seleccionar todos los documentos de libros donde los valores de la editorial sean string

db.libros.find({editorial:{$type:2}})

db.libros.find({editorial:{$type:'string'}})

db.libros.find({editorial:{$type:16}})

db.libros.find({editorial:{$type:'int'}})

# Modificando documentos

## comandos importantes
 1- UpdateOne -> Modifica un solo documento
 2- UpdateMany -> Modificar multiples documentos
 3- ReplaceOne -> Sustituir el contenido completo de un documento 
 
 - Tiene el siguiente formato
 ```json
 {filtro},
 {operador:}
 ```
 [operadores update](https://www.mongodb.com/docs/manual/reference/operator/update/) 

 **operador $set**

 1- Modificar un documento

 ```json
 db.libros.updateOne({titulo:'Python para todos'},{$set:{titulo:'Java para todos'}})
 ```
- Modificar el documento con id 10, estableciendo el precio en 100 y la cantidad en 50

db.libros.find(
{
    id:10
},
{
    $set:{precio:100, cantidad:50}
}
)

- Modificar todos los libros con el precio sea mayor a 100 y cambiarlo por 150

db.libros.find(
    {
        precio:{$gt:100}
    },
    {
        $set:{precio:150}
    }
)

## Operadores $inc $null

- Incrementar todos los precios de los libros en 5 

db.libros.updateMany(
    {
        editorial:'terra'
    },
    {
        $inc:{precio:5}
    }
)

- Multiplicar todos los libros donde la cantidad sea mayor a 20, en su cantidad por 2
db.libros.updateMany(
    {
        cantidad:{$gt:20}
    },
    {
        $mul:{cantidad:2}
    }
)

--actualizar todos los libros miltiplicando por 2 la cantidad y el precio de todos aquellos libros que sea mayor a  20 

db.libros.updateMany(
    { precio: { $gt: 20 } },       
    {
        $mul: {                   
            cantidad: 2,           
            precio: 2    
        }          
    }
)

## Remplazar documentos (replaceOne)

- Actualizar todo el documento del id 2 por el titulo de la tierra a la luna autor julio verne, editorial terra, precio 100


db.libros.replaceOne(
    {_id:2},
    {
        titulo:'de la tierra a la luna',
        autor:'julio verne',
        editorial:'terra',
        precio:100
    }
)

## Borrar documentos 
1- deleteOne -> Elimina un solo documento
2- deleteMany  -> Elimina multiples documentos

- Eliminar el documento con el id:2 

```json
db.libros.deleteOne(
{
    _id:2
})
```

- Eliminar todos los libros donde la cantidad es mayor a 150 
db.libros.deleteMany(
    {
        libros:{$gt:150}
    }
)

## Expreciones regulares 
- seleccionar todos los libros que contengan en el titulo un t minuscula
db.libros.find({titulo:/t/})

- seleccionar todos los libros que en el titulo contenga la palabra json
db.libros.find({titulo:/JSON/})

- seleccionar todos los libros que en el titulo terminen con tos
db.libros.find({titulo:/tos/})

seleccionar todos los libros que del titulo comiencen con j
db.libros.find({titulo:/j/})

## operador $regex
[operador $regex](https://www.mongodb.com/docs/manual/reference/operator/query/regex/)
- Seleccionar los libros que contengan la palabra 'para' en el titulo 
db.libros.find(
    {
        titulo:{
            $regex:'para'
        }
    }
)

db.libros.find(
    {
        titulo:{
            $regex:/para/
        }
    }
)

seleccionar todos los libros que contengan la palabra JSON

db.libros.find(
    {
        titulo:{
            $regex:'JSON'
        }
    }
)

db.libros.find(
    {
        titulo:{
            $regex:/JSON/
        }
    }
)

- DISTINGIR ENTRE MAYUSCULAS Y MINUSCULAS

db.libros.find(
    {
        titulo:{
            $regex:/json/i
        }
    }
)

{ <field>: { $regex: /pattern/, $options: '<options>' } }
db.libros.find(
    {
        titulo:{
            $regex:/json/,$options:'i'
        }
    }
)

-Seleccionar todos los documentos de libros donde el titulo comience con j y no distinga entre mayusculas y minusculas

db.libros.find(
    {
        titulo:{
            $regex:/^j/,$options:'i'
        }
    }
).size()

-Seleccionar todos los documentos de libros donde el titulo termine con 'es' y no distinga entre mayusculas y minusculas
db.libros.find(
    {
        titulo:{
            $regex:/es$/,$options:'i'
        }
    }
)

## Metodo sort (ordenar documentos)
-- Ordenar los libros de manera ascendente por el precio
db.libros.find(
    {

    }, {
        _id:0,
        titulo:1,
        precio:1
    }
).sort({precio:1})
-- Ordenar los libros de manera descendente por el precio
db.libros.find(
    {

    }, {
        _id:0,
        titulo:1,
        precio:1
    }
).sort({precio:-1})

-ordenar los libros de manera ascendente por la editorial y de manera descendente por el precio mostrando el titulo, el precio y la editorial
db.libros.find(
    {

    }, {
        
        titulo:1,
        precio:1,
        editorial:1
    }
).sort({precio:1},{precio:-1})

db.libros.find(
    {},{
        _id:0,
        precio:1,
        editorial:1
    }
).sort(

    {
        editorial:1,
        precio:-1
    }
)
## otros metodos skip, limit, size
- metodo size
db.libros.find({}).size()
db.libros.find(
    {
        titulo:{
            $regex:/^j/,$options:'i'
        }
    }
).size()

-limit
-- buscar todos los libros pero mostrando los dos primeros
db.libros.find({}).limit(2)

-skip 
db.libros.find({}).skip(2)
# Borrar collecciones y base de datos

db.libros.drop

db.dropDatabase()