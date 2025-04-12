if command -q eza
    function ls --wraps=eza --description 'List contents of directory'
        if isatty stdout
            eza $argv
        else
            command ls --color=auto $argv
        end
    end
else if [ -r $__fish_data_dir/functions/ls.fish ]
    # @fish-lsp-disable-next-line 1004
    source $__fish_data_dir/functions/ls.fish
end
