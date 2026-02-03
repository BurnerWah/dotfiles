# This is in the output of `carapace _carapace fish`, last generated on version v1.6.1
function _carapace_completer
    set --local --export CARAPACE_SHELL fish
    set --local --export CARAPACE_SHELL_BUILTINS (builtin --names)
    set --local --export CARAPACE_SHELL_FUNCTIONS (functions --all)
    set --local data
    IFS='' set data (echo (commandline -cp)'' | sed "s/ \$/ ''/" | xargs carapace $argv[1] fish 2>/dev/null)
    if [ $status -eq 1 ]
        IFS='' set data (echo (commandline -cp)"'" | sed "s/ \$/ ''/" | xargs carapace $argv[1] fish 2>/dev/null)
        if [ $status -eq 1 ]
            IFS='' set data (echo (commandline -cp)'"' | sed "s/ \$/ ''/" | xargs carapace $argv[1] fish 2>/dev/null)
        end
    end
    echo $data
end
