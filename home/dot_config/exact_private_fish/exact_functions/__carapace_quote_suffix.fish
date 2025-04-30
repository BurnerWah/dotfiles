# This has been modified to not use sed, and to simplify thigs a little
function __carapace_quote_suffix -d 'generic carapace quote helper'
    if not commandline -cp | xargs echo &>/dev/null
        if commandline -cp | string replace -r '$' '"' | xargs echo &>/dev/null
            # sed 's/$/"/'
            echo '"'
        else if commandline -cp | string replace -r "\$" "'" | xargs echo &>/dev/null
            # sed "s/\$/'/"
            echo "'"
        end
    else
        echo ""
    end
end
