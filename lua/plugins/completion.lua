-- ============================================================================
-- plugins/completion.lua - Completion engine
-- nvim-cmp with LSP, buffer, and path sources
-- ============================================================================

return {
  -- nvim-cmp - Completion engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- LSP completion source
      "hrsh7th/cmp-buffer",    -- Buffer completion source
      "hrsh7th/cmp-path",      -- Path completion source
      "L3MON4D3/LuaSnip",      -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completion source
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        
        -- Completion window appearance
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        
        -- Key mappings
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),     -- Scroll docs up
          ['<C-f>'] = cmp.mapping.scroll_docs(4),      -- Scroll docs down
          ['<C-Space>'] = cmp.mapping.complete(),      -- Trigger completion
          ['<C-e>'] = cmp.mapping.abort(),             -- Close completion
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
          
          -- Tab to select next item
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          
          -- Shift-Tab to select previous item
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        
        -- Completion sources (order matters - first has priority)
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },  -- LSP
          { name = 'luasnip' },   -- Snippets
        }, {
          { name = 'buffer' },    -- Buffer words
          { name = 'path' },      -- File paths
        })
      })
    end,
  },

  -- LuaSnip - Snippet engine
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    lazy = true,
  },

  -- Completion sources
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-buffer", lazy = true },
  { "hrsh7th/cmp-path", lazy = true },
  { "saadparwaiz1/cmp_luasnip", lazy = true },
}
