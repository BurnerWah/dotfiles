# Quick thing thrown together to sync some stuff to my phone
# I'll eventually rewrite it in a different programming language
#
# Also it uses `gio copy` for speed when interacting with MTP,
function lollypop-sync-lyrics --description 'Sync .lrc files to a MTP device managed by lollypop' --argument music_folder
    pushd ~/Music
    set -l albums (gio list "$music_folder" | string match -v .thumbnails | string match -v unsync | string match -v lollypop-sync.db | sort)
    for album in $albums
        set -l path_guess (string replace _ / $album)
        echo $path_guess
        # fzf is much more likely to get the right path than fd
        set -l fuzzy_path (fzf --walker=dir --filter="$path_guess")
        if test -n "$fuzzy_path"
            and test -d "$fuzzy_path"
            pushd $fuzzy_path
            if test (count *.lrc) -gt 0
                gio copy -p *.lrc "$music_folder/$album"
            end
            popd
        end
    end
    popd
end
