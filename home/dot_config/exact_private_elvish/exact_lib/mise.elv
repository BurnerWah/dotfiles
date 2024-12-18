if (has-external mise) {
    var mise: = (ns [&])
    eval (mise activate elvish | slurp) &ns=$mise: &on-end={|ns| set mise: = $ns }
    mise:activate

    edit:add-var mise~ {|@args| mise:mise $@args }
}
