# Swift's ArgumentParser can generate Fish completions
# https://swiftpackageindex.com/apple/swift-argument-parser/1.2.3/documentation/argumentparser/installingcompletionscripts
set -l cmd (status basename | string replace .fish '')
if command -qs $cmd
    command $cmd --generate-completion-script=fish | source
end
