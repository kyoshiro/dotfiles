return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local keymap = vim.keymap
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lua_ls_config = {
				name = "lua_ls",
				cmd = { "lua-language-server" },
				root_dir = vim.fs.root(0, { "init.lua", ".git" }),
				capabilities = capabilities,

				settings = {
					Lua = {
						format = {
							enable = true,
						},
					},
				},

				on_attach = function(client, bufnr)
					-- format on save (real working solution)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end,
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "lua",
				callback = function(event)
					vim.lsp.start(lua_ls_config)
				end,
			})
			-- Setup keybindings when LSP attaches
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local opts = { noremap = true, silent = true, buffer = event.buf }

					-- Keybindings
					keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>",
						vim.tbl_extend("force", opts, { desc = "Show LSP references" }))
					keymap.set("n", "gD", vim.lsp.buf.declaration,
						vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
					keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>",
						vim.tbl_extend("force", opts, { desc = "Show LSP definitions" }))
					keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>",
						vim.tbl_extend("force", opts, { desc = "Show LSP implementations" }))
					keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>",
						vim.tbl_extend("force", opts, { desc = "Show LSP type definitions" }))
					keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
						vim.tbl_extend("force", opts, { desc = "See available code actions" }))
					keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
						vim.tbl_extend("force", opts, { desc = "Smart rename" }))
					keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>",
						vim.tbl_extend("force", opts, { desc = "Show buffer diagnostics" }))
					keymap.set("n", "<leader>d", vim.diagnostic.open_float,
						vim.tbl_extend("force", opts, { desc = "Show line diagnostics" }))
					keymap.set("n", "[d", vim.diagnostic.goto_prev,
						vim.tbl_extend("force", opts, { desc = "Go to previous diagnostic" }))
					keymap.set("n", "]d", vim.diagnostic.goto_next,
						vim.tbl_extend("force", opts, { desc = "Go to next diagnostic" }))
					keymap.set("n", "K", vim.lsp.buf.hover,
						vim.tbl_extend("force", opts, { desc = "Show documentation" }))
					keymap.set("n", "<leader>rs", ":LspRestart<CR>",
						vim.tbl_extend("force", opts, { desc = "Restart LSP" }))
				end,
			})

			-- Diagnostic signs
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- Store default capabilities for mason-lspconfig
			vim.g.lsp_capabilities = capabilities
		end,
	},
	-- {
	-- 	"williamboman/mason.nvim",
	-- 	dependencies = {
	-- 		"williamboman/mason-lspconfig.nvim",
	-- 		"WhoIsSethDaniel/mason-tool-installer.nvim",
	-- 	},
	-- 	config = function()
	-- 		local mason = require("mason")
	-- 		local mason_lspconfig = require("mason-lspconfig")
	-- 		local mason_tool_installer = require("mason-tool-installer")
	-- 		local lspconfig = require("lspconfig")

	-- 		mason.setup({
	-- 			ui = {
	-- 				icons = {
	-- 					package_installed = "✓",
	-- 					package_pending = "➜",
	-- 					package_uninstalled = "✗",
	-- 				},
	-- 			},
	-- 		})

	-- 		mason_lspconfig.setup({
	-- 			ensure_installed = {
	-- 				"lua_ls",
	-- 				"pyright",
	-- 				"ts_ls",
	-- 				"html",
	-- 				"cssls",
	-- 				"tailwindcss",
	-- 				"rust_analyzer",
	-- 				"gopls",
	-- 			},
	-- 			automatic_installation = true,
	-- 		})

	-- 		-- Setup handlers for automatic LSP configuration
	-- 		mason_lspconfig.setup_handlers({
	-- 			-- Default handler for all servers
	-- 			function(server_name)
	-- 				lspconfig[server_name].setup({
	-- 					capabilities = vim.g.lsp_capabilities,
	-- 				})
	-- 			end,
	-- 			-- Custom handler for lua_ls
	-- 			["lua_ls"] = function()
	-- 				lspconfig.lua_ls.setup({
	-- 					capabilities = vim.g.lsp_capabilities,
	-- 					settings = {
	-- 						Lua = {
	-- 							diagnostics = {
	-- 								globals = { "vim" },
	-- 							},
	-- 							workspace = {
	-- 								library = {
	-- 									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
	-- 									[vim.fn.stdpath("config") .. "/lua"] = true,
	-- 								},
	-- 							},
	-- 						},
	-- 					},
	-- 				})
	-- 			end,
	-- 		})

	-- 		mason_tool_installer.setup({
	-- 			ensure_installed = {
	-- 				"prettier",
	-- 				"stylua",
	-- 				"eslint_d",
	-- 				"pylint",
	-- 				"black",
	-- 				"isort",
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
