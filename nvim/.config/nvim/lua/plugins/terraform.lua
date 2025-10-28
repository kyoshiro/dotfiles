return {
    "kyoshiro/vim-terraform",
    ft = { "terraform", "tf" },
    config = function()
	vim.cmd([[autocmd BufWritePre *.tf,*.tfvars :TerraformFmt]])
    end,
}
