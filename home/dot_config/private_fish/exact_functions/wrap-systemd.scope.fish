# Old wrapper to run things in a systemd scope
# Kinda unnecessary now that my laptop has more memory
# Also the UUID generation is cursed
function wrap-systemd.scope
    systemd-run --user --scope --same-dir --no-block --quiet --collect --unit $argv[1](string replace -a -- - '' < /proc/sys/kernel/random/uuid) $argv[2..-1]
end