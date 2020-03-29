# Lua

## Instalación y configuración del entorno

### Windows

Hay varias formas de instalación del intérprete de Lua, pero la forma más sencilla es descargar los archivos compilados o binario del sitio oficial para la versión de Windows ([Descargar](http://luabinaries.sourceforge.net/download.html) (*Descargar para la versión de sistema operativo y que indique que es la versión ejecutable*).

Una vez descargado el binario, se descomprime y se debe configurar la variable de entorno para poder usar el intérprete desde terminal. 

> *Para más detalle ver el siguiente [video](https://www.youtube.com/watch?v=LtNoFZV_Rj4)*
 
#### Configurando variable de entorno en windows

Esto se realiza para que el sistema operativo reconozca el intérprete de Lua y se pueda usar desde terminal. 

> *Ver más detalles en el siguiente [video](https://www.youtube.com/watch?v=LtNoFZV_Rj4)*

#### Terminal

Para mayor comodidad y mejor funcionamiento necesitamos una terminal competente. No es estrictamente necesario pero mejorará nuestra experiencia usando la terminal. Para esto usaremos [git bash](https://git-scm.com/), se descarga de su sitio oficial ([Descargar](https://git-scm.com/)).

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

Ahora debemos abrir la terminal integrada que tiene el editor, con la combinación de letras, Windows y Linux ```Ctrl+J```, Mac ```CMD+J```. En caso que haya salido en la pestaña ```Terminal```, dar clic en ella. Una vez que ya cargo el ```promt``` escribimos:

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

Es un espacio virtual el cual quedará registrado en la memoria; el cual se podrá llamar en diferentes puntos de la programación cuantas veces la necesitemos. A este espacio se le da un nombre que nos indique para qué ha sido creada. Las variables pueden tomar cualquier tipo de valor. Dado que Lua es un lenguaje débilmente tipado, el tipo de la variable se infiere, además se puede cambiar su contenido en cualquier instante, sin importar que tipo era.

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

- Multi line: Para escribir un comentario comienza con doble guion medio y doble corchete cuadrado, para cerrar el comentario se hace con doble guion y corchetes cuadrados. 
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
-- comenzamos declarando dos variables asignándole un valor arbitrario, estos pueden ser los que uno quiera

local valor1 = 4 -- asignamos el valor de 4 a una variable llamada valor1
local valor2 = 3 -- asignamos el valor de 3 a una variable llamada valor2

local resultado = valor1 + valor2 -- realizamos la suma de las variables y lo guardamos en otra variable llamada resultado

print(resultado) -- se imprime el resultado de la suma
```

La palabra ```local``` la analizaremos más adelante con el tema de alcance de variables, por el momento ve acostumbrándote a usarla.

## Convenciones en declaración de variables y funciones

Dentro la programación existen diversas convenciones el nombramiento de variables y funciones. En este libro usaremos la convención ```Camel Case```; nombrada de esta forma por la apariencia o forma que toma al momento de nombrarlas.

La forma de nombrarlas es que el nombre de la variable o función comienza **siempre** en minúscula y se el nombre es largo la siguiente palabra sin dejar espacio se escribe con mayúscula

Primero que nada, una variable o función jamás podrá comenzar con un número, ni símbolos, **siempre** debe ser por letras.

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

### Operadores aritméticos

Nombre | Símbolo | Descripción| Ejemplo
-|:-:|-|-
Suma| + | Operador de suma| 4 + 3 &rarr; 7
Resta| - | Operador de resta| 9 - 5 &rarr; 4
Multiplicación| * | Operador de multiplicación| 3 * 3 &rarr; 6 
División | / | Operador de razón| 1 / 2 &rarr; 0.5
Módulo| % | Operador de residuo| 5 % 3 &rarr; 2
Potencia| ^ | Operador de potencia| 3 ^ 2 &rarr; 9

Ahora realizaremos un ejemplo aplicando todos los operadores aritméticos:

```Declarar 2 variables, asignado un valor arbitrario y aplicar todos los operadores aritméticos y observar el resultado.```

``` lua
-- Declaro mis variables iniciales
local valor1 = 5 -- asigno el valor de 5 
local valor2 = 2 -- asigno el valor de 2

local suma = valor1 + valor2  -- realizamos la operación de suma y lo guardamos en una variable
local resta = valor1 - valor2  -- realizamos la operación de resta y lo guardamos en una variable
local multi = valor1 * valor2  -- realizamos la operación de multiplicación y lo guardamos en una variable
local div = valor1 / valor2  -- realizamos la operación de división y lo guardamos en una variable
local mod = valor1 % valor2  -- realizamos la operación de residuo y lo guardamos en una variable
local potencia = valor1 ^ valor2  -- realizamos la operación de potencia y lo guardamos en una variable

-- Se imprimen los resultados
print(suma) -- 7
print(resta) -- 3
print(multi) -- 10
print(div) -- 2.5
print(mod) -- 1
print(potencia) -- 25.0

```

## Estructura de decisión

La estructura más basica que existe es la de una decisión, lo cual significa que si a lo que se pregunta es verdadero o no; con base en ello se realiza o no cierta acción.

### Estructura IF

Se muestra la estructura **if** a continuación

```lua
-- Forma de leer el bloque if

-- si la condición se cumple entonces
if < condición > then -- inicia el bloque if

  -- bloque de código si la condición se cumplió

end -- indica que el bloque ha terminado
```

*Ejemplo:*

```lua 
local var1 = 4
local var2 = 5

if var1 < var2 then -- si var1 es menor que var2 entra al bloque y ejecuta las instrucciones
  
  print("4 es mayor que 5") -- 4 es mayor que 5

end
```

### Operadores de relación

En una comparacíon se realiza una pregunta (pregunta figurativa) en la cual la respuesta solo puede ser *si* o *no*; es decir, *True* o *False*. Para esto los unicos operadores que dan este resultado son los siguientes:

Nombre | Símbolo | Descripción
-|:-:|:-:|
Menor que| <| 3 < 5
Menor o igual que| <=| 6 <= 5
Mayor que| >| 7 > 2
Mayor o giual que| >=| 2 > 5
Igual que| == | 8 == 8
Diferente que| ~=| 9 ~= 2

*Ejemplo:*

- Aplicar todos los operadores de relación comparando dos variables con un valor asignado

```lua
local a = 7
local b = 8

if a < b then
  print("7 es menor que 8")
end

if a <= b then
  print("7 es menor o igual que 8")
end

if a > b then
  print("7 es menor que 8")
end

if a >= b then
  print("7 es menor o igual que 8")
end

if a == b then
  print("7 es igual que 8")
end

if a ~= b then
  print("7 es diferente que 8")
end
```