-- load autocmds --

local groups = {
	settings = vim.api.nvim_create_augroup("UserSettings", {}),
	nvim_tree = vim.api.nvim_create_augroup("UserNvimtree", {}),
	events = vim.api.nvim_create_augroup("UserEvents", {}),
}

local autocmds = {

	{
		events = { "BufEnter" },
		opts = {
			group = groups.settings,
			desc = "Disable comments continuation",
			callback = function()
				vim.cmd("set formatoptions-=cro")
				vim.cmd("setlocal formatoptions-=cro")
			end,
		},
	},

	{
		events = { "VimEnter" },
		opts = {
			group = groups.nvim_tree,
			desc = "Open nvim-tree when vim is starting in a folder",
			callback = function(args)
				local file = args.file

				if vim.fn.isdirectory(args.file) == 1 then
					vim.cmd.enew()
					vim.cmd.bw(args.buf)
					vim.cmd.cd(file)

					require("nvim-tree.api").tree.open()
				end
			end,
		},
	},

	{
		events = { "BufEnter" },
		opts = {
			group = groups.events,
			desc = "Generate DirOpened event",
			callback = function(args)
				local bufname = vim.api.nvim_buf_get_name(args.buf)
				if vim.fn.isdirectory(bufname) == 1 then
					vim.cmd("do User DirOpened")
				end
			end,
			nested = true,
		},
	},

	{
		events = { "BufRead", "BufWinEnter", "BufNewFile" },
		opts = {
			group = groups.events,
			desc = "Generate FileOpened event",
			callback = function(args)
				local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
				if not (vim.fn.expand("%") == "" or buftype == "nofile") then
					vim.cmd("do User FileOpened")
				end
			end,
			nested = true,
		},
	},
}

for _, autocmd in pairs(autocmds) do
	vim.api.nvim_create_autocmd(autocmd.events, autocmd.opts)
end
