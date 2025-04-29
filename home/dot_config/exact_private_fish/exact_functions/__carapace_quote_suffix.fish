function __carapace_quote_suffix -d 'generic carapace quote helper'
    if not commandline -cp | xargs echo 2>/dev/null >/dev/null
        if commandline -cp | sed 's/$/"/' | xargs echo 2>/dev/null >/dev/null
            echo '"'
        else if commandline -cp | sed "s/\$/'/" | xargs echo 2>/dev/null >/dev/null
            echo "'"
        end
    else
        echo ""
    end
end
