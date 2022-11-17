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