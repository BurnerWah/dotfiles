function _dotnet_suggest_completer -d "Complete with dotnet-suggest" \
    -a program
    if command -qs dotnet-suggest
        and set -l program_path (command -s $program)
        dotnet-suggest get --executable $program_path -- "$(commandline -pc)"
    else
        return 1
    end
end
