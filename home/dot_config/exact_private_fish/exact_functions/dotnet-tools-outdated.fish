function dotnet-tools-outdated
    if set -q DOTNET_CLI_HOME
        command dotnet-tools-outdated --globalToolsPath $DOTNET_CLI_HOME/.dotnet/tools/.store $argv
    else
        command dotnet-tools-outdated $argv
    end
end
