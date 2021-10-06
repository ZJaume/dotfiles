function zshuf -w shuf
    argparse 'h/help' -- $argv
    if [ $_flag_h ]; shuf --help
    else
        if which pigz
            pigz -dc $argv[-1] | shuf $argv[1..-2]
        else
            gzip -dc $argv[-1] | shuf $argv[1..-2]
        end
    end
end
