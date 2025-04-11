if status is-interactive
    and command -q vivid
    set -gx LS_COLORS (vivid generate snazzy)
end
