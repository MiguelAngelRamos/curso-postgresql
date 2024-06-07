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

#### Ejemplo: Extraer una subcadena desde una posición especifica

```sql
SELECT substring('Hello, world!' FROM 8)

```