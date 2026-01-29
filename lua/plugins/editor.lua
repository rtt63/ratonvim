-- ============================================================================
-- plugins/editor.lua - Editor enhancement plugins
-- Fuzzy finder, commenting, surround, syntax highlighting
-- ============================================================================

return {
  -- Telescope - Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
  },

  -- Plenary - Required by Telescope
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  -- Commentary - Toggle comments with gcc & gc
  {
    "tpope/vim-commentary",
    event = "VeryLazy",
  },

  -- Surround - Work with surrounding quotes, brackets, etc.
  -- Usage examples:
  --   ysiw"  - surround word with "quotes"
  --   cs"'   - change surrounding "quotes" to 'quotes'
  --   ds"    - delete surrounding "quotes"
  --   yss)   - surround entire line with (parentheses)
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },

  -- Treesitter - Better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    priority = 1000,
    version = "v0.9.3",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "typescript",
          "tsx",
          "javascript",
          "lua",
          "vim",
          "vimdoc",
          "html",
          "css",
          "json",
          "markdown",
          "c",
          "cpp",
          "rust",
        },
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
      -- Re-trigger FileType for buffers opened before treesitter loaded
      vim.cmd("doautoall FileType")
    end,
  },
}
