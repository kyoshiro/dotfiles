local function open_nvim_tree()
  -- open the tree
  require("nvim-tree.api").tree.open({
    focus = false,
    })
end

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- optional, for file icons
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
			update_focused_file = {
				enable = true,
				update_root = {
					enable = true,
					ignore_list = {},
				},
				exclude = false,
			},
		})
	end,
}
