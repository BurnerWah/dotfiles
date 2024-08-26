if status is-interactive
    and command -qs vivid
    set -gx LS_COLORS (vivid generate snazzy)
end
