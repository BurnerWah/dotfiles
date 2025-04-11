# use pigz over gzip
if command -q pigz
    function zcat
        command pigz -cd $argv
    end
end
