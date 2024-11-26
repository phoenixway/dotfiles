#!/bin/bash

# Конфігурація
directory="/home/roman/Pictures"
min_width=1000
min_height=1080
cache_file="/tmp/image_list.txt"
current_wallpaper_file="/tmp/current_wallpaper.txt"
previous_wallpaper_file="/tmp/previous_wallpaper.txt"

# Перевірка розміру зображення
check_size() {
  local width=$(identify -format "%w" "$1" 2>/dev/null)
  local height=$(identify -format "%h" "$1" 2>/dev/null)
  [[ -n "$width" && -n "$height" && "$width" -ge "$min_width" && "$height" -ge "$min_height" ]]
}

# Визначення режиму (світлий/темний)
is_dark_mode() {
  local scheme=$(gsettings get org.gnome.desktop.interface color-scheme)
  [[ "$scheme" == *"dark"* ]] && echo "dark" || echo "light"
}

# Визначення яскравості зображення
is_dark_file() {
  local brightness=$(magick "$1" -colorspace gray -format "%[mean]" info:)
  (( $(echo "$brightness < 128" | bc -l) ))
}

# Оновлення кешу
generate_cache() {
  echo "Оновлюємо кеш..."
  find "$directory" -type f \( -iname "*.jpg" -o -iname "*.png" \) > "$cache_file"
}

# Вибір випадкового зображення з кешу
choose_random_from_cache() {
  local mode=$(is_dark_mode)
  while IFS= read -r file; do
    if check_size "$file" && 
       { ([ "$mode" == "dark" ] && is_dark_file "$file") || 
         ([ "$mode" == "light" ] && ! is_dark_file "$file"); }; then
      echo "$file"
      return
    fi
  done < <(shuf "$cache_file")
  echo "Немає відповідних зображень!" >&2
  exit 1
}

# Видалення поточних шпалер
delete_current_wallpaper() {
  local current_wallpaper=$(gsettings get org.gnome.desktop.background picture-uri | sed "s/'//g" | sed "s|file://||")
  local adapted_wallpaper="${current_wallpaper%.*}_adapted.jpg"

  echo "Видаляємо поточні шпалери:"
  if [ -f "$current_wallpaper" ]; then
    echo "Видаляємо: $current_wallpaper"
    rm -f "$current_wallpaper"
  fi

  if [ -f "$adapted_wallpaper" ]; then
    echo "Видаляємо: $adapted_wallpaper"
    rm -f "$adapted_wallpaper"
  fi
}

# Встановлення шпалер
set_wallpaper() {
  local image="$1"
  local mode=$(is_dark_mode)
  local screen_width=$(xdpyinfo | awk '/dimensions:/ {print $2}' | cut -d'x' -f1)
  local screen_height=$(xdpyinfo | awk '/dimensions:/ {print $2}' | cut -d'x' -f2)
  local adapted_image="${image%.*}_adapted.jpg"

  # Збереження поточних шпалер як попередніх
  if [ -f "$current_wallpaper_file" ]; then
    mv "$current_wallpaper_file" "$previous_wallpaper_file"
  fi
  echo "$image" > "$current_wallpaper_file"

  local width=$(identify -format "%w" "$image")
  local height=$(identify -format "%h" "$image")

  if [ "$width" -gt "$height" ]; then
    echo "Horizontal"
    magick "$image" -resize "${screen_width}x${screen_height}" -background black -gravity center -extent "${screen_width}x${screen_height}" "${image}_adapted.jpg"
    if [[ "$mode" == "dark" ]]; then
      gsettings set org.gnome.desktop.background picture-uri-dark "file://${image}_adapted.jpg"
    else
      gsettings set org.gnome.desktop.background picture-uri "file://${image}_adapted.jpg"
    fi
    gsettings set org.gnome.desktop.background picture-options zoom
  else
    echo "Vertical"
    magick "$image" -resize "${screen_width}x${screen_height}" "${image}_adapted.jpg"
    if [[ "$mode" == "dark" ]]; then
      gsettings set org.gnome.desktop.background picture-uri-dark "file://${image}_adapted.jpg"
    else
      gsettings set org.gnome.desktop.background picture-uri "file://${image}_adapted.jpg"
    fi
    gsettings set org.gnome.desktop.background picture-options centered
  fi
  # Адаптація зображення
  # magick "$image" -resize "${screen_width}x${screen_height}" -background black -gravity center -extent "${screen_width}x${screen_height}" "$adapted_image"

  # Встановлення
  # if [[ "$mode" == "dark" ]]; then
  #   gsettings set org.gnome.desktop.background picture-uri-dark "file://$adapted_image"
  # else
  #   gsettings set org.gnome.desktop.background picture-uri "file://$adapted_image"
  # fi
  # gsettings set org.gnome.desktop.background picture-options zoom
}

# Повернення до попередніх шпалер
restore_previous_wallpaper() {
  if [ -f "$previous_wallpaper_file" ]; then
    local previous_image=$(cat "$previous_wallpaper_file")
    if [ -f "$previous_image" ]; then
      echo "Повертаємося до попередніх шпалер: $previous_image"
      set_wallpaper "$previous_image"
    else
      echo "Попередні шпалери не знайдено!"
    fi
  else
    echo "Інформація про попередні шпалери відсутня!"
  fi
}

# Обробка аргументів командного рядка
while getopts "dr" opt; do
  case $opt in
    d)
      echo "Опція -d: Видалення поточних шпалер"
      delete_current_wallpaper
      ;;
    r)
      echo "Опція -r: Повернення до попередніх шпалер"
      restore_previous_wallpaper
      exit 0
      ;;
    *)
      echo "Невідома опція: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Основна логіка
if [ ! -f "$cache_file" ] || [ ! -s "$cache_file" ]; then
  generate_cache
fi

random_image=$(choose_random_from_cache)
echo "Обрано зображення: $random_image"
set_wallpaper "$random_image"

