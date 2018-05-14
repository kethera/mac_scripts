#usr/bin/sh env bash
githubversion=$(/usr/bin/git --version | awk '{print $3}')
## uncomment the below line to make this a tool for reporting to the command line
## printf "GitHub version $githubversion found.\n"