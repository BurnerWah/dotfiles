use platform
# direnv doesn't work correctly on Windows
# https://github.com/direnv/direnv/issues/442
if (and (has-external direnv) $platform:is-unix) {
    eval (direnv hook elvish | slurp)
}
