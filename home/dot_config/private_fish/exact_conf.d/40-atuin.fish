if status is-interactive
    and command -qs atuin
    atuin init --disable-up-arrow fish | source
end
