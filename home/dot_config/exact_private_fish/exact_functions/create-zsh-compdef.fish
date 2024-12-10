function create-zsh-compdef -d "Generate a compdef for usage in zsh"
    echo "#compdef $argv[1]
# shellcheck disable=SC1090
source <($argv)" >"_$argv[1]"
end
