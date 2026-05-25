#!/bin/bash
VERSION=$1

curl -Lo /usr/local/bin/apkeep \
  https://github.com/EFForg/apkeep/releases/latest/download/apkeep-x86_64-unknown-linux-gnu
chmod +x /usr/local/bin/apkeep

echo "Скачиваем YouTube из Google Play..."
apkeep -a com.google.android.youtube \
  -d google-play \
  -u "$GOOGLE_LOGIN" \
  -p "$GOOGLE_PASSWORD" \
  .

echo "Файлы в папке:"
ls -lh .

# Находим скачанный apk и переименовываем
APK=$(find . -name "*.apk" | head -1)
if [ -z "$APK" ]; then
  echo "APK не найден!"
  exit 1
fi

mv "$APK" youtube.apk
echo "Успешно: $(du -h youtube.apk)"
