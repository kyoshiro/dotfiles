-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

--map space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable relative line numbers
vim.opt.relativenumber = true
vim.opt.showtabline = 2

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

vim.cmd [[highlight Normal guibg=none]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Load Lazy
require("config.lazy")
require("config.menu")
require("config.keybindings")
require("config.terminal")
require("config.floaterminal")

vim.cmd [[colorscheme tokyonight-day]]

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- vim: ts=2 sts=2 sw=2 et
