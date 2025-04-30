# This has been modified to not use sed
function __carapace_callback -a cmd -d 'generic carapace completion callback'
    commandline -cp | string replace -r '$' (__carapace_quote_suffix) | string replace -r ' $' " ''" | xargs carapace $cmd fish
    # commandline -cp | sed "s/\$/"(__carapace_quote_suffix)"/" | sed "s/ \$/ ''/" | xargs carapace $cmd fish
end
