switch (__fish_uname)
    case Darwin
        complete -c cc -w clang
    case "*"
        complete -c cc -w gcc
end
