function __carapace_callback -a cmd -d 'generic carapace completion callback'
    commandline -cp | sed "s/\$/"(__carapace_quote_suffix)"/" | sed "s/ \$/ ''/" | xargs carapace $cmd fish
end
