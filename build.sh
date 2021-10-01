#!/bin/bash

set -e

VERSION=$(python -c "import json; j=json.load(open('manifest.json', 'r'));print j['version']")
ZIPFILE="stayingalive_$VERSION.zip"

rm "$ZIPFILE"

find js -not -name "*~" -type f -print | zip $ZIPFILE -@
find fonts -not -name "*~" -type f -print | zip $ZIPFILE -@
find img -not -name "*~" -type f -print | zip $ZIPFILE -@
find css -not -name "*~" -type f -print | zip $ZIPFILE -@
zip $ZIPFILE beep.wav manifest.json popup.html settings.html

rm -rf testunpack
mkdir -p testunpack
pushd testunpack
unzip "../$ZIPFILE"
popd
