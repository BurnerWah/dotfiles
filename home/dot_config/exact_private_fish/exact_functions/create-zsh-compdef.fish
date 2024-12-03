function create-zsh-compdef -d "Generate a compdef for usage in zsh"
    echo "#compdef $argv[1]
source <($argv)" >"_$argv[1]"
end
