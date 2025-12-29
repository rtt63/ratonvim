-- ============================================================================
-- plugins/lsp.lua - Language Server Protocol configuration
-- TypeScript/JavaScript and Rust language servers
-- ============================================================================

return {
  -- LSP Config - Base LSP configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP completion source for nvim-cmp
    },
    config = function()
      -- Get capabilities for completion
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = false, -- Don't show inline diagnostic text
        float = {
          border = 'rounded',
          wrap = true,
          max_width = 80,
        },
        signs = true,          -- Show signs in gutter
        underline = true,      -- Underline errors/warnings
        update_in_insert = false,
        severity_sort = true,  -- Sort by severity
      })

      -- Show diagnostics on hover (CursorHold event)
      vim.api.nvim_create_autocmd('CursorHold', {
        callback = function()
          vim.diagnostic.open_float(nil, {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = 'rounded',
            source = 'always',
            prefix = ' ',
          })
        end
      })

      -- TypeScript/JavaScript LSP setup using new vim.lsp.config API
      vim.lsp.config('ts_ls', {
        cmd = { 'typescript-language-server', '--stdio' },
        filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
        root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json' },
        capabilities = capabilities,
      })

      -- Enable TypeScript LSP
      vim.lsp.enable('ts_ls')

      -- Key mappings for LSP (applied when LSP attaches to buffer)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          
          -- Navigation
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)           -- Go to declaration
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)            -- Go to definition
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)        -- Go to implementation
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)            -- Show references
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts) -- Go to type definition
          
          -- Hover info
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                  -- Show hover info
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)     -- Show signature help
          
          -- Code actions
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)         -- Rename symbol
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts) -- Code action
          
          -- Formatting
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format({ async = true })
          end, opts)
          
          -- Workspace folders
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
        end,
      })

      -- Diagnostic navigation keymaps (global)
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)  -- Show diagnostic float
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)         -- Previous diagnostic
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)         -- Next diagnostic
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)  -- Add diagnostics to location list
    end,
  },

  -- Rustaceanvim - Rust LSP (better than rust-analyzer directly)
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false, -- Load immediately for Rust files
    ft = { "rust" },
    config = function()
      -- Rustaceanvim uses its own configuration
      vim.g.rustaceanvim = {
        server = {
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
        },
      }
      
      -- Auto-format Rust files on save
      vim.g.rustfmt_autosave = 1
    end,
  },
}
