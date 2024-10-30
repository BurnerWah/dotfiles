if status is-interactive
    and command -qs shadowenv
    shadowenv init fish | source
end
