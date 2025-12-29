-- ============================================================================
-- settings.lua - Basic Neovim settings
-- Line numbers, tabs, indentation, mouse, cursor, etc.
-- ============================================================================

-- GUI Cursor - always block in all modes
vim.o.guicursor = 'n-v-c-i:block'

-- Line Numbers
vim.wo.number = true              -- Show line numbers
vim.wo.relativenumber = true      -- Show relative line numbers

-- Leader key
vim.g.mapleader = "\\"

-- Mouse Support
vim.o.mouse = 'a'                 -- Enable mouse in all modes

-- Indentation
vim.o.autoindent = true           -- Auto indent new lines

-- Tab Settings
vim.o.tabstop = 2                 -- Tab width is 2 spaces
vim.o.shiftwidth = 2              -- Indent width is 2 spaces
vim.o.smarttab = true             -- Smart tab behavior
vim.o.softtabstop = 2             -- Soft tab is 2 spaces
vim.o.expandtab = true            -- Convert tabs to spaces

-- Spell Check
vim.o.spelllang = "en_us"         -- Spell check language
vim.o.spell = true                -- Enable spell checking

-- Theme
vim.o.background = 'dark'         -- Dark background

-- Scrolling
vim.o.scrolloff = 4               -- Keep 4 lines visible when scrolling

-- Update time for CursorHold events (used by LSP diagnostics)
vim.o.updatetime = 100
