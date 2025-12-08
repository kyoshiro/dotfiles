-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Enable relative line numbers
vim.opt.relativenumber = true

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = 'n'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme
vim.o.termguicolors = true

vim.cmd [[colorscheme industry]]
vim.cmd [[highlight Normal guibg=none]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Ranger keybindings
--
-- gset('ranger_terminal','urxvt -e')
vim.keymap.set('n', '<leader>rr', ':RangerEdit<cr>')
vim.keymap.set('n', '<leader>rv', ':RangerVSplit<cr>')
vim.keymap.set('n', '<leader>rs', ':RangerSplit<cr>')
vim.keymap.set('n', '<leader>rt', ':RangerTab<cr>')
vim.keymap.set('n', '<leader>ri', ':RangerInsert<cr>')
vim.keymap.set('n', '<leader>ra', ':RangerAppend<cr>')
vim.keymap.set('n', '<leader>rc', ':set operatorfunc=RangerChangeOperator<cr>g@')
vim.keymap.set('n', '<leader>rd', ':RangerCD<cr>')
vim.keymap.set('n', '<leader>rld', ':RangerLCD<cr>')

vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<cr>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Allow clipboard copy paste in neovim
vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})

require("config.lazy")

vim.opt.showtabline = 2

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- vim: ts=2 sts=2 sw=2 et
