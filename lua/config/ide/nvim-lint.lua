require('lint').linters_by_ft = {
	go = { 'golangcilint' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
	group = vim.api.nvim_create_augroup('UserNvimLint', {}),
	callback = function()
		require('lint').try_lint()
	end,
})
