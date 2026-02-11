return {
	"kyoshiro/nvim-lua-format",
	config = function()
		require("nvim-lua-format").setup({
	vim.cmd([[autocmd BufWritePre *.lua :luaformatter]])
			-- add your config here
		})
	end,
}
