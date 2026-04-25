local parsers = {
	'bash',
	'c',
	'css',
	'diff',
	'dockerfile',
	'git_config',
	'git_rebase',
	'gitattributes',
	'gitcommit',
	'gitignore',
	'go',
	'gomod',
	'gosum',
	'gowork',
	'html',
	'hyprlang',
	'java',
	'javascript',
	'json',
	'lua',
	'make',
	'markdown',
	'markdown_inline',
	'perl',
	'php',
	'python',
	'query',
	'regex',
	'ruby',
	'rust',
	'sql',
	'terraform',
	'toml',
	'tsx',
	'typescript',
	'vim',
	'vimdoc',
	'yaml',
}

require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd('FileType', {
	group = vim.api.nvim_create_augroup('UserTreesitter', { clear = true }),
	callback = function(args)
		pcall(vim.treesitter.start)
		vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- start on the current buffer if FileType already fired before plugin load
if vim.bo.filetype ~= '' then
	pcall(vim.treesitter.start)
	vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

vim.treesitter.language.register('bash', 'zsh')

vim.filetype.add({
	pattern = { ['.*/hypr/.*%.conf'] = 'hyprlang' },
})

require('ts_context_commentstring').setup({})
