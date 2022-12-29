-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/kyoshiro/packer.nvim ' .. install_path)
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })
vim.api.nvim_create_autocmd('BufWritePre', { command = [[%s/\s\+$//e]], pattern = '*'})

require('packer').startup(function(use)
  use 'kyoshiro/packer.nvim' -- Package manager
  use 'kyoshiro/lualine.nvim' -- Fancier statusline
  use 'kyoshiro/coc.nvim'
  use 'kyoshiro/ctrlp.vim'
  use 'kyoshiro/editorconfig-vim'
  use 'kyoshiro/fzf.vim'
  use 'kyoshiro/nvim-treesitter'
  use 'kyoshiro/nvim-treesitter-textobjects'
  use 'kyoshiro/onedark.vim'
  use 'kyoshiro/papercolor-theme'
  use 'kyoshiro/ranger.vim'
  use 'kyoshiro/syntastic'
  use 'kyoshiro/tagbar'
  use 'kyoshiro/tokyonight.nvim'
  use 'kyoshiro/vim-airline'
  use 'kyoshiro/vim-airline-themes'
  use 'kyoshiro/vim-buffergator'
  use 'kyoshiro/vim-fugitive'
  use 'kyoshiro/vim-hardtime'
  use 'kyoshiro/vim-json'
  use 'kyoshiro/vim-prettier'
  use 'kyoshiro/vim-puppet'
  use 'kyoshiro/vim-ruby'
  use 'kyoshiro/vim-sensible'
  use 'kyoshiro/vim-snippets'
  use 'kyoshiro/vim-speeddating'
  use 'kyoshiro/vim-startify'
  use 'kyoshiro/vim-surround'
  use 'kyoshiro/vim-terraform'
  use 'kyoshiro/vim-unimpaired'
  use 'kyoshiro/vim-vividchalk'
  use 'kyoshiro/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'kyoshiro/nvim-cmp' -- Autocompletion plugin
  use 'kyoshiro/cmp-nvim-lsp'
  use 'kyoshiro/cmp_luasnip'
  use 'kyoshiro/LuaSnip' -- Snippets plugin
  -- External Plugins
  -- use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  -- use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  -- UI to select things (files, grep results, open buffers...)
  use { 'kyoshiro/telescope.nvim', requires = { 'kyoshiro/plenary.nvim' } }
  use { 'kyoshiro/telescope-fzy-native.nvim', run = 'make' }

  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use { 'kyoshiro/gitsigns.nvim', requires = { 'kyoshiro/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
end)

-- Enable relative line numbers
vim.opt.relativenumber = true

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = ''

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
vim.cmd [[colorscheme tokyonight]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local gset = vim.api.nvim_set_var
gset('airline#extensions#tabline#enabled', 1)
-- gset('airline#extensions#branch#enabled', 1)
-- gset('airline#extensions#branch#empty_message', '')
-- gset('airline#extensions#branch#use_vcscommand', 0)
-- gset('airline#extensions#branch#displayed_head_limit', 10)
-- gset('airline#extensions#branch#format', 0)
-- gset('airline#extensions#hunks#enabled', 1)
-- gset('airline#extensions#hunks#non_zero_only', 0)
-- gset('airline#extensions#hunks#hunk_symbols', "['+', '~', '-']")
gset('airline_powerline_fonts', 1)
gset('airline_theme', "papercolor")
gset('hybrid_custom_term_colors', 1)
gset('hybrid_reduced_contrast', 1)

--Set statusbar
-- require('lualine').setup {
--   options = {
--     icons_enabled = false,
--     theme = 'PaperColor',
--     component_separators = '|',
--     section_separators = '',
--   },
-- }

--Enable Comment.nvim
-- require('Comment').setup()

-- Enable and configure hard time
gset('hardtime_default_on', 1)
gset('hardtime_showmsg', 1)
gset('hardtime_maxcount', 3)

--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Indent blankline
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- Telescope
-- require('telescope').setup {
--   defaults = {
--     mappings = {
--       i = {
--         ['<C-u>'] = false,
--         ['<C-d>'] = false,
--       },
--     },
--   },
-- }

-- Enable telescope fzf native
-- require('telescope').load_extension 'fzf'

--Add leader shortcuts
-- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
-- vim.keymap.set('n', '<leader>sf', function()
--   require('telescope.builtin').find_files { previewer = false }
-- end)
-- vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
-- vim.keymap.set('n', '<leader>st', require('telescope.builtin').tags)
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
-- vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)
-- vim.keymap.set('n', '<leader>so', function()
--   require('telescope.builtin').tags { only_current_buffer = true }
-- end)
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)

-- Terraform settings

gset('terraform_align', '1')
gset('terraform_fold_sections','0')
gset('terraform_fmt_on_save', '1')

-- Ranger keybindings
--
gset('ranger_terminal','urxvt -e')
vim.keymap.set('n', '<leader>rr', ':RangerEdit<cr>')
vim.keymap.set('n', '<leader>rv', ':RangerVSplit<cr>')
vim.keymap.set('n', '<leader>rs', ':RangerSplit<cr>')
vim.keymap.set('n', '<leader>rt', ':RangerTab<cr>')
vim.keymap.set('n', '<leader>ri', ':RangerInsert<cr>')
vim.keymap.set('n', '<leader>ra', ':RangerAppend<cr>')
vim.keymap.set('n', '<leader>rc', ':set operatorfunc=RangerChangeOperator<cr>g@')
vim.keymap.set('n', '<leader>rd', ':RangerCD<cr>')
vim.keymap.set('n', '<leader>rld', ':RangerLCD<cr>')

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP settings
local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  -- vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
  vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Example custom server
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
-- vim: ts=2 sts=2 sw=2 et

