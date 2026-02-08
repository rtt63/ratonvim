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
    keys = { "gc", "gcc" }, -- Lazy load on keybind
  },

  -- Surround - Work with surrounding quotes, brackets, etc.
  -- Usage examples:
  --   ysiw"  - surround word with "quotes"
  --   cs"'   - change surrounding "quotes" to 'quotes'
  --   ds"    - delete surrounding "quotes"
  --   yss)   - surround entire line with (parentheses)
  {
    "tpope/vim-surround",
    event = "BufReadPost", -- Load when opening a file
  },

  -- Treesitter - Better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
  },
}
