#!/bin/sh

getDefaultSink() {
    defaultSink=$(pactl info | awk -F : '/Default Sink:/{print $2}')
    description=$(pactl list sinks | sed -n "/${defaultSink}/,/Description/s/^\s*Description: \(.*\)/\1/p")
    echo "${description}"
}

getDefaultSource() {
    defaultSource=$(pactl info | awk -F : '/Default Source:/{print $2}')
    description=$(pactl list sources | sed -n "/${defaultSource}/,/Description/s/^\s*Description: \(.*\)/\1/p")
    echo "${description}"
}

show_volume() {
    VOLUME_S=${VOLUME//%}
    if [ $VOLUME_S -eq 0 ]; then 
        echo "🔇 $VOLUME"
    elif [ $VOLUME_S -eq 5 ]; then
        echo "🔈 $VOLUME"
    elif [ $VOLUME_S -lt 30 ]; then 
        echo "🔈 $VOLUME"
    elif [ $VOLUME_S -lt 60 ]; then 
        echo "🔉 $VOLUME"
    else 
        echo "🔊 $VOLUME"
    fi
}

VOLUME=$(pamixer --get-volume-human)
SINK=$(getDefaultSink)
SOURCE=$(getDefaultSource)

if [ $VOLUME = "muted" ]; then
    VOLUME="0%"
fi

case $1 in
    "--up")
        pamixer --increase 5
        ;;
    "--down")
        pamixer --decrease 5
        ;;
    "--mute")
        pamixer --toggle-mute
        ;;
    *)
        # echo "%{F#61afef}VOL%{F-} ${VOLUME}"
        show_volume 
esac

