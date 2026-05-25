#!/bin/bash
VERSION=$1
echo "Downloading YouTube $VERSION..."
wget -q "https://apkpure.net/youtube/com.google.android.youtube/download/$VERSION" \
  -O youtube.apk --user-agent="Mozilla/5.0" || \
wget -q "https://d.apkpure.com/b/APK/com.google.android.youtube?version=$VERSION" \
  -O youtube.apk --user-agent="Mozilla/5.0"
echo "Done: $(du -h youtube.apk)"
