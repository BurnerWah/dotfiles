# Eventually this should be reworked to be derived from a template
use platform

set edit:command-abbr['l'] = 'ls'
set edit:command-abbr['sl'] = 'ls'
set edit:command-abbr['dc'] = 'cd'
set edit:command-abbr['cls'] = 'clear'
set edit:command-abbr['dog'] = 'doggo'
set edit:command-abbr['exa'] = 'eza'
set edit:command-abbr['diff'] = 'delta'
set edit:command-abbr['cat'] = 'bat'
set edit:command-abbr['batp'] = 'bat -p'
set edit:command-abbr['find'] = 'fd'
set edit:command-abbr['grep'] = 'rg'
set edit:command-abbr['vi'] = 'nvim'
set edit:command-abbr['vim'] = 'nvim'
set edit:command-abbr['gdl'] = 'gallery-dl'
set edit:command-abbr['ydl'] = 'yt-dlp'
set edit:command-abbr['ydlmp3'] = 'yt-dlp -x --audio-format mp3'

if (eq $platform:os "darwin") {
    set edit:command-abbr['wl-copy'] = 'pbcopy'
    set edit:command-abbr['wlcp'] = 'pbcopy'
    set edit:command-abbr['wl-paste'] = 'pbpaste'
    set edit:command-abbr['wlp'] = 'wl-paste'
}
