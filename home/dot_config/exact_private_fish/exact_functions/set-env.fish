# Modified function from carapace
function set-env -d 'set environment variable' -a name -a value
    set -g -x "$name" $value
end
