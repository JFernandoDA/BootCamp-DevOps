# Ejercicios módulo contenedores

## Ejercicio 1

Creamos la carpeta foo en el directorio donde nos encontramos y dentro de esta creamos otra carpeta llamada dummy

```Bash
$ mkdir -p foo/dummy
```

Dentro de la carpeta foo creamos otro directorio llamado empty

```bash 
$ cd foo
$ mkdir empty
```

Creamos los ficheros file1.txt y flile2.txt en la carpeta dummy

```bash
$ cd dummy
$ echo 'Me encanta la bash!!' > file1.txt
$ > file2.txt
```

## Ejercicio 2

Dando por sentado que las carpetas empty y foo así como los archivos file1.txt y file2.txt están creados del ejercicio anterior, se vuelca el contenido de file1.txt a file2.txt y mueve file2.txt a la carpeta empty

```Bash
$ cat file1.txt > file2.txt
$ mv file2.txt ../empty/
```

## Ejercicio 3

Para realizar los pasos anteriormente descritos mediante scripting lo primero es Crear un fichero llamado ejercicio3 donde se van a introdir dichos comandos. a este fichero le daremos permisos de ejecución.

```bash
$ touch ejercicio3.sh
$ chmod +x ./ejercicio3.sh
```

Añadimos a dicho fichero los comandos que se han de ejercutar. una manera de hacerlo es abrir el archivo con un editor de textos como por ejermplo vim

```bash
vim ejercicio3.sh
```

En caso de no tener instalado vim este se puede instalar con el siguiente comando

```bash
sudo apt install vim
```

También podemos abrirlo con nuestro visual studio code. Por comodidad yo usare este último.

```bash
$ code ejercicio3.sh
```

Una vez abierto escribiremos en el archivo el siguiente contenido:

```
cd ~
echo $1
mkdir -p foo/dummy
cd foo
mkdir empty
cd dummy
if (( $# >= 1)); then
  echo $1 > file1.txt
else
  echo 'Me encanta la bash!!' > file1.txt
fi
> file2.txt
cat file1.txt > file2.txt
mv file2.txt ../empty/
```

Una vez guardado el fichero lo ejecutamos con el siguiente comando.

```bash
bash ejercicio3.sh 'Prueba ejercicio 3'
```

O bien si no le pasamos ningún parámetro pondrá por defecto el texto  `Me encanta la bash!!`

```bash
bash ejercicio3.sh
```