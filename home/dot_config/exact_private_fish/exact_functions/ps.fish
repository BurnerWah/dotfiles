function ps -d "Information about running processes" --wraps=ps
    if isatty stdout && command -q grc
        grc ps $argv
    else
        command ps $argv
    end
end
