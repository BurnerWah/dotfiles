# Faster, more accurate __fish_print_modules
function __fish_print_modules
    find /lib/modules/(uname -r)/{kernel,extra,misc} -type f 2>/dev/null | if command -q rg
        rg '/.*/|\.ko.*' -r ''
    else # fall back to `sed` implementation, as fish builtins don't seem to work in this block
        sed -e 's$/.*/\([^/.]*\).*$\1$'
    end
end
