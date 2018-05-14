#usr/bin/sh env bash

if [ -e /Applications/GitHub\ Desktop.app ] && [ -e /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang ]
	then
		githubversion=$(/usr/bin/git --version | awk '{print $3}')
		## comment the below line to make this a tool for extension attributes or library use
	printf "GitHub version $githubversion found.\n"
fi