-- ============================================================================
-- keymaps.lua - Custom key mappings
-- All keyboard shortcuts in one place
-- ============================================================================

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- ============================================================================
-- NERDTree - File explorer
-- ============================================================================
keymap('n', '<C-f>', ':NERDTreeFocus<CR>', opts)   -- Focus file explorer
keymap('n', '<C-n>', ':NERDTree<CR>', opts)        -- Open file explorer
keymap('n', '<C-t>', ':NERDTreeToggle<CR>', opts)  -- Toggle file explorer

-- ============================================================================
-- Telescope - Fuzzy finder
-- ============================================================================
keymap('n', '<C-q>', ':Telescope<CR>', opts)       -- Open Telescope menu

-- ============================================================================
-- Gitsigns - Git integration
-- ============================================================================
-- Note: These keybinds are here but most users just use the visual gutter
-- If you don't need manual git operations from vim, you can remove these
keymap('n', '<leader>hs', ':Gitsigns stage_hunk<CR>', opts)           -- Stage hunk
keymap('n', '<leader>hP', ':Gitsigns preview_hunk<CR>', opts)         -- Preview hunk (popup)
keymap('n', '<leader>hu', ':Gitsigns undo_stage_hunk<CR>', opts)      -- Undo stage hunk
keymap('n', '<leader>hp', ':Gitsigns preview_hunk_inline<CR>', opts)  -- Preview hunk (inline)
keymap('n', '<leader>hd', ':Gitsigns diffthis<CR>', opts)             -- Diff current file
keymap('n', '<leader>hD', ':lua require"gitsigns".diffthis("~")<CR>', opts) -- Diff against HEAD~1
