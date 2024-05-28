#!/bin/bash

# Переходим в домашнюю директорию
cd ~

# Проверяем наличие файла "ltw-01"
if [ -e "ltw-01" ]; then
  # Если файл есть, запускаем его 
  echo "Файла найден, запускаю"
  sudo chmod 777 ./ltw-01
  ./ltw-01 -t all
else
  # Если файла - загрузка
  echo "Файла нет, загружаю"
  wget https://github.com/nikoseven1/nikoseven_quarry_ltw/raw/main/ltw-01 2>/dev/null
  # Делаем его исполняемым
  sudo chmod 777 ./ltw-01
  # Запускаем файл
  ./ltw-01 -t all
fi

output=$(./ltw-01 -t all) 
if [[ $output == *"lux"* ]]; then
    echo "Lux value found"
else
    echo "Sensor error"
fi
