# Stuff fish needs to have a working completion engine
# Based on system config.fish, but with some modifications

# Grab extra directories (as specified by the build process, usually for
# third-party packages to ship completions &c.
set -l __extra_completionsdir
set -l __extra_functionsdir
set -l __extra_confdir
if test -f $__fish_data_dir/__fish_build_paths.fish
    source $__fish_data_dir/__fish_build_paths.fish
end

# Compute the directories for vendor configuration.  We want to include
# all of XDG_DATA_DIRS, as well as the __extra_* dirs defined above.
set -l xdg_data_dirs
if set -q XDG_DATA_DIRS
    set --path xdg_data_dirs $XDG_DATA_DIRS
    set xdg_data_dirs (string replace -r '([^/])/$' '$1' -- $xdg_data_dirs)/fish
else
    set xdg_data_dirs $__fish_data_dir
end

set -g __fish_vendor_completionsdirs
set -g __fish_vendor_functionsdirs
set -g __fish_vendor_confdirs

# We don't really need the stuff for fish's unit tests

# Set up function and completion paths. Make sure that the fish
# default functions/completions are included in the respective path.

if not set -q fish_function_path
    # The user's custom functions are excluded because they just... aren't really needed
    set fish_function_path $__fish_sysconf_dir/functions $__fish_vendor_functionsdirs $__fish_data_dir/functions
else if not contains -- $__fish_data_dir/functions $fish_function_path
    set -a fish_function_path $__fish_data_dir/functions
end

if not set -q fish_complete_path
    # The user's custom completions are excluded form this to prevent carapace calling itself
    set fish_complete_path $__fish_sysconf_dir/completions $__fish_vendor_completionsdirs $__fish_data_dir/completions $__fish_user_data_dir/generated_completions
else if not contains -- $__fish_data_dir/completions $fish_complete_path
    set -a fish_complete_path $__fish_data_dir/completions
end
