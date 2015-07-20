#!/bin/sh
asterisk -rx "sip show peers"|
cut -f1 -d/ | grep -P '\d\d\d\d' |
grep -vP '(UNKNOWN|Unmonitored)' |
while read PEER
do
    asterisk -rx "sip show peer ${PEER}" |
    grep -P "(Useragent|Contacti|Username)"
    echo "===="
done
