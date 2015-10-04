#!/bin/bash

for i in $*
do

    EXIFDATE=`exiftool -s3 -DateTimeOriginal $i`
    YEAR=${EXIFDATE:0:4}
    # YEAR="2013"
    echo "Year: $YEAR"
    WATERMARKFILE="/Users/iain/Pictures/watermarks/Soulflyer$YEAR.png"
    if [[ ! -f $WATERMARKFILE ]]
    then
        echo "Creating watermark: $YEAR"
        /Users/iain/bin/create-watermark.sh $YEAR
    fi

    INSTRUCTIONS=`exiftool -s3 -SpecialInstructions $i`
    if [[ -z $INSTRUCTIONS ]]
    then
        INSTRUCTIONS="BR30S18X4Y4"
    fi
    WIDTH=`exiftool -s3 -ImageWidth $i`
    HEIGHT=`exiftool -s3 -ImageHeight $i`

    echo `basename $i`

    echo $WIDTH
    echo $HEIGHT
    echo $INSTRUCTIONS

    CORNER=${INSTRUCTIONS:0:2}
    case $CORNER in
        TL)
            CORNER="northwest"
            ;;
        TR)
            CORNER="northeast"
            ;;
        BL)
            CORNER="southwest"
            ;;
        *)
            CORNER="southeast"
            ;;
    esac
    # Reads the first 2 chars and turns them into a gravity parameter for imagemagick
    echo "gravity: " $CORNER

    INSTRUCTIONS=${INSTRUCTIONS:2}
    # Chops of the letters at the front leaving this: 31S22X2Y2

    OPACITY="${INSTRUCTIONS%%[^[:digit:]]*}"
    # read the digits at the begining of INSTRUCTIONS
    echo "Opacity: " $OPACITY
    INSTRUCTIONS=${INSTRUCTIONS:${#OPACITY}}

    while [ ${#INSTRUCTIONS} -gt 0 ]
    do
        KEY=${INSTRUCTIONS:0:1}
        INSTRUCTIONS=${INSTRUCTIONS:1}
        NUMBER="${INSTRUCTIONS%%[^[:digit:]]*}"
        INSTRUCTIONS=${INSTRUCTIONS:${#NUMBER}}
        case $KEY in
            S)
                SIZE=$NUMBER
                echo "Size: " $SIZE
                ;;
            X)
                XOFFSET=$NUMBER
                echo "X: " $XOFFSET
                ;;
            Y)
                YOFFSET=$NUMBER
                echo "Y: " $YOFFSET
                ;;
            *)
                echo "bye"
                ;;
        esac
    done

    # Convert the offsets to pixels
    XOFFSET=$(( $XOFFSET * $WIDTH / 100 ))
    YOFFSET=$(( $YOFFSET * $HEIGHT / 100 ))

    WIDTH=$(($WIDTH * $SIZE / 100))
    HEIGHT=$(($HEIGHT * $SIZE / 100))

    echo "W: " $WIDTH "H: " $HEIGHT "X: " $XOFFSET "Y: " $YOFFSET

    echo "Res: " $RES

    COMMAND="/opt/local/bin/composite -dissolve $OPACITY -gravity $CORNER -geometry ${WIDTH}x$HEIGHT+$XOFFSET+$YOFFSET $WATERMARKFILE $i $i"

    echo $COMMAND
    $COMMAND

done
