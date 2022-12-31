#!/bin/bash

check_file() {

  read -p "$FILE_NAME exists. Do you want to overrite? [Y/n] :" OPTION
  if [ $OPTION == "n" ]; then
    exit 0
  fi
}

while [ -z "$COCKTAIL_NAME" ]; do
  read -p "Enter the name of the cocktail: " COCKTAIL_NAME
done

while [ -z "$GLASS" ]; do
  read -p "Enter the type of glass that should be used: " GLASS
done

while [ -z "$SEASONS" ]; do
  read -p "Enter the seasons to drink this in (winter|spring|summer|fall|all): " SEASONS
done

while [ -z "$TEMPERATURE" ]; do
  read -p "Enter the temperature of the drink (hot|cold|): " TEMPERATURE
done

FILE_NAME="./recipes/$COCKTAIL_NAME.md"

[ ! -z "$FILE_NAME" ] || check_file

/bin/cat >"$FILE_NAME" <<EOL
---
Glass: $GLASS
Seasons: $SEASONS
Temperature: $TEMPERATURE
---

## $COCKTAIL_NAME

EOL
