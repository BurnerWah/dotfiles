return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require("configs.conform"),
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("configs.tree-sitter"),
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
  },
  {
    "kylechui/nvim-surround",
    version = "^4.0.0",
    event = "VeryLazy",
    -- config = function()
    --     require("nvim-surround").setup({
    --         -- Put your configuration here
    --     })
    -- end
  },
}
