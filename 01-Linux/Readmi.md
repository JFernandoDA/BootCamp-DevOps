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
  echo 'Que me gusta la bash!!!!' > file1.txt
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

## Ejercicio 4

Lo primero creamos el fichero para contener el script de bash y le damos permisos de ejecución

```bash
$ touch ejercicio4.sh
$ chmod +x ./ejercicio4.sh
```

Copiamos el seguiente contenido en el fichero ejercicio4.sh, podemos hacerlo de la misma forma que en el ejercicio anterior.

```
URL='https://google.es'
TEXT=$(curl -s $URL )

OCCURRENCES=$(echo "$TEXT" | grep -io "$1" | wc -l)

if (( $OCCURRENCES == 0)); then
  echo "No se ha encontrado la palabra \"$1\""
else
  echo "La palabra \"$1\" aparece $OCCURRENCES veces"
  FIRST_OCCURRENCE=$(echo "$TEXT" | grep -no -i $1 | head -1 | cut -f1 -d:)
  echo "Aparece por primera vez en la línea $FIRST_OCCURRENCE"
fi
```

Por último ejecutamos el archivo ejercicio4.sh

```bash
bash ejercicio4.sh google
```

## Ejercicio 5

Lo primero creamos el fichero para contener el script de bash y le damos permisos de ejecución

```bash
$ touch ejercicio5.sh
$ chmod +x ./ejercicio5.sh
```

Copiamos el seguiente contenido en el fichero ejercicio4.sh, podemos hacerlo de la misma forma que en el ejercicio 3.

```
#$1 contiene la URL 
#$2 contiene la palabra a buscar.

if(($# != 2)); then
  echo "Se necesitan únicamente dos parámetros para ejecutar este script"
  exit 1
fi

TEXT=$(curl -s $1 )

OCCURRENCES=$(echo "$TEXT" | grep -io "$2" | wc -l)

if (( $OCCURRENCES == 0)); then
  echo "No se ha encontrado la palabra \"$2\""
elif (($OCCURRENCES == 1));then
  echo "La palabra \"$2\" aparece 1 sola vez"
  FIRST_OCCURRENCE=$(echo "$TEXT" | grep -no -i $2 | head -1 | cut -f1 -d:)
  echo "Aparece únicamente en la línea $FIRST_OCCURRENCE"
else
  echo "La palabra \"$2\" aparece $OCCURRENCES veces"
  FIRST_OCCURRENCE=$(echo "$TEXT" | grep -no -i $2 | head -1 | cut -f1 -d:)
  echo "Aparece por primera vez en la línea $FIRST_OCCURRENCE"
fi
```
Por último ejecutamos el archivo ejercicio4.sh

```bash
bash ejercicio5.sh https://www.google.es google
```