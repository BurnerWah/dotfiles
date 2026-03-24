use path
use platform

var modsrc = (src)
var common-abbrevjson = (path:join $modsrc[name] .. common-abbrevs.json)
var common-abbrevs = (from-json < $common-abbrevjson)

keys $common-abbrevs | peach {|name|
  set edit:command-abbr[$name] = $common-abbrevs[$name]
}

if (eq $platform:os "darwin") {
  set edit:command-abbr['wl-copy'] = 'pbcopy'
  set edit:command-abbr['wlcp'] = 'pbcopy'
  set edit:command-abbr['wl-paste'] = 'pbpaste'
  set edit:command-abbr['wlp'] = 'pbpaste'
}
