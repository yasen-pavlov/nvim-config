# nvim-config

A personal Neovim setup tuned for **Neovim 0.12+**, organized for fast load times and a single source of truth per concern.

```
init.lua
├── lua/user/         options + keymap *data*
├── lua/util/         loaders that wire data to Neovim
├── lua/plugins/      lazy.nvim specs (core / ide / ui)
└── lua/config/       per-plugin configuration, mirrors plugins/
```

## Highlights

- **Treesitter on the `main` branch** — opt-in highlighting + indent via `vim.treesitter.start()`, parsers managed through the `tree-sitter` CLI.
- **Modern formatting/linting stack** — [conform.nvim](https://github.com/stevearc/conform.nvim) + [nvim-lint](https://github.com/mfussenegger/nvim-lint) + [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim). No null-ls.
- **Snacks.nvim everywhere it makes sense** — input, notifier, bigfile, lazygit, git blame, gitbrowse.
- **Centralized keymaps** — every binding lives in `lua/user/keymaps.lua`, scoped lazily by `LspAttach` / `FileType` / which-key as needed.
- **No build, no test suite** — `~/.config/nvim` is a symlink to this repo; edit and reload.

## Install

```bash
git clone https://github.com/<you>/nvim-config ~/.config/nvim
```

System dependencies (Arch / CachyOS):

```bash
sudo pacman -S neovim ripgrep fd tree-sitter-cli lazygit btop
```

Mason will pull formatters, linters, debug adapters, and LSP servers on first launch. Treesitter parsers install via `nvim-treesitter`'s main-branch `install()` (needs `tree-sitter-cli`).

## Layout

| Path | Owns |
|---|---|
| `lua/user/options.lua` | Vim options table, Neovide tweaks |
| `lua/user/keymaps.lua` | Every keybinding (general / which-key / lsp / per-language) |
| `lua/util/options_loader.lua` | Applies `options.lua` |
| `lua/util/keymaps_loader.lua` | Applies the `general` keymap table |
| `lua/util/plugin_manager.lua` | Bootstraps lazy.nvim, points it at `lua/plugins/` |
| `lua/util/autocmds.lua` | Synthetic `User FileOpened` / `User DirOpened` events used as lazy triggers |
| `lua/plugins/{core,ide,ui}.lua` | Plugin specs |
| `lua/config/{core,ide,ui}/*.lua` | Plugin setup, mirrors the spec files |
| `lua/config/ide/languages/*.lua` | Per-language LSP + DAP wiring |

The `load_config(name)` helper in each `lua/plugins/*.lua` lazily requires `config.<category>.<name>` only when the plugin actually loads.

## Picks

| Concern | Plugin |
|---|---|
| Plugin manager | folke/lazy.nvim |
| Color scheme | marko-cerovac/material.nvim (`darker`) |
| Statusline | nvim-lualine/lualine.nvim |
| Winbar | Bekaboo/dropbar.nvim |
| Status column | luukvbaal/statuscol.nvim |
| File tree | nvim-tree/nvim-tree.lua |
| Picker / search | ibhagwan/fzf-lua |
| LSP | neovim/nvim-lspconfig + williamboman/mason.nvim |
| Completion | Saghen/blink.cmp + L3MON4D3/LuaSnip |
| Treesitter | nvim-treesitter/nvim-treesitter (`main`) |
| Comments | echasnovski/mini.comment + ts_context_commentstring |
| Format / lint | stevearc/conform.nvim + mfussenegger/nvim-lint |
| Tests | nvim-neotest/neotest |
| Debug | mfussenegger/nvim-dap (+ rcarriga/nvim-dap-ui) |
| Git signs / hunks | lewis6991/gitsigns.nvim |
| Git UI | lazygit (via `Snacks.lazygit`) |
| Diff view | sindrets/diffview.nvim |
| Folding | kevinhwang91/nvim-ufo (LSP folds) |
| Refactor | ThePrimeagen/refactoring.nvim |
| Markdown | MeanderingProgrammer/render-markdown.nvim, bngarren/checkmate.nvim |
| AI | greggh/claude-code.nvim |

Languages with extra wiring: Lua, Rust (rustaceanvim), Go (ray-x/go.nvim), TypeScript (yioneko/nvim-vtsls), Python, C/C++ (clangd_extensions), Bash, JSON/YAML (schemastore), CSS.

## Keymap conventions

Leader is `Space`. Keys are grouped under which-key categories:

| Prefix | Group |
|---|---|
| `<leader>g` | Git (snacks lazygit / blame / gitbrowse, gitsigns hunks, diffview) |
| `<leader>l` | LSP (info, format via conform, rename, references, inlay hints) |
| `<leader>s` | Search (fzf-lua) |
| `<leader>n` | Tests (neotest) |
| `<leader>x` | Trouble (diagnostics, qflist, loclist) |
| `<leader>p` | Plugins (`:Lazy` actions) |
| `<leader>a` | Refactor |
| `<leader>c` | Claude |
| `<leader>o` / `<leader>r` / `<leader>t` | Go / Rust / TypeScript per-language actions |

Other notable bindings:

- `jk` — exit insert mode (also in terminal mode)
- `<C-s>` / `<C-f>` — find files / live grep via fzf-lua
- `<D-,>` / `<D-.>` — previous / next buffer
- `<A-c>` — close buffer
- `<A-d>` — duplicate line
- `<F5>`–`<F12>` — DAP control
- `<C-h/j/k/l>` — pane navigation (works through tmux + terminal mode)

The full list lives in [`lua/user/keymaps.lua`](lua/user/keymaps.lua); press `<leader>h` inside Neovim to bring up which-key.

## Big files

`Snacks.bigfile` flips files >1.5 MB into a stripped-down filetype on `BufReadPre`. LSP and treesitter never attach; matchparen, indent guides, illuminate, rainbow-delimiters, and color highlighting are paused for that buffer.

## Conventions

- **Indent:** tabs (per `.stylua.toml` defaults). Quotes: `AutoPreferSingle`.
- **Format:** `stylua .` from the repo root.
- **Don't commit:** `lazy-lock.json`, `.luarc.json`, `spell/en.utf-8.add.spl` (all in `.gitignore`).
