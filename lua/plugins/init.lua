-- ============================================================================
-- plugins/init.lua - Plugin manager initialization
-- Installs lazy.nvim and loads all plugin configurations
-- ============================================================================

-- Install lazy.nvim automatically if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load all plugin specs
require("lazy").setup({
  -- Import plugin configurations from separate files
  { import = "plugins.ui" },         -- UI plugins: NERDTree, lualine, themes
  { import = "plugins.editor" },     -- Editor plugins: Telescope, commentary, surround, treesitter
  { import = "plugins.git" },        -- Git integration: gitsigns
  { import = "plugins.lsp" },        -- LSP configuration for TypeScript and Rust
  { import = "plugins.completion" }, -- Completion engine: nvim-cmp
})
