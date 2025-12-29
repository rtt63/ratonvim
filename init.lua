-- ============================================================================
-- init.lua - Main configuration file
-- Loads all other modules
-- ============================================================================

-- Basic vim settings (line numbers, tabs, indentation, etc.)
require('settings')

-- Initialize lazy.nvim and load all plugins
require('plugins')

-- Custom key bindings
require('keymaps')
