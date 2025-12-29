-- ============================================================================
-- plugins/git.lua - Git integration
-- Shows added/changed/deleted lines in the gutter
-- ============================================================================

return {
  -- Gitsigns - Git decorations (line status in gutter)
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require('gitsigns').setup({
        -- Show blame info on current line
        current_line_blame = true,
        
        -- Signs in the gutter (left column)
        signs = {
          add          = { text = ' ' },
          change       = { text = ' ' },
          delete       = { text = ' ' },
          topdelete    = { text = ' ' },
          changedelete = { text = ' ' },
        },
      })
      
      -- Custom colors for git signs
      vim.api.nvim_set_hl(0, 'GitSignsAdd', { bg = '#0ade00', fg = '#ffffff' })
      vim.api.nvim_set_hl(0, 'GitSignsChange', { bg = '#debc00', fg = '#ffffff' })
      vim.api.nvim_set_hl(0, 'GitSignsDelete', { bg = '#ff0000', fg = '#ffffff' })
      vim.api.nvim_set_hl(0, 'GitSignsAddNr', { bg = '#0ade00', fg = '#ffffff' })
      vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { bg = '#debc00', fg = '#ffffff' })
      vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { bg = '#ff0000', fg = '#ffffff' })
    end,
  },
}
