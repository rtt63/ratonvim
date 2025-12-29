-- ============================================================================
-- Prettier - Code formatter for TypeScript/JavaScript
-- ============================================================================
{
  "stevearc/conform.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
      },
      
      -- Format on save
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
    
    -- Manual format command
    vim.api.nvim_create_user_command('Format', function()
      require("conform").format({ async = true, lsp_fallback = true })
    end, {})
  end,
}
