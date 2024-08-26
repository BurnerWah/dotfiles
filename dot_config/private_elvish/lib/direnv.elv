if (has-external direnv) {
    eval (direnv hook elvish | slurp)
}
