-- mason config
require('mason').setup({
  ui = {
    border = 'rounded',
    backdrop = 100,
  },
})

-- default handler
local default_handler = function(server_name)
  require('lspconfig')[server_name].setup({})
end

-- noop
local noop = function() end

-- load language specific configurations
local config_ls = function(name)
  return function()
    require('config.ide.languages.' .. name)
  end
end

-- mason-lspconfig setup
require('mason-lspconfig').setup({
  ensure_installed = {
    'bashls',
    'emmet_language_server',
    'eslint',
    'jsonls',
    'lua_ls',
    'pylsp',
    'rust_analyzer',
    'ts_ls',
    'yamlls',
    'cssls',
    'cssmodules_ls',
    'clangd',
    'gopls',
    'vtsls',
    'tailwindcss',
    'gh_actions_ls',
  },
  handlers = {
    default_handler,
    ts_ls = noop,
    rust_analyzer = noop,
    gopls = noop,
    bashls = config_ls('bash'),
    cssls = config_ls('css'),
    jsonls = config_ls('json'),
    lua_ls = config_ls('lua'),
    pylsp = config_ls('python'),
    yamlls = config_ls('yaml'),
  },
})
