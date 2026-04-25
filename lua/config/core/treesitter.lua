local parsers = {
	'bash',
	'c',
	'comment',
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
	'gotmpl',
	'gowork',
	'html',
	'hyprlang',
	'java',
	'javascript',
	'json',
	'latex',
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
	'scss',
	'sql',
	'svelte',
	'terraform',
	'toml',
	'tsx',
	'typescript',
	'typst',
	'vim',
	'vimdoc',
	'vue',
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
	extension = {
		gotmpl = 'gotmpl',
		gohtml = 'gotmpl',
		tmpl = 'gotmpl',
		qml = 'qml',
	},
	pattern = { ['.*/hypr/.*%.conf'] = 'hyprlang' },
})

require('ts_context_commentstring').setup({})
