#!/bin/bash

if [ $# -ne 2 ]; then
  echo "se necesitan únicamente dos parámetros para ejecutar este script"
  exit 1
fi

URL="$1"
palabra="$2"

curl "$URL" > pagina.html

apariciones=$(grep "$palabra" pagina.html | wc -l)

if [ "$apariciones" -eq 0 ]; then
  echo "no se ha encontrado la palabra \"$palabra\""
else
  echo "la palabra \"$palabra\" aparece $apariciones veces"

  linea=$(grep -n "$palabra" pagina.html | head -1 | cut -d: -f1)

  if [ "$apariciones" -eq 1 ]; then
    echo "aparece únicamente en la linea $linea"
  else
    echo "aparece por primera vez en la linea $linea"
  fi
fi
