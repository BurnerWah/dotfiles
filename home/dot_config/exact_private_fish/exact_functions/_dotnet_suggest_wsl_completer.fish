function _dotnet_suggest_wsl_completer -d "Complete with dotnet-suggest (for windows)" \
    -a program
    if command -qs dotnet-suggest.exe
        and set -l program_path (command -s $program)
        set -l host_program_path (wslpath -w $program_path)
        dotnet-suggest.exe get --executable $host_program_path -- "$(commandline -pc)" | string trim -r
    else
        return 1
    end
end
