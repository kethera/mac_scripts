#!/usr/bin/env bash

## Test for Firefox
get_firefox_version()
{
if [ -e /Applications/Firefox.app ]
	then
	## If Firefox is found in the /Apps dir run the test for ESR or Mainline:	
		if [ -d "/Applications/Firefox.app" ]
			then
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
		## We put the version info in a variable and give it to the user
		ffxversion=`defaults read /Applications/Firefox.app/Contents/Info CFBundleShortVersionString`
		printf "$result found.\n\tVersion: $ffxversion\n\n"
	
	else
		echo "Firefox not found in /Applications/ -- moving on...\n"
fi
}

get_chrome_version()
{
if [ -e /Applications/Firefox.app ]
	then
		chromeversion=`defaults read /Applications/Google\ Chrome.app/Contents/Info CFBundleShortVersionString`
		printf "Chrome found.\n\tVersion: $chromeversion\n\n"
	else
		printf "Chrome not found in /Applications/ -- moving on...\n"
fi	
}

get_safari_version()
{
if [ -e /Applications/Safari.app ]
	then
		safariversion=`defaults read /Applications/Safari.app/Contents/Info CFBundleShortVersionString`
		printf "Safari found.\n\tVersion: $safariversion\n\n"
	else
		printf "Safari not found in /Applications/ -- moving on...\n"
fi
}

get_opera_version()
{
if [ -e /Applications/Opera.app ]
	then
		operaversion=`defaults read /Applications/Opera.app/Contents/Info CFBundleShortVersionString`
		printf "Opera found.\n\tVersion: $operaversion\n\n"
	else
		printf "Opera not found in /Applications/ -- moving on...\n"
fi
}


## MAIN SCRIPT:
printf "Detecting browsers on system:\n\n"
get_firefox_version
get_chrome_version
get_safari_version
get_opera_version
printf "\n\nFinished\n\n"