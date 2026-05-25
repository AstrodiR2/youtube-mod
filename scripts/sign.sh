#!/bin/bash
keytool -genkey -v -keystore signing.jks -alias mod -keyalg RSA \
  -keysize 2048 -validity 10000 \
  -dname "CN=YTMod, OU=Mod, O=Mod, L=City, S=State, C=US" \
  -storepass modpass -keypass modpass -noprompt

zipalign -v 4 youtube_modded_unsigned.apk youtube_modded_aligned.apk

apksigner sign --ks signing.jks --ks-pass pass:modpass \
  --key-pass pass:modpass --out youtube_modded.apk youtube_modded_aligned.apk

echo "Signed: $(du -h youtube_modded.apk)"
