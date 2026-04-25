require('neotest').setup({
	adapters = {
		require('neotest-golang')({
			go_test_args = { '-v', '-count=1' }, -- drop -race; needs CGO_ENABLED=1
			dap_mode = 'manual', -- avoid leoluz/nvim-dap-go dep
		}),
		require('neotest-python'),
		require('rustaceanvim.neotest'),
	},
})
