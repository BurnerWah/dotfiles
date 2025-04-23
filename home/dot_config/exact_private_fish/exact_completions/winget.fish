function _winget_completion
    winget.exe complete --word (commandline -pct) --commandline (commandline -p) --position (commandline -pc | string length) | string trim -r
end

complete -c winget -x -a '(_winget_completion)'
