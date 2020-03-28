# Lua

## Instalación y configuración del entorno

### Windows

Hay varias formas de instalación del interprete de Lua, pero la forma más sencilla es descargar los archivos compilados o binario del sitio oficial para la versión de Windows ([Descargar](http://luabinaries.sourceforge.net/download.html)).

Una vez descargado el binario, se decomprime y se debe configurar la variable de entorno para poder usar el interprete desde terminal. 

##  ------

#### Terminal

Para mayor comodida y mejor funcionamiento necesitamos una terminal competente. No es estrictamente necesario pero mejorará nuestra experiencia usando la terminal. Para esto usaremos git bash, se descarga de su sitio oficial ([Descagar](https://git-scm.com/)).

### MacOS

En caso de Mac se utiliza el gestor de paquetes ```brew```. Abrimos la terminal que y se escribe la siguiente instrucción:

```bash
brew install lua
```

### Editor

Se utilizará el editor de código llamado *Visual Studio Code*, se descarga de su sitio oficial [code.visualstudio.com](https://code.visualstudio.com/). Se elige el instalador dependiendo del sistema operativo que se tenga.


## Primeros pasos

### Arrancando

Estos pasos que se indican se obviaran en los ejemplos siguientes:

1. Creamos una carpeta en el directorio que vayamos a trabajar.
2. Abrimos el editor que usaremos.
3. Arrastramos la carpeta que creamos sobre la zona derecha del editor y soltamos.
4. Creamos un archivo con la extensión ```.lua```. Ejemplo: ```programa1.lua```
5. Estamos listos para hacer la primera prueba.

### Creando nuestro primer "Hola Mundo"

Una vez que tenemos nuestro archivo escribimos en él lo siguiente:

``` lua
print("Estoy programando en Lua")
```

Ahora debemos abrir la terminal integrada que tiene el editor, con la combinación de letras, Windows y Linux ```Ctrl+J```, Mac ```CMD+J```. En caso que haya salido en la pestaña ```Terminal```, dar click en ella. Una vez que ya cargo el ```promt``` escribimos:

``` bash
lua nombre_archivo.lua
``` 

En nuestro caso, el archivo se llama ```programa1.lua```; por lo tanto, queda de la siguiente forma:

``` bash
lua programa1.lua
```

Damos enter. Debiendose ejecutar el programa y veremos en el ```promt```. El siguiente mensaje:

``` bash
Estoy programando en Lua
```

Este procedimiento lo realizaremos cada vez que hagamos nuestros programas.

## Conceptos básicos

### ¿Qué es una variable?

Es un espacio virtual el cual quedará registrado en la memoria, el cual se podrá llamar en diferentes puntos de la programacion cuantas veces la necesitemos. A este espacio se le da un nombre que nos indique para qué a sido creada. 

*Ejemplos:*

Variable que almacena la edad:
``` lua
edad = 20
```

Variable que almacena el registro:
``` lua
registro = 2
```

Variable que almacena un nombre:
``` lua
nombre = "Diana"
```

Variable que almacena una frase:
``` lua
nombre = "Aprendiendo programación"
```

Variable que almacena una función:
``` lua
mensaje = function(nombre)
            return "Hola " .. nombre 
          end
```

### Comentarios

Un comentario es un texto que define el programador, para saber y recordar qué hace una función o línea de código. 
Existen dos tipos de comentarios, una línea (*single line*) y multi línea (*multi line*).

- Single line: Para escribir un comentario comienza con doble guion medio. 
Ejemplo:
```lua 
-- comentario de una línea
```

- Multi line: Para escribir un comentario comienza con doble guion medio y doble corchete cuadrado, para cerrar el comentario se hace con doble guíon y corchetes cuadrados. 
Ejemplo:
```lua 
--[[ 
    comentario 
    de 
    multi línea
--]]
```

## Comenzando

Vamos a realizar nuestro primer programa el cual es la suma de dos números, vamos a declarar dos variables, a cada uno asignaremos un valor arbitrario e imprimir el resultado:

```lua
-- comenzamos declarando dos variables asignandole un valor arbitrario, estos pueden ser los que uno quiera

local valor1 = 4 -- asignamos el valor de 4 a una variable llamada valor1
local valor2 = 3 -- asignamos el valor de 3 a una variable llamada valor2

local resultado = valor1 + valor2 -- realizamos la suma de las variables y lo guardamos en otra varialbe llamada resultado

print(resultado) -- se imprimme el resultado de la suma
```

La palabra ```local``` la analizaremos más adelante con el tema de alcance de variables, por el momento ve acostumbrandote a usarla.

## Convencinones en declaración de variables y funciones

Dentro la programación existen diversas convenciones el nombramiento de variables y funciones. En este libro usaremos la convención ```Camel Case```; nombrada de esta forma por la aparencia o forma que toma al momento de nombrarlas.

La forma de nombrarlas es que el nombre de la variable o función comienza **siempre** en minúscula y se el nombre es largo la siguiente palabra sin dejar espacio se escribre con mayúscula

Primero que nada una variable o función jamás podrá comenzar con un número, ni símbolos, **siempre** debe ser por letras.

*Ejemplos:*

```lua
nombre = "Frida"
```

```lua
carroGrande = "Camión"
```

```lua
numeroDeCasas = 23
```

```lua
variable1 = 14
```

```lua
mesajeInicio = function (nombre)
                  print("Bienvenido" .. nombre)
               end
```



