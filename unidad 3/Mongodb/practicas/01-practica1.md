# Practica 1: Base de Datos, colecciones e inserts

1. Conectarnos con mongosh a MongoDB
1. Crear una base de datos llamada curso
1. Comprobar que la base de datos no existe
1. Crear una coleccion que se llame facturas y mostrarla

``` json
 db.createCollection('facturas')
 show collections
```

## 5. Insertar un documento con los siguientes datos:

| Codigo   | Valor   |
|-------------|-------------|
| Cod_Factura | 10 |
| Ciente | Frutas Ramirez |
| Total | 223 |

| Codigo   | Valor   |
|-------------|-------------|
| Cod_Factura | 20 |
| Ciente | Ferreteria Juan |
| Total | 140 |
## Insercion de Documento

![](../img/5.png)
```json
db.facturas.insertOne(
{
Cod_Factura:10,
Cliente:'Frutas Ramirez',
total:223
},
{
    Cod_Factura:20,
    Cliente:'Ferreteria Juan',
    Total:140
}

)
```

## 6. Crear una nueva colección pero usando directamente el insertOne.
   insertar un documento en la colección productos con los siguientes datos:

| Codigo   | Valor   |
|-------------|-------------|
| Cod_producto | 1 |
| Nombre | Tornillo x 1" |
| Precio | 2 |

## Insercion de la coleccion

```json
db.Producto.insertOne({
  
   Cod_producto:1,
   Nombre:'Tornilo x 1',
   Precio:2,
   
})
```
![](../img/6.png)


## 7. Crear un nuevo documento de producto que contenga un array. Con los siguientes datos:

| Codigo   | Valor   |
|-------------|-------------|
| Cod_producto | 2 |
| Nombre | Martillo |
| Precio | 20 |
| Unidades | 50 |
| Fabricantes | fab1, fab2, fab3,fab4 |

## Documento con arraw
```json
db.Producto2.insertOne({
  
   Cod_producto:2,
   Nombre:'Martillo',
   Precio:20,
   unidades:50,
   Fabricantes:['fab1','fab2','fab3','fab4']
})
```

![](../img/7.png)

## 8. Borrar la colección Facturas y comprobar que se borro
## borrar coleccion
```json
db.facturas.drop
```
![](../img/8.0.png)


## 9. Insertar un documento en una colección denominada **fabricantes**
   para probar los subdocumentos y la clave _id personalizada

| Codigo   | Valor   |
|-------------|-------------|
| id | 1 |
| Nombre | fab1 |
| Localidad | ciudad: buenos aires, pais: argentina, Calle: Calle pez 27,cod_postal:2900 |

## coleccion fabricantes 
```json
db.fabricantes.insertOne({
  _id: 1,
  Nombre: "fab1",
  Localidad: {
    ciudad: "buenos aires",
    pais: "argentina",
    Calle: "Calle pez 27",
    cod_postal: 2900
  }
})
```

![](../img/9.png)


## 10. Realizar una inserción de varios documentos en a colección
    productos

| Codigo   | Valor   |
|-------------|-------------|
| Cod_producto | 3 |
| Nombre | Alicates |
| Precio | 10 |
| Unidades | 25 |
| Fabricantes | fab1, fab2, fab5 |

| Codigo   | Valor   |
|-------------|-------------|
| Cod_producto | 4 |
| Nombre | Arandela |
| Precio | 1 |
| Unidades | 500 |
| Fabricantes | fab2, fab3, fab4 |

## insercion de varios documentos
```json
db.Productos.insertOne(
 {
   Cod_Producto:3,
   Nombre:'Alicates',
   Precio:10,
   Unidades:25,
   estudios:[
'fab2','fab3','fab4'
   ],
 Cod_Producto:4,
   Nombre:'Arandela',
   Precio:1,
   Unidades:25,
   estudios:[
'fab2','fab3','fab4'
   ]
 }
 
 )
 ```
 ![](../img/10.png)