function fish_user_key_bindings
        fish_vi_key_bindings
        bind -M insert -m default jk backward-char force-repaint

        fzf_key_bindings
end

