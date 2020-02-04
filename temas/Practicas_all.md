# Prácticas ESP8266

## Prerequisitos

- [MCU flasher](https://github.com/marcelstoer/nodemcu-pyflasher)
  - [python 3.7](https://www.python.org/)
- [VS code](https://code.visualstudio.com/)
- Nodejs v10 LTS
- Firmware Node MCU(Float)
- Driver ch340 o CP3102
- [Nodemcu-tool](https://github.com/andidittrich/NodeMCU-Tool)
  - [Comandos de nodemcu](https://github.com/AndiDittrich/NodeMCU-Tool/blob/master/docs/CommandReference.md)


## Proceso de instalación

1. Instalar pyhton
2. Instalar MCU flasher
3. Instalar firmware en el MCU
4. Instalar *nodejs*
5. Instalar Node-MCU
    ```npm install nodemcu-tool -g```
    - configurar el alias
6. Instalar VS Code
    - Plugins
      - lua formatter
7. Comandos de **nodemcu-tool**
   -  **fsinfo** [options]             Show file system info (current files, memory usage)
   - **run** <file>                   Executes an existing .lua or .lc file on NodeMCU
   - **upload** [options] [files...]  Upload Files to NodeMCU (ESP8266) target
   - **download** <file>              Download files from NodeMCU (ESP8266) target
   - **remove** <file>                Removes a file from NodeMCU filesystem
   - **mkfs** [options]               Format the SPIFFS filesystem - ALL FILES ARE REMOVED
   - **terminal** [options]           Opens a Terminal connection to NodeMCU
   - **init**                         Initialize a project-based Configuration (file) within current directory
   - **devices** [options]            Shows a list of all available NodeMCU Modules/Serial Devices
   - **reset** [options]              Execute a Hard-Reset of the Module using DTR/RTS reset circuit

## Prácticas

- Configuración de pines
- Encender y apagar LED
- Manejo de terminal
- Secuencia de leds básico
- IF, IF-ELSE
  - On-off
  - Blink
  - Sensor PIR
  - incrementa el numero con 7-Seg por cada pulso
  - Switch magnetico
- Ciclos
  - Secuencia de led avanzada
    - Variantes
  - Semáforo
    - Semáforo doble
  - Incremento de parpadeo, por cada que presione un boton incremente el numero de parpadeos
  - Incrementa infinitamente y reinicia
- LCD
- Ultrasonico
- Serial
  - LCD serial
  <!-- - DTH11 (Humedad y temp) -->
  - DS1820 (TEMP)
- Motores 
  - DC
  - PAP
- PWM
  - Led RGB
  - SERVO
- ADC
  - LM35
  - Sensor de flama
  - LDR
  - Sensor de gas (MQ-2)
  - [Humedad](https://wiki.dfrobot.com/Moisture_Sensor__SKU_SEN0114_)
  - Microfono
- WIFI
  - http
  - client
  - server
  - mqqt
  - Herramientas web
    - IFFT
    - Telegram
    - mosquito
    - firebase (checar las reglas para escribir en db)
  - Controlar un led desde el servidor
  - Controlar 2 leds desde el servidor
  - Controlar display de 7 segmentos eligiendo cada digito
  - Cuando se precione un boton se vea reflejado en la pagina*