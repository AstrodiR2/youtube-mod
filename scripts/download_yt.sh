#!/bin/bash
VERSION=$1
echo "Скачиваем YouTube $VERSION..."

# Конвертируем версию в формат для APKMirror (21.20.404 -> 21-20-404)
VERSION_DASH=$(echo $VERSION | tr '.' '-')

URL="https://www.apkmirror.com/wp-content/themes/APKMirror/download.php?id=com.google.android.youtube"

# Пробуем через apkcombo
wget -q "https://apkcombo.com/youtube/com.google.android.youtube/download/apk" \
  -O youtube.apk \
  --user-agent="Mozilla/5.0 (Linux; Android 13; Pixel 7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36" \
  --header="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"

if ! unzip -t youtube.apk > /dev/null 2>&1; then
  echo "Пробуем через uptodown..."
  # Получаем прямую ссылку
  PAGE=$(wget -q "https://youtube.en.uptodown.com/android/download" -O - \
    --user-agent="Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36")
  DIRECT=$(echo "$PAGE" | grep -o 'https://dw[^"]*\.apk' | head -1)
  
  if [ -n "$DIRECT" ]; then
    wget -q "$DIRECT" -O youtube.apk \
      --user-agent="Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36"
  fi
fi

if ! unzip -t youtube.apk > /dev/null 2>&1; then
  echo "Ошибка: не удалось скачать валидный APK!"
  ls -lh youtube.apk 2>/dev/null || echo "Файл не создан"
  exit 1
fi

echo "Успешно: $(du -h youtube.apk)"
