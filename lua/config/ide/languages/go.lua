local mappings = require('user.keymaps').languages.go

require('go').setup({
  lsp_cfg = true,
  lsp_on_attach = function(_, bufnr)
    local wk = require('which-key')

    wk.add(vim.list_extend(mappings, { { buffer = bufnr } }))
  end,
  trouble = true,
  luasnip = true,
})

-- -- null-ls config --
local null_ls = require('null-ls')
local go_sources = require('go.null_ls')

null_ls.register(null_ls.builtins.formatting.goimports)
null_ls.register(go_sources.gotest_action())
