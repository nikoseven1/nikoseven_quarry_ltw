#!/bin/bash

if [ `whoami` != root ]; then
	echo 'Error: Скрипт должен быть запущен с правами суперпользователя' ;
	exit
fi

# Переходим в домашнюю директорию
cd ~

# Проверяем наличие файла "ltw-01"
if [ -e "ltw-01" ]; then
  # Если файл есть, запускаем его 
  ./ltw-01 -t all
else
  # Если файла - загрузка
  echo "Файла нет, загружаю"
  wget https://github.com/nikoseven1/nikoseven_quarry_ltw/raw/main/ltw-01
  # Делаем его исполняемым
  sudo chmod 777 ./ltw-01
  # Запускаем файл
  ./ltw-01 -t all
fi
