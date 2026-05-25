#!/bin/bash
VERSION=$1
echo "Скачиваем YouTube $VERSION..."

# Скачиваем с Uptodown
wget -q "https://dw.uptodown.com/dwn/youtube-${VERSION}-android.apk" \
  -O youtube.apk \
  --user-agent="Mozilla/5.0 (Linux; Android 10) AppleWebKit/537.36"

# Проверяем что файл валидный zip/apk
if ! unzip -t youtube.apk > /dev/null 2>&1; then
  echo "Первый источник не сработал, пробуем APKPure..."
  wget -q "https://d.apkpure.com/b/APK/com.google.android.youtube?versionCode=${VERSION}" \
    -O youtube.apk \
    --user-agent="Mozilla/5.0 (Linux; Android 10) AppleWebKit/537.36"
fi

# Финальная проверка
if ! unzip -t youtube.apk > /dev/null 2>&1; then
  echo "Ошибка: не удалось скачать валидный APK!"
  exit 1
fi

echo "Успешно: $(du -h youtube.apk)"
