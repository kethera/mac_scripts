#usr/bin/sh env bash
githubversion=$(/usr/bin/git --version | awk '{print $3}')
## comment the below line to make this a tool for extension attributes or library use
printf "GitHub version $githubversion found.\n"