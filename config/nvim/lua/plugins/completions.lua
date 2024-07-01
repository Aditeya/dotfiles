return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- LSP completions
    "hrsh7th/cmp-nvim-lua", -- lua completions
    "hrsh7th/cmp-path", -- file path completions
    "hrsh7th/cmp-buffer", -- buffer (current file) completions
    "hrsh7th/cmp-cmdline", -- cmdline completions
    "onsails/lspkind.nvim", -- LSP formatting

    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  init = function()
    local cmp = require('cmp')
    -- require("luasnip.loaders.from_vscode").lazy_load()
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

    local cmp_select = {behavior = cmp.SelectBehavior.Select}
    local cmp_mappings = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete(),
    })
    cmp_mappings['<Tab>'] = nil
    cmp_mappings['<S-Tab>'] = nil

    local cmp_sources = cmp.config.sources({
      { name = 'nvim_lua' },
      { name = 'nvim_lsp' },
      { name = 'path'     },
      { name = 'luasnip'  }, -- For luasnip users.
    }, {
      { name = 'buffer', keyword_length = 5 },
    })

    local snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end
    }

    cmp.setup({
      mapping = cmp_mappings,
      snippet = snippet,
      sources = cmp_sources,
      formatting = {
        format = require("lspkind").cmp_format({
          mode = 'symbol',
          with_text = true,
          menu = {
            buffer = '[BUF]',
            nvim_lsp = '[LSP]',
            nvim_lua = '[API]',
            path = '[PATH]',
            luasnip = '[SNIP]'
          }
        })
      }
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
      }, {
        { name = 'buffer' },
      })
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = false,
      float = true,
    })
  end,
}
