#!/bin/bash

if [ -f /tmp/log.txt ]; then
	rm -f /tmp/log.txt
fi

cd py-brain-inventory
git log --pretty=format:user:%aN%n%ct --reverse --raw --encoding=UTF-8 --no-renames --no-show-signature > /tmp/log.txt
cd ..

#Staff
if [[ "$OSTYPE" == *"darwin"* ]]; then
       sed -i '' 's|Ivan E. Cao-Berg|Ivan|g' /tmp/log.txt
       sed -i '' 's|icaoberg|Ivan|g' /tmp/log.txt
       sed -i '' 's|Ivan Cao-Berg|Ivan|g' /tmp/log.txt
       sed -i '' 's|eduardo.figueroa7|Eduardo|g' /tmp/log.txt
       sed -i '' 's|Monica Paz Parra|Monica|g' /tmp/log.txt
else
       sed -i 's|Ivan E. Cao-Berg|Ivan|g' /tmp/log.txt
       sed -i 's|icaoberg|Ivan|g' /tmp/log.txt
       sed -i 's|Ivan Cao-Berg|Ivan|g' /tmp/log.txt
       sed -i 's|eduardo.figueroa7|Eduardo|g' /tmp/log.txt
       sed -i 's|Monica Paz Parra|Monica|g' /tmp/log.txt
fi

#students

gource /tmp/log.txt -s 1 --log-format git --stop-at-end --title "py-brain-inventory" \
       --seconds-per-day 5 \
       --user-image-dir images \
       --logo images/logo.png \
       --start-date "2023-06-30" \
       -1280x720 \
       -o - | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 \
       -preset ultrafast -crf 1 -threads 0 -bf 0 output.mp4 \
       2> /dev/null

if [ -f output.log ]; then
	rm -f output.log
fi
