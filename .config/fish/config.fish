if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

zoxide init fish | source

set -x EDITOR nvim

# fzf
set fzf_preview_dir_cmd eza --all --color=always

function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
    end
end
