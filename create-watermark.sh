#! /bin/bash

LOGO_FADE=0.55
NAME_FADE=1
#: ${YEAR="2013"}
PARAM=$1
YEAR=${PARAM:-1958}
LOGO="Soulflyer"
NAME="Iain Wood"
LOGO_OFFSET=5
NAME_OFFSET=4
SHADOW_BLUR=2
LOGO_FONTSIZE=144
NAME_FONTSIZE=54
LOGO_X=10
LOGO_Y=140
NAME_X=50
NAME_Y=204
YEAR_X=480
FONT_NAME="Papyrus"
FONT_STYLE="Expanded"

LOGO_BLACK_X=$(($LOGO_X + $LOGO_OFFSET))
LOGO_BLACK_Y=$(($LOGO_Y + $LOGO_OFFSET))
NAME_BLACK_X=$(($NAME_X + $NAME_OFFSET))
NAME_BLACK_Y=$(($NAME_Y + $NAME_OFFSET))
YEAR_BLACK_X=$(($YEAR_X + $NAME_OFFSET))

/opt/local/bin/convert -size 620x220 xc:transparent -font $FONT_NAME -stretch $FONT_STYLE\
    -pointsize $LOGO_FONTSIZE -fill black\
           -draw "fill-opacity $LOGO_FADE text $LOGO_BLACK_X,$LOGO_BLACK_Y '$LOGO'"\
    -pointsize $NAME_FONTSIZE\
           -draw "text $NAME_BLACK_X,$NAME_BLACK_Y '© $NAME'"\
           -draw "text $YEAR_BLACK_X,$NAME_BLACK_Y '$YEAR'"\
           -channel RGBA -gaussian 0x$SHADOW_BLUR\
    -pointsize $LOGO_FONTSIZE -fill white\
           -draw "fill-opacity $LOGO_FADE text $LOGO_X,$LOGO_Y '$LOGO'" \
    -pointsize $NAME_FONTSIZE\
           -draw "fill-opacity $NAME_FADE text $NAME_X,$NAME_Y '© $NAME'"\
           -draw "fill-opacity $NAME_FADE text $YEAR_X,$NAME_Y '$YEAR'"\
           ~/Pictures/Watermarks/$LOGO$YEAR.png

# display ~/Pictures/Watermarks/$LOGO$YEAR.png

# composite -dissolve 50 -gravity southeast /tmp/font_shadow.png /tmp/IMG_6147.jpg -alpha set /tmp/watermarked.jpg

# composite -dissolve 14 -gravity southeast -geometry +30+30 /tmp/font_shadow.png ~/Pictures/Published/fullsize/2013/06/06-Julia/IMG_6732.jpg -alpha set /tmp/watermarked

# composite -dissolve 18 -gravity southeast -geometry +30+30 \\( font_shadow.png -resize 640x \\)  ~/Pictures/Published/fullsize/2013/06/06-Julia/IMG_6732.jpg -alpha set /tmp/watermarked
