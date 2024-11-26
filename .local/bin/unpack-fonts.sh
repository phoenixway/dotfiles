#!/bin/bash

# Перевірка наявності аргументу
if [ $# -eq 0 ]; then
  echo "Ви не вказали шлях до ZIP-архіву."
  echo "Використання: $0 <шлях_до_архіву>"
  exit 1
fi

# Отримання шляху до архіву з аргументу
zip_file="$1"

# Директорія призначення
destination_dir="/home/roman/.local/share/fonts"

# Розпакування архіву
unzip -d "$destination_dir" "$zip_file"

# Оновлення кешу шрифтів
sudo fc-cache -r -v
