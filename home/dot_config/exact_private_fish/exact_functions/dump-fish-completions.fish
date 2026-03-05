function dump-fish-completions
    set -l fish_ignore_completions \
        alias isatty fish_add_path fish_config fish_delta fish_opt funced \
        funcsave nextd prevd psub pushd set_color
    begin
        fd -efish . \
            $__fish_data_dir/completions \
            $__fish_config_dir/completions \
            (path filter -d $__fish_vendor_completionsdirs) \
            | path basename --no-extension

        echo fish # This is missed somehow
    end | string split ' ' \
        | string match -v '_*' \
        | string match -vr "^($(builtin --names | string match -r '[a-z]+' | string join '|'))\$" \
        | string match -vr '^[!.:_\[]$' \
        | string match -vr "^($(string join '|' $fish_ignore_completions))\$" \
        | sort -u
end
