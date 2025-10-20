return {
	"kyoshiro/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
	  signs = {
		  add = { text = "+" },
		  change = { text = "~" },
		  delete = { text = "_" },
		  topdelete = { text = "‾" },
		  changedelete = { text = "~" },
	  },
	  numhl = false,
	  linehl = false,
	  watch_gitdir = {
		  interval = 1000,
		  follow_files = true,
	  },
	  attach_to_untracked = true,
	  current_line_blame = false,
	  sign_priority = 6,
	  update_debounce = 100,
	  status_formatter = nil, -- Use default
  },
}
