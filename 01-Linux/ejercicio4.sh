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