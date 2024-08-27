function npm
    if command -qs npq
        and contains -- $argv[1] add i in ins inst insta instal install
        set -lx MARSHALL_DISABLE_MAINTAINERS_EXPIRED_EMAILS 1
        set -lx MARSHALL_DISABLE_PROVENANCE 1
        npq $argv
    else
        command npm $argv
    end
end
