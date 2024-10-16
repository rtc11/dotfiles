# ~/.config/kitty/kitty.conf
Add nvim as scrollback_pager and enable key-binding for it.

```conf
scrollback_pager nvim --noplugin -u ~/.config/kitty/scrollback-pager/nvim/init.vim -c "silent write! /tmp/kitty_scrollback_buffer | te cat /tmp/kitty_scrollback_buffer - "

map kitty_mod+h show_scrollback
```

# ~/.config/kitty/scrollback-pager/nvim/init.vim

Add minimal vim config, for snappier experience.

```vim
packadd hop.nvim
packadd vim-wordmotion

set relativenumber
set number
set mouse=a
set clipboard=unnamedplus
set virtualedit=all

lua << EOF

    -- space as the leader key

    vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })

    vim.g.mapleader = " "

    vim.g.maplocalleader = " "

    require'hop'.setup()

    vim.api.nvim_set_keymap("n", "<leader>ow", "<cmd>lua require'hop'.hint_words()<cr>", {})

    vim.api.nvim_set_keymap("n", "<leader>or", "<cmd>lua require'hop'.hint_lines()<cr>", {})

EOF
```

