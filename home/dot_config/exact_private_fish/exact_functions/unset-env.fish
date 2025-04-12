function unset-env --description 'unset environment variable'
    # @fish-lsp-disable-next-line 3003
    set -e $argv[1]
end
