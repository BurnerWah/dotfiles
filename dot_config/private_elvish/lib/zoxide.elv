# zoxide integration
if (has-external zoxide) {
    eval (zoxide init elvish | slurp)
}
