packadd vim-wordmotion

set relativenumber
set number
set mouse=a
set clipboard=unnamedplus
set virtualedit=all

lua << EOF
    vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true }) 
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "


    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    keymap({ 'n', 'v' }, '<Space>', '<Nop>', opts)

    keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)          -- move selected (v mode) down
    keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)          -- move selected (v mode) up

    keymap({'n', 'o', 'x'}, '<s-h>', '^', opts)         -- move to end of line
    keymap({'n', 'o', 'x'}, '<s-l>', 'g_', opts)        -- move to start of line

    -- Remap for dealing with word wrap
    keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
    keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

    -- search
    keymap('n', 'n', 'nzz', opts)
    keymap('n', 'N', 'Nzz', opts)
    keymap('n', '*', '*zz', opts)
    keymap('n', '#', '#zz', opts)
    keymap('n', 'g*', 'g*zz', opts)
    keymap('n', 'g#', 'g#zz', opts)

    -- stay in indent mode (todo: use <Tab> and <s>-<Tab> if possible)
    keymap('v', '<s-TAB>', '<gv', opts)
    keymap('v', '<TAB>', '>gv', opts)

    keymap('i', '<s-TAB>', '<C-d>', opts)

    -- when yanking a word, you can replace word under cursor [vep]
    keymap('x', 'p', [["_dP]])

EOF

