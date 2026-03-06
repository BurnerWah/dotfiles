switch (__fish_uname)
    case Darwin
        complete -c c++ -w clang++
    case "*"
        complete -c c++ -w g++
end
