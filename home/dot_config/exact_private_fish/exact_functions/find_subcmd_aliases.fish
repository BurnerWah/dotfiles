function find_subcmd_aliases
    for i in (carapace $argv[1] export $argv '' | jq -r .values[].value)
        $argv $i --help | rg --context 1 Alias
    end
end
