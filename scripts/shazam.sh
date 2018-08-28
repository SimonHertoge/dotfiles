#!/bin/sh
RECORD_FILE="pulse_record.wav"
RECORD_FOLDER="/tmp/shazam_on_linux"

if [ ! -e $RECORD_FOLDER ]
then
  mkdir $RECORD_FOLDER
fi

# Remove already recorded file if it exists
if [ -e ${RECORD_FOLDER}/${RECORD_FILE} ]
then
  rm ${RECORD_FOLDER}/${RECORD_FILE}
fi

# timeout 5 arecord -c 2 -f S32_LE -r 48000 -D loopout ${RECORD_FOLDER}/${RECORD_FILE} > /dev/null 2>&1
timeout 5 parecord -d reverse-stereo.monitor ${RECORD_FOLDER}/${RECORD_FILE} > /dev/null 2>&1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
python2 ${DIR}/libs/identify_sound.py -s ${RECORD_FOLDER}/${RECORD_FILE} -c libs/shazam.conf

