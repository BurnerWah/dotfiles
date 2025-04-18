# Faster, more accurate, more fish-native __fish_print_modules
function __fish_print_modules
    find /lib/modules/(uname -r)/{kernel,extra,misc} -type f 2>/dev/null | path basename | string replace -r '\.ko(\..*)?$' ''
end
