# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration based on NvChad v2.5. The main NvChad repo is used as a plugin, and this repository imports its modules while providing custom configurations and additional plugins.

## Architecture

### Entry Point and Loading Order

1. `init.lua` - Main entry point that:
   - Sets up lazy.nvim plugin manager
   - Loads NvChad base (v2.5 branch)
   - Loads custom plugins from `lua/plugins/init.lua`
   - Loads theme from base46 cache
   - Requires `options.lua`, `nvchad.autocmds`, and `mappings.lua` in order

### Configuration Structure

- `lua/chadrc.lua` - NvChad theme configuration (currently using `ayu_light` theme)
- `lua/options.lua` - Custom Vim options (imports NvChad defaults)
- `lua/mappings.lua` - Custom key mappings (imports NvChad defaults)
- `lua/plugins/init.lua` - Custom plugin specifications for lazy.nvim
- `lua/configs/` - Plugin-specific configurations:
  - `lspconfig.lua` - LSP server configurations
  - `conform.lua` - Code formatting configuration
  - `lazy.lua` - Lazy.nvim settings including disabled plugins
  - `neogit.lua` - Neogit git client configuration

### Language Support

The configuration includes LSP servers for multiple languages/tools configured in `lua/configs/lspconfig.lua`:
- Ruby: solargraph, rubocop (with RoR plugin support)
- JavaScript/TypeScript: ts_ls, eslint
- Terraform: terraformls
- Ansible: ansiblels
- Kubernetes: helm_ls
- YAML: yamlls
- Clojure: clojure_lsp
- Nushell: nushell
- Web: html, cssls

LSP configuration uses the modern `vim.lsp.config` API (Neovim 0.11+) instead of the deprecated `require('lspconfig')` framework. Servers are configured using `vim.lsp.config[server_name] = { ... }` and enabled with `vim.lsp.enable(server_name)`.

Treesitter parsers are configured in `lua/plugins/init.lua` for: vim, lua, vimdoc, html, css, bash, hcl, fennel, nu (nushell).

### Custom Plugins

Key custom plugins beyond NvChad defaults (see `lua/plugins/init.lua`):
- `NeogitOrg/neogit` - Magit-like git interface (mapped to `<leader>gg`)
- `mprokopov/ror.nvim` - Ruby on Rails helpers with test running (`<leader>rt`, `<leader>rl`, `<leader>rr`)
- `kylechui/nvim-surround` - Surround text objects
- `towolf/vim-helm` - Helm chart support
- `Olical/conjure` - Interactive evaluation for Clojure, Fennel, Python

### Key Mappings

Custom mappings in `lua/mappings.lua`:
- `;` - Enter command mode (instead of `:`)
- `jk` (insert mode) - Exit to normal mode
- `gd` - LSP go to definition via Telescope
- `<leader>si` - Show LSP document symbols via Telescope
- `<leader>sc` - Show diagnostics for current line

Ruby on Rails mappings (from ror.nvim plugin):
- `<leader>rt` - Run test file
- `<leader>rl` - Run test at current line
- `<leader>rr` - Open RoR commands palette

## Development Commands

### Plugin Management
```bash
# Open Neovim and run these commands:
:Lazy sync              # Sync all plugins
:Lazy update           # Update plugins
:Lazy clean            # Remove unused plugins
```

### LSP Management
```bash
:Mason                 # Open Mason UI for LSP/tool installation
:LspInfo              # Show LSP status
:LspRestart           # Restart LSP servers
```

### Theme Customization
Edit `lua/chadrc.lua` to change theme. See [NvChad themes](https://nvchad.com/docs/config/theming) for options.

## File Organization

When modifying this configuration:
- Add new plugins to `lua/plugins/init.lua` as lazy.nvim specs
- Plugin-specific configs go in `lua/configs/<plugin-name>.lua`
- Import configs from plugin specs using `opts = require "configs.<plugin-name>"` or `config = function() require "configs.<plugin-name>" end`
- Custom key mappings go in `lua/mappings.lua`
- Custom Vim options go in `lua/options.lua`

## Notes

- The configuration uses lazy loading for most plugins (defaults.lazy = true in `lua/configs/lazy.lua`)
- Many standard Vim plugins are disabled for performance (see `lua/configs/lazy.lua`)
- Format on save is currently disabled in `lua/configs/conform.lua`
- The leader key is set to space in `init.lua`
