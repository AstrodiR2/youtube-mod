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

mv com.google.android.youtube*.apk youtube.apk
echo "Успешно: $(du -h youtube.apk)"
