vim.lsp.config('clangd', {
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto', 'arduino' },
  init_options = {
    fallbackFlags = { '--std=c23' },
  },
})
vim.lsp.enable('clangd')

require('clangd_extensions').setup({
  ast = {
    role_icons = {
      type = '',
      declaration = '',
      expression = '',
      specifier = '',
      statement = '',
      ['template argument'] = '',
    },

    kind_icons = {
      Compound = '',
      Recovery = '',
      TranslationUnit = '',
      PackExpansion = '',
      TemplateTypeParm = '',
      TemplateTemplateParm = '',
      TemplateParamObject = '',
    },
  },
})
