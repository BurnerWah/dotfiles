function pnpm
    if command -qs npq-hero
        set -lx NPQ_PKG_MGR pnpm
        npq-hero $argv
    else
        command pnpm $argv
    end
end
