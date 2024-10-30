function set-env --description 'set environment variable'
    set -g -x $argv[1] $argv[2]
end
