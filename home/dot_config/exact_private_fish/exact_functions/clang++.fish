set -l desc "The Clang C, C++, and Objective-C compiler"
if command -qs clang++
    if string match -vq '*/ccache' (path resolve (command -s clang++))
        if command -qs sccache
            function clang++ -d $desc
                command sccache clang++ $argv
            end
        else if command -qs ccache
            function clang++ -d $desc
                command ccache clang++ $argv
            end
        end
    else
        function clang++ -d $desc
            command clang++ $argv
        end
    end
end
