require('neotest').setup({
	adapters = {
		require('neotest-golang')({
			go_test_args = { '-v', '-count=1' }, -- drop -race; needs CGO_ENABLED=1
		}),
		require('neotest-python'),
		require('rustaceanvim.neotest'),
	},
})
