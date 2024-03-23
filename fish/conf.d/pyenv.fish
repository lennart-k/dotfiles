if command -sq pyenv
    while set pyenv_index (contains -i -- "/home/$USER/.pyenv/shims" $PATH)
        set -eg PATH[$pyenv_index]
    end
    set -e pyenv_index
    set -gx PATH "/home/$USER/.pyenv/shims" $PATH
    set -gx PYENV_SHELL fish
    command pyenv rehash 2>/dev/null
    function pyenv
        set command $argv[1]
        set -e argv[1]

        switch "$command"
            case rehash shell
                source (pyenv "sh-$command" $argv|psub)
            case '*'
                command pyenv "$command" $argv
        end
    end
end
