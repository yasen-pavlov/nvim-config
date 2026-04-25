local mappings = require('user.keymaps').languages.go

require('go').setup({
  lsp_cfg = true,
  lsp_on_attach = function(_, bufnr)
    local wk = require('which-key')

    wk.add(vim.list_extend(vim.deepcopy(mappings), { { buffer = bufnr } }))
  end,
  trouble = true,
  luasnip = true,
})
