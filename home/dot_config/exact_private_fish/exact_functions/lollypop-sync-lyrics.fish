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
        if test (fd -elrc -p "$path_guess" | count) -gt 0
            set -l path_actual (fd -td -p "$path_guess")
            test -n "$path_actual" || continue
            pushd $path_actual
            gio copy -p *.lrc "$music_folder/$album"
            popd
        end
    end
    popd
end
