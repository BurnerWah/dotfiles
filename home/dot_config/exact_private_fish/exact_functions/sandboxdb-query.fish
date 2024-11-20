function sandboxdb-query --description 'Query sandboxdb.org' --argument service
    # Cache queries if possible
    if command -qs bkt
        bkt --ttl 1h -- curl -s https://sandboxdb.org/service/$service.json
    else
        curl -s https://sandboxdb.org/service/$service.json
    end
end
