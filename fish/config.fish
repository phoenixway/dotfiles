# if status is-interactive
        # Commands to run in interactive sessions can go here
             # nvm install latest &> /dev/null
             # nvm use 20.5.0 &> /dev/null
        # jump shell fish | source
        # status --is-interactive; and source (jump shell fish | psub)
        #    eval "$(jump shell --bind=z)"
        # function __jump_add --on-variable PWD
        #   status --is-command-substitution; and return
        #   jump chdir
        # end
        #
        # function __jump_hint
        #   set -l term (string replace -r '^j ' '' -- (commandline -cp))
        #   jump hint "$term"
        # end

        # function j
        #   set -l dir (jump cd "$argv")
        #   test -d "$dir"; and cd "$dir"
        # end

        # complete --command j --exclusive --arguments '(__jump_hint)'

# end

status --is-interactive; and source (jump shell fish | source)

thefuck --alias | source
starship init fish | source
alias cp "/usr/local/bin/cpg -g"
alias mv "/usr/local/bin/mvg -g"
