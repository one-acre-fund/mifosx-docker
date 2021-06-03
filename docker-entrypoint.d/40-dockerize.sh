#!/bin/sh

FILE=$(find /usr/share/nginx/html/main.*.js)
TMPFILE=/tmp/file
dockerize -delims "<YJ:YJ>" -template "$FILE:$TMPFILE"
cp "$TMPFILE" "$FILE"
