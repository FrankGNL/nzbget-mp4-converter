#!/bin/sh

mkdir -p /config/scripts

mv -n /tmp/sickbeard_mp4_automator /config/scripts/
mv -n /tmp/nzbToMedia /config/scripts/
mv -n /tmp/VideoSort /config/scripts/

mv -n /config/scripts/sickbeard_mp4_automator/autoProcess.ini.sample /config/scripts/sickbeard_mp4_automator/autoProcess.ini

touch /config/nzbget.log

sed -i -e "s#\(MainDir=\).*#\1/data#g" /nzbget/nzbget.conf
sed -i -e "s#\(ScriptDir=\).*#\1/config/scripts#g" /nzbget/nzbget.conf
sed -i -e "s#\(LogFile=\).*#\1/config/nzbget.log#g" /nzbget/nzbget.conf

cp /nzbget/nzbget.conf /config/nzbget.conf

/nzbget/nzbget -c /config/nzbget.conf -D
tail -f /config/nzbget.log
