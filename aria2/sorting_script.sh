#!/bin/sh

# Description:	A simple sorting script that sorts Aria2 downloads
#		into specific folders (creates them if not present)
#		according to file extension.
#
#	[General, Videos, Images, Documents, Compressed, Programs] are the directories
#
# Add this line to aria2.conf to enable sorting:
# on-download-complete=/path/to/sort.sh

FILE_PATH="$3"
if [ -z "$FILE_PATH" ]; then
        exit 0
fi
if [ -d "$FILE_PATH" ]; then
        mv "$FILE_PATH" /aria2/data/General/
        exit 0
fi
FILENAME=$(basename "$FILE_PATH")
EXTENSION="${FILENAME##*.}"
EXTENSION=$(echo "$EXTENSION" | tr '[:upper:]' '[:lower:]')
case "$EXTENSION" in
        mp4|mkv|avi|mov|wmv|flv|webm|m4v|mpg|mpeg|m2ts|ts|vob|3gp|3g2|rmvb|asf|ogv)
		mkdir -p /aria2/data/Videos/
                mv "$FILE_PATH" /aria2/data/Videos/
                ;;
        jpg|jpeg|png|gif|webp|bmp|tiff|tif|svg|raw|heic|psd|ico|cr2|nef)
		mkdir -p /aria2/data/Images/
                mv "$FILE_PATH" /aria2/data/Images/
                ;;
        pdf|doc|docx|xls|xlsx|ppt|pptx|txt|md|csv|rtf|epub|mobi|azw3|odt|ods|odp)
		mkdir -p /aria2/data/Documents/
                mv "$FILE_PATH" /aria2/data/Documents/
                ;;
        zip|rar|7z|tar|gz|bz2|xz|iso|img|vdi|qcow2|tgz|cab|z|lzma)
		mkdir -p /aria2/data/Compressed/
                mv "$FILE_PATH" /aria2/data/Compressed/
                ;;
        exe|msi|apk|dmg|deb|rpm|py|js|html|css|c|cpp|java|sh|yaml|yml|json|bat|ps1|bin|run|appimage)
		mkdir -p /aria2/data/Programs/
                mv "$FILE_PATH" /aria2/data/Programs/
                ;;
        *)
		mkdir -p /aria2/data/General/
                mv "$FILE_PATH" /aria2/data/General/
                ;;
esac
