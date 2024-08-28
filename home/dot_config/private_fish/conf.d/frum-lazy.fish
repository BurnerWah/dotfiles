status is-interactive || exit 0
command -qs frum || exit 0

function _frum_autoload_hook --description 'Change Ruby version on directory change' --on-variable PWD
    status --is-command-substitution; and return
    if test -f .ruby-version
        frum init | source
        frum --log-level quiet local
    end
end
