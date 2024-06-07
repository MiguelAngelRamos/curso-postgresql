### Substring

La función `substring` en SQL se utiliza para extraer una subcadena de una cadena más grande.
### Debe tener 
1. Cadena origen
2. Los parametros de posición
3. La longitud para determinar que parte de la cadena se debe extraer.

## Sintaxis

```sql
substring(string FROM start_position [FOR lenght] )
```

## Ejemplos

#### Ejemplo 1: Extraer una subcadena desde una posición especifica

```sql
SELECT substring('Hello, world!' FROM 8)
```

#### Ejemplo 2: Extraer una subcadena desde una posición especifica

```sql
SELECT substring('Hello, world!' FROM 8 FOR 5) -- world
```
```sql
SELECT substring('Hello, world!' FROM 8)
SELECT substring('Hello, world!' FROM 8 FOR 5)

select position('world' in 'Hello, world!');

select position('@' in 'sofia@correo.com');
SELECT substring('sofia@correo.com' FROM position('@' in 'sofia@correo.com') + 1);
```


