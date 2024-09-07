return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier", "solargraph", "terraformls", "rubocop"
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc", "html", "css", "bash", "hcl"
  		},
  	},
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
    lazy = false
  },
  {
    "mprokopov/ror.nvim",
    dependencies = {
      "rcarriga/nvim-notify",
      "stevearc/dressing.nvim"
    },
    keys = {
      {"<leader>rt", "<cmd>RorTestRun<cr>", desc = "Run Test"},
      {"<leader>rl", "<cmd>RorTestRun Line<cr>", desc = "Run Test for Current Line"},
      {"<leader>rr", "<cmd>RorCommands<cr>", desc = "RoR Commands Pallete"},
    },
    opts = {},
    config = true,
    ft = "ruby"
  }
}
