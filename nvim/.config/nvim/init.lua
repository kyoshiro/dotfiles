-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

--map space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load Lazy
require("config.lazy")

-- Load additional configs
require("config.global")
require("config.menu")
require("config.keybindings")
require("config.terminal")
require("config.floaterminal")

vim.cmd [[colorscheme tokyonight-day]]

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- vim: ts=2 sts=2 sw=2 et
