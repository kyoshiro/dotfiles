---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			-- add the following arguments for go:
			"go",
			"gomod",
			"gosum",
			"gowork"
		},
	},
}
