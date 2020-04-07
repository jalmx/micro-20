# Lua

## Instalación y configuración del entorno

### Windows

Hay varias formas de instalación del intérprete de Lua, pero la forma más sencilla es descargar los archivos compilados o binario del sitio oficial para la versión de Windows ([Descargar](http://luabinaries.sourceforge.net/download.html) (*Descargar para la versión de sistema operativo y que indique que es la versión ejecutable*).

Una vez descargado el binario, se descomprime y se debe configurar la variable de entorno para poder usar el intérprete desde terminal. 

> *Para más detalle ver el siguiente [video](https://www.youtube.com/watch?v=LtNoFZV_Rj4)*
 
#### Configurando variable de entorno en Windows

Esto se realiza para que el sistema operativo reconozca el intérprete de Lua y se pueda usar desde terminal. 

> *Ver más detalles en el siguiente [video](https://www.youtube.com/watch?v=LtNoFZV_Rj4)*

#### Terminal

Para mayor comodidad y mejor funcionamiento necesitamos una terminal competente. No es estrictamente necesario, pero mejorará nuestra experiencia usando la terminal. Para esto usaremos [git bash](https://git-scm.com/), se descarga de su sitio oficial ([Descargar](https://git-scm.com/)).

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

Damos enter. Debiéndose ejecutar el programa y veremos en el ```promt```. El siguiente mensaje:

``` bash
Estoy programando en Lua
```

Este procedimiento lo realizaremos cada vez que hagamos nuestros programas.

## Conceptos básicos

### ¿Qué es una variable?

Es un espacio virtual el cual quedará registrado en la memoria; el cual se podrá llamar en diferentes puntos de la programación cuantas veces la necesitemos. A este espacio se le da un nombre que nos indique para qué ha sido creada. Las variables pueden tomar cualquier tipo de valor. Dado que Lua es un lenguaje débilmente tipado, el tipo de la variable se infiere, además se puede cambiar su contenido en cualquier instante, sin importar que tipo era. *Existen tres tipos de variables en Lua*: `globales`, `locales` y `campos de tabla`.

*Ejemplos:*

``` lua
valor -- tiene asignado nil; es decir sin referencia

edad = 20 --Variable que almacena la edad

registro = 2 -- Variable que almacena un valor de un registro

nombre = "Diana" --Variable que almacena un nombre

nombre = "Aprendiendo programación" --Variable que almacena una frase
```

Variable que almacena una función:
``` lua
mensaje = function(nombre)
            return "Hola " .. nombre 
          end

function mensaje(nombre)
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
local nombre = "Frida"

local carroGrande = "Camión"

local numeroDeCasas = 23

local variable1 = 14

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
División | // | Operador de razón, elimina todo después del punto decimal| 1 / 2 &rarr; 0
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

La estructura más básica que existe es la de una decisión, lo cual significa que si a lo que se pregunta es verdadero o no; con base en ello se realiza o no cierta acción.

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

En una comparación se realiza una pregunta (pregunta figurativa) en la cual la respuesta solo puede ser *si* o *no*; es decir, *True* o *False*. Para esto los únicos operadores que dan este resultado son los siguientes:

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

### Ejemplos

1. Crear un programa que identifique si la persona es mayor de edad. Con la edad dada dentro del programa.

```lua
local edad = 20

if edad >= 18 then
  print("Eres mayor de edad")
end
```

2. Crear un programa que identifique si el número es par o impar

```lua
local n = 5

if n % 2 == 0 then
  print("El número es par")
end

if n % 2 ~= 0 then
  print("El número es impar")
end
```

3. Hacer un programa que calcule el promedio de 3 calificaciones, si es mayor a 6, que indique de un mensaje de aprobado, de lo contrario indique un mensaje de motivación

```lua
local cal1 = 8
local cal2 = 5
local cal3 = 3

local promedio = (cal1 + cal2 + cal3) / 3

if promedio >= 6 then
  print("Aprobado con éxito")
end

if promedio < 6 then
  print("Te falto muy poco para lograrlo, sigue esforzándote")
end
```

4. Crear un programa que indique de los números cual es el mayor o si son iguales

```lua
local variable1 = 4
local variable2 = 7

if variable1 > variable2 then
  print("El primer valor es mayor que el segundo")
end

if variable1 < variable2 then
  print("El segundo valor es mayor que el primero")
end

if variable1 == variable2 then
  print("Ambos valores son iguales")
end
```

Los ejemplos anteriores se pueden realizar de una manera más optima, para esto veremos el siguiente tema.

### Estructura if else

Esta forma de la estructura es conocida como *si se cumple la comparación realizo la acción, de lo contrario realizo otra acción*

Sintaxis:

```lua
if < comparación > then
  -- bloque de código que se ejecuta si la comparación es verdadera
else 
  -- bloque de código que se ejecuta si la comparación no se cumple
end -- termina el bloque if-else
```

Una nota importante es que en caso que nunca se cumpla la condición **siempre entrará al bloque *else***

*Ejemplos:*

1. Crear un programa que identifique si la persona es mayor de edad. Con la edad dada dentro del programa.

```lua
local edad = 20

if edad >= 18 then
  print("Eres mayor de edad")
else 
  print("Es menor de edad")
end
```

2. Crear un programa que identifique si el número es par o impar

```lua
local n = 5

if n % 2 == 0 then
  print("El número es par")
else
  print("El número es impar")
end
```

3. Hacer un programa que calcule el promedio de 3 calificaciones, si es mayor a 6, que indique de un mensaje de aprobado, de lo contrario indique un mensaje de motivación

```lua
local cal1 = 8
local cal2 = 5
local cal3 = 3

local promedio = (cal1 + cal2 + cal3) / 3

if promedio >= 6 then
  print("Aprobado con éxito")
else
  print("Te falto muy poco para lograrlo, sigue esforzándote")
end
```

### If anidado

Se pueden combinar el if-else, con más sentencias if o if-else, es llamado *if anidado* 

1. Crear un programa que indique de los números cual es el mayor o si son iguales

Primera forma

```lua
local variable1 = 4
local variable2 = 7

if variable1 > variable2 then
  print("El primer valor es mayor que el segundo")
else -- Comienza el bloque else, todo lo que está dentro de él se ejecuta si la condición previa no se cumple
  if variable1 < variable2 then -- if dentro de un else
    print("El segundo valor es mayor que el primero")
  else 
    print("Ambos valores son iguales")
  end
end
```

Segunda forma:

```lua
local variable1 = 4
local variable2 = 7

if variable1 >= variable2 then -- inicia el bloque if
  if variable1 > variable2 then -- primer if anidado
    print("El primer valor es mayor que el segundo")
  else 
    print("Ambos valores son iguales")
  end -- fin del bloque interno
else -- bloque else principal
  if variable1 < variable2 then -- if dentro de un else
    print("El segundo valor es mayor que el primero")
  end --termina if interno del bloque else
end -- termina bloque else principal
```

2. Comparar 3 números e indicar cuál es el mayor

```lua
local valor1 = 1
local valor2 = 7
local valor3 = 3

if valor1 > valor2 then
  if valor1 > valor3 then
    print("El primer valor es el mayor")  
  else
    print("El valor 3 es el mayor")
  end
else 
  if valor2 > valor3 then
    print("El valor 2 es el mayor")
  else
    print("El valor 3 es el mayor")
  end
end
```

### Forma elseif

Existe otra forma y es la más usual de usar en un if-else.

Sintaxis:

```lua
if < comparación > then
  -- bloque de código
elseif < comparación > then
  -- bloque de código
end
```

Puede contener un else al final, depende de tu aplicación usarlo o no.

```lua
if < comparación > then
  -- bloque de código
elseif < comparación > then
  -- bloque de código
else 
  -- bloque de código que se ejecuta si alguna comparación anterior no se cumplió
end
```

Ejemplos:

1. Crear un programa que indique de los números cual es el mayor o si son iguales

```lua
local variable1 = 4
local variable2 = 7

if variable1 > variable2 then
  print("El primer valor es mayor que el segundo")
elseif variable1 < variable2 then
  print("El segundo valor es mayor que el primero")
else 
  print("Ambos valores son iguales")
end
```

De todas las formas mostrada esta última es la más corta y eficiente.

2. 

```lua
```

### Operadores lógicos

Un operador lógico sirve para combinar comparaciones y en función del resultado tomar una decisión, comprende de 3 operadores que son `AND`, `OR` y `NOT`. Como las estructuras de control todos los operadores lógicos consideran `false` y `nil` como falso y todo lo demás como verdadero.

Las tablas de verdad de los operadores:

**AND**

Entrada 1 | Entrada 2 | Salida
-|-|-|
false | false | false
false | true | false
true | false | false
true | true | true

*La regla de **AND** nos dice que mientras exista a la entrada un *false*, tendremos un valor *false* a la salida*

**OR**

Entrada 1 | Entrada 2 | Salida
-|-|-|
false | false | false
false | true | true
true | false | true
true | true | true

*La regla de **OR** nos dice que mientras exista a la entrada un *true*, tendremos un valor *true* a la salida*

**NOT**

Entrada| Salida
-|-|
false | true
true | false

*La regla de **NOT** nos dice que todo lo que recibe lo invierte.*

Aplicación de los operadores lógicos

Nombre | Símbolo | Descripción
-|:-:|-|
AND| and| (9 > 4) and (3 < 6) &rarr; true
OR| or| (8 == 3) or (2 ~= 3) &rarr; true
NOT| not| not(true) &rarr; false

Ejemplos:

1. En una variable almacena la calificación, se debe verificar el valor si es congruente; es decir, calificaciones arriaba de 10 y abajo de 0 no son posibles, la calificación reprobatoria es por debajo de 6 y aprobatoria arriaba de 6.

```lua
local calificacion = 8

if calificacion > 6 and calicacion <= 10 then
  print("Has aprobado la asignatura")
elseif calificacion < 6 and calificacion >= 0 then
  print("No has aprobado la asignatura")
else 
  print("La calificación no es posible")
end
```

2. Realizar un programa que mande un mensaje distinto en función de la calificación obtenida por el alumno. Ejemplos: 
   - De tener menos de 6 &rarr; "Te falto un poco más" 
   - De tener de 6 y menos de 7 &rarr; "A penitas!"
   - De tener de 7 y menos de 8 &rarr; "Podemos mejorar"
   - De tener de 8 y menos de 9 &rarr; "Lo hiciste bien"
   - De tener de 9 y menos de 10 &rarr; "Muy bien, se refleja tu esfuerzo"
   - De tener de 10 &rarr; "Excelente!"

```lua
local calificacion = 7

if calificacion < 6 and calificacion >= 0 then
  
  print("Te falto un poco más")

elseif calificacion >= 6 and calificacion < 7 then

  print("A penitas!")

elseif calificacion >= 7 and calificacion < 8 then

  print("Podemos mejorar")

elseif calificacion >= 8 and calificacion < 9 then

  print("Lo hiciste bien")

elseif calificacion >= 9 and calificacion < 10 then

  print("Muy bien, se refleja tu esfuerzo")

elseif calificacion == 10 then
  
  print("Excelente!")

else 

  print("Calificación no posible")

end
```

### Tipos de datos

`Lua`es un lenguaje interpretado; es decir, usa un software que lee y las instrucciones de un archivo y con base a eso, el intérprete interactúa con el sistema operativo y realiza las acciones que se desean.

Dentro de `lua` existen los tipos de datos, estos indican que tipo es la variable, aun que a pesar de que por dentro si se identifica su tipo. De esta manera es que el intérprete sabe cómo interactuar con las variables.

La manera de ver los tipos de datos es un función llamada `type()`; ejemplo:

```lua
local texto = "Hola"
local numero = 3
local numeroFlotante = 4.2
local bool = true
local funcion = print
local nulo = nil

print(type(texto)) -- string
print(type(numero)) -- number
print(type(numeroFlotante)) -- number
print(type(bool)) -- boolean
print(type(funcion)) -- function
print(type(nulo)) -- nil
```

Resultado:

```
string
number
number
boolean
function
nil
```

#### Tipo string

El tipo `string` es significa `cadena de caracteres`; es decir, literalmente texto, una variable tipo `string` puede contener una letra, una palabra, una oración, inclusive números, pero cuidado, finalmente es texto. No es lo mismo el valor de `1` que `"1"`, el primero es tipo `number` y el segundo es `string`. Son tipos distintos, aunque sus valores sean los mismo.

**Ejemplos:**

```lua
local variable = "" -- Está variable es una cadena vacía, pero ya es un string
local nombre = " " -- contiene un espacio, pero al final es una cadena
local nombre = "Alejandro" -- Variable con un calor cargado
local apellido = "Leyva" -- Variable con un calor cargado
local nombreCompleto = nombre .. " " .. apellido --almaceno el valor de 2 variables y forma un texto completo

```

#### Tipo number

El Tipo número abarca tanto valores enteros; es decir, que no tiene punto decimal el valor, como *1, 2, 3, 40, 55, 100*; no contiene coma flotante y los números fraccionarios o con punto decimal, como *1.3, 0.5, 5.30, 4.1, 0.01*

```lua

local valor = 0 -- esta variable es un tipo number, será un valor de cero, pero eso está contenido dentro
local edad = 30 -- variable con un valor cargado
local totalRegistros = 10 -- variable con un valor cargado
local registrosExtras = 3 -- variable con un valor cargado
local total = totalRegistros + registrosExtras -- La suma de 2 variables las guardo
```

#### Tipo boolean

Los tipos booleanos son solamente dos valores que son `true`y `false`, esto indica que algo se `cumple` o `no se cumple`. Este tipo de variable normalmente se usa para conocer el estado (`status`) de alguna situación, para que con base en ello realicemos otra acción. 

*Tanto `false` como `nil` se consideran falsos. Todos los valores diferentes de `nil` y `false` se consideran verdaderos (en particular, el número 0 y el string vacío son también verdaderos).*

**Ejemplo:**

```lua
local status = true

if status then
  print("Es estado es ok")
else 
  print("En estado de falla")
end
```

#### Tipo nil

Existe un *tipo de dato* que como tal no es un tipo, se llama `nil`, es un indicativo de que no existe ninguna referencia hacia esa variable. Es como estar llamando al vacío, a la nada, no existe nada, no hay absolutamente nada.

**Ejemplo**

```lua

local sinReferencia = nil

if sinReferencia == nil then
  print("No existe referencia a la variable")
end
```

### Entrada y salida de datos (I/O)

#### Salidas (Output)

Para mandar una impresión a pantalla o salida a pantalla usamos la función `print`, la cual manda un mensaje a la pantalla con el texto que le hayamos dado. Podemos pasar el texto directamente y concatenar las variables o se puede pasar separados por coma, solo que en este segundo caso 

**Concatenación**

Cuando queremos unir, pegar o sumar, varios textos para formar una oración completa es la acción de concatenar variables o textos, esto se realiza con dos puntos `..`.

**Ejemplo**

```lua
-- Concatenando variables
local nombre = "Alejandro"
local edad = 30

print(nombre .. " tiene una edad de " .. edad )


-- Separador por comas
print(nombre, "tiene una edad de", edad)
```
*Salida*
```
Alejandro tiene una edad de 30
Alejandro       tiene una edad de       30
```

**Secuencias de escape**

Una secuencia de escape es para dar énfasis o dar mejor formato a nuestro mensaje, el cual se manda a la pantalla.

Nombre|Símbolo|
-|:-:|-|
Salto de línea| **\n**| 
Tabulador horizontal| **\t**| 
Tabulador vertical| **\v**| 
Backslash| **\\**| 
Doble comilla| **\"**| 
Comilla simple| **\'**| 
Retorno de carro| **\r**| 

Ejemplo:

```lua
-- Tomar en cuenta que no se deja espacio, entre el texto y la secuencia de escape
print("Programando \nen\nLua") 
print("Programando \ten\tLua")
print("Programando \ven\vLua")
print("\"Programando en Lua\"")
print("\'Programando en Lua\'")
print("\\Programando en Lua\\")
print("Programando \ren\rLua")
```

*Salida*

```
Programando 
en
Lua
Programando     en      Lua
Programando 
            en
              Lua
"Programando en Lua"
'Programando en Lua'
\Programando en Lua\
Luagramando 
```

#### Entradas (Input)

Para poder ingresar datos desde la terminal de comandos, existe una librería llamada `io` y dentro tiene una función llamada `read`, la forma de emplearla es `io.read()`, como argumento puede recibir varios valores, aquí solo se tratará con el argumento `"n"` y vacío. 
Si no le pasamos ningún argumento por default todo lo que reciba lo tratará como un `string`, si le pasamos `n`, todo lo que entre lo manejará como un número, en caso que pongamos una letra, lanzará un error el programa.

```lua 
print("escribe tu nombre")

local nombre = io.read() -- al no pasarle argumentos, lo que reciba será tratado como tipo string

print("Hola " .. nombre)
```

*Salida*

```
escribe tu nombre
arturo
Hola arturo
```

#### Alcance de variables (Scope)

Como ya se mencionó las `variables` tienen un alcance global por default; es decir, al momento de declararlas se vuelven de ámbito global a menos que se indique lo contrario, la forma de declarar variables que solo existan en el ámbito que fue creado es con la palabra reservada `local`.

Al escribir `local` indicamos que solo exista en el contexto o alcance de esa sección o estructura. Al hacer esto evitamos entrar en conflictos con otras variables que puedan existir dentro de las librerías de lua o inclusive en otros archivos que hayamos creado. Además, de ser una buena práctica.

**Ejemplos:**

```lua
-- Las variables que se ven declaradas aquí solo existirán dentro del documento en las instancie, fuera de este archivo nadie más puede tener acceso ni modificarlas directamente

local a = 3
local b = 6

print(a+b) -- 9 

-- 

local suma = 0

if suma == 0 then
  local n = 3 -- la variable n solo existe dentro del if, fuera de él sale de su alcance
  suma = suma + n -- 0 + 3
end

print(n) -- nil

```

### Estructuras de repetición o ciclos (loop)

Las estructuras de repetición son sentencias para realizar una tarea repetitiva, la cual necesitamos repetir cierta de cantidad de veces o en ocasiones infinidad de veces. Para esto contamos con `while`, `repeat` y `for`.

#### While

Un ciclo `while` se lee como: "Mientras la condición se cumpla has ..."

Estructura de un `while`

```lua

while < condición > do 
  -- código que se repetirá hasta que la comparación sea false
end
```

**Ejemplo:**

1. Imprimir la tabla del 7, vaya 7 x 1 = 7, hasta 7 x 10 = 70. Una vez cuente hasta el 10, terminará.

```lua
-- Una opción
local tabla = 7
local contador = 1

while contador <= 10 do
  local multiplicacion = tabla * contador
  print(tabla .. "x" .. contador .. "=" ..  multiplicacion)
  contador = contador + 1
end

-- Segunda opción
local contador = 1
local tabla = 7
local tope = 7 * 10
local multiplicacion = 0

while multiplicacion < tope do
  multiplicacion = tabla * contador
  print(tabla .. "x" .. contador .. "=" ..  multiplicacion)
  contador = contador + 1
end
```

2. Solicitar al usuario la tabla que desea conocer y hasta donde desea conocerla.

```lua
local contador = 1

print("Qué tabla quieres conocer?")
local tabla = io.read("n")
print("Dar el límite de la tabla?")
local tope =  io.read("n")

while contador <= tope do
    local multiplicacion = tabla * contador
    print(tabla .. "x" .. contador .. "=" ..  multiplicacion)
    contador = contador + 1
end
```

#### Break

En ocasiones por algún motivo queremos terminar un ciclo abruptamente; es decir, no necesitamos que termine, queremos cortar antes de que termine o simplemente lo hicimos infinito y por medio de algo queremos que se acabe antes. Bueno para todo esto tenemos una palabra que rompe que ciclo, llamada `break`.

**Ejemplos:**

1. Sumar números dados por el usuario y cuando de -1 salga, rompiendo el ciclo  

```lua
local salir = 0
local suma = 0

while true do
  print("Dar un valor a sumar")
  local valor = io.read("n")
  suma = suma + valor
  print("0) Continuar sumando\n1)Salir")
  local salir = io.read("n")
  if salir == 1 then
    break 
  end 
end

print("La suma es: " .. suma)
```
*Nota: Este ejercicio hay muchas otras formas de realizarlo, pero para ejemplificar el uso de `break`.*

## Referencias

[Manual de Lua en español](https://www.lua.org/manual/5.1/es/manual.html)