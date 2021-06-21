#!/usr/bin/env bash
if [[ $# -eq 0 ]]; then
	echo -e "No parameters found. "
	exit 1
fi
FILE=$1

while read PICTURE_URL; do
	CODE_RESPONSE=$(curl --write-out '%{http_code}' --silent --output /dev/null $PICTURE_URL)
	xbase=${PICTURE_URL##*/}
	PREF=${xbase%.*}
	FEXT=${xbase##*.}
	if [ ! -d ./"$FEXT" ]; then
	mkdir -p ./"$FEXT"
	fi
	curl $PICTURE_URL -o ./"$FEXT"/"$PREF"-"$CODE_RESPONSE"."$FEXT"
done < $FILE