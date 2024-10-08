require('nvim-treesitter.configs').setup({
	ensure_installed = {
		'c',
		'lua',
		'vim',
		'vimdoc',
		'query',
		'python',
		'rust',
		'javascript',
		'typescript',
		'html',
		'css',
		'diff',
		'dockerfile',
		'git_config',
		'git_rebase',
		'gitattributes',
		'gitcommit',
		'gitignore',
		'java',
		'make',
		'markdown',
		'markdown_inline',
		'perl',
		'php',
		'regex',
		'ruby',
		'sql',
		'terraform',
		'toml',
		'yaml',
		'hyprlang',
	},
	modules = {},
	ignore_install = {},
	auto_install = true,
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
	endwise = { enable = true },
})

vim.treesitter.language.register('bash', 'zsh')

vim.filetype.add({
	pattern = { ['.*/hypr/.*%.conf'] = 'hyprlang' },
})

require('ts_context_commentstring').setup({})
