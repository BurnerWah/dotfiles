# Nushell Environment Config File

def create_left_prompt [] {
    let home =  $nu.home-path

    # Perform tilde substitution on dir
    # To determine if the prefix of the path matches the home dir, we split the current path into
    # segments, and compare those with the segments of the home dir. In cases where the current dir
    # is a parent of the home dir (e.g. `/home`, homedir is `/home/user`), this comparison will 
    # also evaluate to true. Inside the condition, we attempt to str replace `$home` with `~`.
    # Inside the condition, either:
    # 1. The home prefix will be replaced
    # 2. The current dir is a parent of the home dir, so it will be uneffected by the str replace
    let dir = (
        if ($env.PWD | path split | zip ($home | path split) | all { $in.0 == $in.1 }) {
            ($env.PWD | str replace $home "~")
        } else {
            $env.PWD
        }
    )

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
    let path_segment = $"($path_color)($dir)"

    $path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
}

def create_right_prompt [] {
    # create a right prompt in magenta with green separators and am/pm underlined
    let time_segment = ([
        (ansi reset)
        (ansi magenta)
        (date now | format date '%x %X %p') # try to respect user's locale
    ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
        str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

    ([$last_exit_code, (char space), $time_segment] | str join)
}

def get-env [name] { $env | get $name }
def set-env [name, value] { load-env { $name: $value } }
def unset-env [name] { hide-env $name }

# Parse various command outputs with jc
def "from jc" [parser: string] {
    # Eventually, when update columns is available, this will be replaced
    # command-specific parsers.
    jc $"--($parser)" | from json
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
# FIXME: This default is not implemented in rust code as of 2023-09-08.
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# If you want previously entered commands to have a different prompt from the usual one,
# you can uncomment one or more of the following lines.
# This can be useful if you have a 2-line prompt and it's taking up a lot of space
# because every command entered takes up 2 lines instead of 1. You can then uncomment
# the line below so that previously entered commands show with a single `🚀`.
# $env.TRANSIENT_PROMPT_COMMAND = {|| "🚀 " }
# $env.TRANSIENT_PROMPT_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = {|| "" }
# $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| "" }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded

# common conversions
let convert_env = {
    intbool: {
        from_string: { |s| $s | into bool }
        to_string: { |v| $v | into int |  into string }
    }
    # This is for variables which, if set, are true
    setbool: {
        from_string: { |s| $s | str length | into bool }
        to_string: { |v| $v | if $v { "1" } else { "" } }
    }
    int: {
        from_string: { |s| $s | into int }
        to_string: { |v| $v | into string }
    }
    # This one was used by default for PATH and Path
    paths: {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

$env.ENV_CONVERSIONS = {
    # A lot of these are based on 
    _ZO_ECHO: $convert_env.intbool
    _ZO_RESOLVE_SYMLINKS: $convert_env.intbool
    CARAPACE_ENV: $convert_env.intbool
    CARAPACE_HIDDEN: $convert_env.intbool
    CARAPACE_LENIENT: $convert_env.intbool
    CARAPACE_LOG: $convert_env.intbool
    DO_NOT_TRACK: $convert_env.setbool
    GHCUP_USE_XDG_DIRS: $convert_env.setbool
    GIT_CONFIG_NOSYSTEM: $convert_env.intbool
    INFOPATH: $convert_env.paths
    KITTY_PID: $convert_env.int
    KITTY_WINDOW_ID: $convert_env.int
    MallocNanoZone: $convert_env.int
    MANCOLOR: $convert_env.setbool
    MANPATH: $convert_env.paths
    NO_COLOR: $convert_env.intbool
    NODE_DISABLE_COLORS: $convert_env.intbool
    NODE_NO_WARNINGS: $convert_env.intbool
    NODE_PATH: $convert_env.paths
    NODE_PENDING_DEPRECATION: $convert_env.intbool
    NODE_SKIP_PLATFORM_CHECK: $convert_env.intbool
    NODE_TLS_REJECT_UNAUTHORIZED: $convert_env.intbool
    Path: $convert_env.paths
    PATH: $convert_env.paths
    SHLVL: $convert_env.int
    VSCODE_INJECTION: $convert_env.setbool
    WINDOWID: $convert_env.int
    XDG_CONFIG_DIRS: $convert_env.paths
    XDG_DATA_DIRS: $convert_env.paths
}

# I need to sort out a better way of loading nupm
# $env.NUPM_HOME = ($env.XDG_DATA_HOME | path join "nupm")

# Directories to search for scripts when calling source or use
$env.NU_LIB_DIRS = [
    # FIXME: This default is not implemented in rust code as of 2023-09-06.
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
    ($nu.default-config-dir | path join 'modules')
    # ($env.NUPM_HOME | path join "modules")
]

# Directories to search for plugin binaries when calling register
$env.NU_PLUGIN_DIRS = [
    # FIXME: This default is not implemented in rust code as of 2023-09-06.
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

$env.STARSHIP_SHELL = "nu"
