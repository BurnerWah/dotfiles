# Modified function from carapace
function unset-env -d 'unset environment variable' -a name
    set -e "$name"
end
