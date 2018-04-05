#!/usr/bin/env bash
###################
##
## Mac Browser Detector and Version checker 
## Created by Michael Goralski on 5 April 2018
## Last edited 5 April 2018
##
####################

## FUNCTION DEFINITIONS

show_firefox_version()
{
if [ -e /Applications/Firefox.app ] ## Test for Firefox
	then ## If Firefox is found in the /Apps dir run the test for ESR or Mainline:	
		Type=$(awk -F'-' '/SourceRepository/{print $NF}' /Applications/Firefox.app/Contents/Resources/application.ini)	## Get and format a string from the app container
		case "$Type" in ## Transform that string into text to output later to the user
    		esr*)
    		result="Firefox ESR" ;;
    		release)
    		result="Firefox Mainline" ;;
    		*)
    		result="Unknown" ;;
		esac
	## We put the version info, which is in the same place no matter which flavor, in a variable and give it to the user
	ffxversion=`defaults read /Applications/Firefox.app/Contents/Info CFBundleShortVersionString`
	printf "$result found.\n\tVersion: $ffxversion\n\n"
	
	else
	   	printf "Firefox not found in /Applications/ -- moving on...\n\n"
fi
}


show_chrome_version()
{
if [ -e /Applications/Google\ Chrome.app ]
	then
		chromeversion=`defaults read /Applications/Google\ Chrome.app/Contents/Info CFBundleShortVersionString`
		printf "Chrome found.\n\tVersion: $chromeversion\n\n"
	else
		printf "Chrome not found in /Applications/ -- moving on...\n\n"
fi	
}

show_safari_version()
{
if [ -e /Applications/Safari.app ]
	then
		safariversion=`defaults read /Applications/Safari.app/Contents/Info CFBundleShortVersionString`
		printf "Safari found.\n\tVersion: $safariversion\n\n"
	else
		printf "Safari not found in /Applications/ -- how did you do that?\n\n"
fi
}

show_opera_version()
{
if [ -e /Applications/Opera.app ]
	then
		operaversion=`defaults read /Applications/Opera.app/Contents/Info CFBundleShortVersionString`
		printf "Opera found.\n\tVersion: $operaversion\n\n"
	else
		printf "Opera not found in /Applications/ -- moving on...\n\n"
fi
}


## MAIN SCRIPT:
printf "Detecting browsers on system:\n\n"
show_firefox_version
show_chrome_version
show_safari_version
show_opera_version
printf "Finished\n\n"