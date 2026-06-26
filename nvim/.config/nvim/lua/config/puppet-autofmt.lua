vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.pp",
	callback = function()
		vim.bo.filetype = "ruby"
	end,
})
