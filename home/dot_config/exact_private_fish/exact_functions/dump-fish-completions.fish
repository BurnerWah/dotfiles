function dump-fish-completions
    fd -efish . \
        $__fish_data_dir/completions \
        $__fish_config_dir/completions \
        (path filter -d $__fish_vendor_completionsdirs) \
        -X echo {/.} \
        | string split ' ' \
        | string match -v '_*' \
        | string match -vr '^(\[|echo|test|umask)$' \
        | sort -u
end
