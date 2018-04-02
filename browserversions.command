#!/usr/bin/env bash

## Firefox ESR or mainline?
if [ -d "/Applications/Firefox.app" ]; then
    Type=$(awk -F'-' '/SourceRepository/{print $NF}' /Applications/Firefox.app/Contents/Resources/application.ini)
else
    Type="N/A"
fi

case "$Type" in
    esr*)
    result="Firefox ESR" ;;
    release)
    result="Firefox Mainline" ;;
    N/A)
    result="Not Installed" ;;
    *)
    result="Unknown" ;;
esac

echo "$result version"

printf `defaults read /Applications/Firefox.app/Contents/Info CFBundleShortVersionString` && echo
printf 'Chrome Version:' && echo
printf `defaults read /Applications/Google\ Chrome.app/Contents/Info CFBundleShortVersionString` && echo
printf 'Safari Version:' && echo
printf `defaults read /Applications/Safari.app/Contents/Info CFBundleShortVersionString` && echo
printf 'Opera Version:' && echo
printf `defaults read /Applications/Opera.app/Contents/Info CFBundleShortVersionString` && echo