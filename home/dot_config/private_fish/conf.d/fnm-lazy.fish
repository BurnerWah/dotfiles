status is-interactive || exit 0

command -qs fnm || exit 0

function _fnm_autoload_hook --description 'Change Node version on directory change' --on-variable PWD
    status --is-command-substitution; and return
    if test -f .node-version -o -f .nvmrc
        fnm env --use-on-cd | source
        fnm use --silent-if-unchanged
    end
end
