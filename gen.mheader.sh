#!/bin/bash

N=$1
if test "x$N" = "x"; then
    echo "generate mirrored (N/2)x2 header connector."
    echo " # gen.mheader.sh <number of pin>"
    exit 1;
fi

echo "Element(0x00 \"Mirrored header connector\" \"\" \"mheader20_2\" 260 0 3 100 0x00)"
echo "(";
for ((y=1; y<=$N; y+=2)); do
        let Y=($y-1)*50+50;
        let name=$y;
        if test "x$y" = "x1"; then
                echo "        Pin(150 $Y 60 38 \"$name\" 0x101)";
        else
                echo "        Pin(150 $Y 60 38 \"$name\" 0x01)";
        fi
        let name=$y+1;
        echo "         Pin(50 $Y 60 38 \"$name\" 0x01)";
done
echo "        ElementLine(0 0 0 1000 10)"
echo "        ElementLine(0 1000 200 1000 10)"
echo "        ElementLine(200 1000 200 0 10)"
echo "        ElementLine(200 0 0 0 10)"
echo "        ElementLine(200 100 100 100 10)"
echo "        ElementLine(100 100 100 0 10)"
echo "        Mark(150 50)"
echo ")";
