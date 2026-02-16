function list_filter_if -d "filter a list on some condition" -a filter
    while read -l input
        if eval $filter
            echo $input
        end
    end
end
