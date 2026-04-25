# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

Personal Neovim configuration. `~/.config/nvim` is a symlink to this directory, so edits here are the live config — restart Neovim (or `:Lazy reload`) to pick up changes. There is no build, no test suite, and no CI.

## Tooling

- Format Lua: `stylua .` (uses `.stylua.toml`; tabs for indent, `AutoPreferSingle` quotes — match this style in edits).
- Plugin manager: lazy.nvim. The lockfile `lazy-lock.json` is gitignored, so plugin upgrades are intentionally not pinned in-repo.
- Inside Neovim: `:Lazy sync`, `:Mason`, `:LspInfo`, `:NullLsInfo`, `:checkhealth`.

## Architecture

Bootstrap order (`init.lua`) is fixed and load-order-sensitive:

1. `lua/util/options_loader.lua` — applies the table returned by `lua/user/options.lua` via `vim.opt[k] = v`, plus Neovide-specific keymaps and globals.
2. `lua/util/keymaps_loader.lua` — applies only the `general` table from `lua/user/keymaps.lua`. The `which_key`, `lsp`, and per-language tables are intentionally *not* loaded here; they are consumed lazily by their respective plugin configs.
3. `lua/util/plugin_manager.lua` — clones lazy.nvim if missing, then `require('lazy').setup('plugins', opts)` auto-imports every file under `lua/plugins/` (`core.lua`, `ide.lua`, `ui.lua`) and merges their returned spec lists.
4. `lua/util/autocmds.lua` — registers autocmds and **emits two synthetic User events used as lazy-load triggers across the plugin specs**: `User FileOpened` (fires on first real buffer) and `User DirOpened` (fires when entering a directory). When adding plugins that should load on file/dir open, prefer these over `BufReadPre` to stay consistent.

### The `load_config` indirection

Each `lua/plugins/*.lua` file defines a local helper:

```lua
local load_config = function(plugin)
  return function() require('config.<category>.' .. plugin) end
end
```

so a spec like `config = load_config('lsp')` runs `require('config.ide.lsp')` only when lazy.nvim activates the plugin. This is why plugin setup code lives under `lua/config/{core,ide,ui}/` mirroring the `lua/plugins/` file that owns it. Language-specific LSP/DAP setup lives in `lua/config/ide/languages/` and is dispatched from `lua/config/ide/mason.lua` (`config_ls('go')`, etc.) or directly from the plugin spec (`load_config('languages/rust')`).

### Keymaps are centralized, not colocated

All user keymaps live in `lua/user/keymaps.lua` and are exported as named tables: `general`, `which_key`, `lsp`, `languages.{go,rust,typescript}`. Consumers pull what they need:

- `general` → applied globally by `keymaps_loader.lua`.
- `which_key` → registered in `lua/config/core/which-key.lua` via `which_key.add(...)`.
- `lsp` → registered inside the `LspAttach` autocmd in `lua/config/ide/lsp.lua`, scoped to the attaching buffer with `vim.list_extend(mappings, { { buffer = bufnr } })`.
- `languages.<lang>` → registered from each language's `on_attach` (e.g. `lua/config/ide/languages/go.lua`) or from `lsp.lua` for server-specific cases (e.g. vtsls).

When adding a new keymap, put it in the appropriate table in `keymaps.lua` rather than inline in a plugin config — and **do not** add a per-language table to `keymaps_loader.lua`; it must be added on attach so `buffer = bufnr` scoping works.

### LSP / tooling installation

`lua/config/ide/mason.lua` is the single source of truth for which LSP servers Mason ensures (`ensure_installed`), and `lua/config/ide/null-ls.lua` does the same for formatters/linters/DAP adapters via `mason-null-ls`. `automatic_enable.exclude` lists servers that are configured manually elsewhere (currently `ts_ls` and `rust_analyzer`, the latter handled by `rustaceanvim`). Per-server `vim.lsp.config(...)` + `vim.lsp.enable(...)` calls live in `lua/config/ide/languages/<lang>.lua`.

Capabilities are composed once in `lua/config/ide/lsp.lua` by merging blink.cmp's capabilities with UFO folding capabilities into `lspconfig.util.default_config.capabilities`, so individual language files don't need to repeat that.

## Conventions

- Indentation: tabs (stylua default), width 2 in Neovim options. Quotes: single, per `.stylua.toml`.
- Spell file `spell/en.utf-8.add` is tracked; the compiled `.spl` is gitignored.
- Don't commit `lazy-lock.json` or `.luarc.json` (both gitignored).
