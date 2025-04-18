function clang++ -d 'The Clang C, C++, and Objective-C compiler'
    if set -l clang (command -s clang++ | path resolve | path basename)
        if [ $clang = ccache ]
            command clang++ $argv
        else if command -q sccache
            sccache clang++ $argv
        else if command -q ccache
            ccache clang++ $argv
        else
            command clang++ $argv
        end
    else
        # clang++ isn't installed
        fish_command_not_found clang++
    end
end
