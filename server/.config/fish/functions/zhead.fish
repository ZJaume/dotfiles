function zhead -w head
    argparse 'h/help' -- $argv
    if [ $_flag_h ]; head --help
    else
        gzip -dc $argv[-1] | head $argv[1..-2]
    end
end
