# use pigz over gzip
if command -q pigz
    function zcat
        pigz -cd $argv
    end
end
