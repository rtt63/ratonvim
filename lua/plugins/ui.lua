-- ============================================================================
-- plugins/ui.lua - UI plugins
-- File explorer, status line, color schemes
-- ============================================================================

return {
  -- NERDTree - File explorer
  {
    "preservim/nerdtree",
    cmd = { "NERDTree", "NERDTreeToggle", "NERDTreeFocus" }, -- Lazy load on command
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'nord',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          always_divide_middle = true,
          globalstatus = false,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {
            'encoding',
            -- 'fileformat', -- Disabled to save space
            'filetype'
          },
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
      })
    end,
  },

  -- Icons for various plugins
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  -- Color schemes
  { "shaunsingh/nord.nvim", lazy = true },
  { "morhetz/gruvbox", lazy = true },
  { "bluz71/vim-moonfly-colors", lazy = true },
  { "jaredgorski/fogbell.vim", lazy = true },
  {
    "diegoulloao/neofusion.nvim",
    priority = 1000, -- Load first
    config = function()
      vim.cmd([[colorscheme neofusion]])
    end,
  },

  -- Devicons for NERDTree
  { "ryanoasis/vim-devicons", lazy = true },
}
