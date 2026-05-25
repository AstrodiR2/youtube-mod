#!/bin/bash

# Используем googleplay-api через Python
pip install gplaydl -q

# Качаем с анонимным токеном
python3 - << 'PYEOF'
import subprocess, os

subprocess.run([
  "gplaydl",
  "--package", "com.google.android.youtube",
  "--out", "youtube.apk"
], check=True)
PYEOF

if ! unzip -t youtube.apk > /dev/null 2>&1; then
  echo "Ошибка скачивания!"
  exit 1
fi

echo "Успешно: $(du -h youtube.apk)"
