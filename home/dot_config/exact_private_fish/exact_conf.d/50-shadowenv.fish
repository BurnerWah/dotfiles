if status is-interactive
    and command -q shadowenv
    shadowenv init fish | source
end
