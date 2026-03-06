#!/bin/bash

URL="https://lemoncode.net"
palabra="$1"


curl "$URL" > pagina.html

apariciones=$(grep "$palabra" pagina.html | wc -l)

if [ "$apariciones" -eq 0 ]; then
  echo "no se ha encontrado la palabra \"$palabra\""
else
  echo "la palabra \"$palabra\" aparece $apariciones veces"

  linea=$(grep -n "$palabra" pagina.html | head -1 | cut -d: -f1)

  echo "aparece por primera vez en la linea $linea"
fi