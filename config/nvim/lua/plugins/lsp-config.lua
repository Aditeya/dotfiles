return {
  "williamboman/mason.nvim",
  dependencies= { -- LSP Support
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  init = function()
    require("mason").setup()
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "angularls",
        "tsserver",
        "emmet_ls",
        "html",
        "cssls",
        "rust_analyzer"
      },
      automatic_installation = true,
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local function on_attach(_, bufnr)
      local opts = {buffer = bufnr, remap = false}

      vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
      -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set('n','<leader>gr', vim.lsp.buf.rename , opts)
      vim.keymap.set('n','<leader>ga', vim.lsp.buf.code_action , opts)
      vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition , opts)

      vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
      -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end

    local lspconfig = require("lspconfig")
    mason_lspconfig.setup_handlers({
      function (server_name)
        lspconfig[server_name].setup({ on_attach = on_attach, capabilities = capabilities })
      end,
      ['rust_analyzer'] = function ()
        lspconfig.rust_analyzer.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            ['rust-analyzer'] = {
              check = {
                allFeatures = true,
                overrideCommand = {
                  'cargo', 'clippy', '--workspace', '--message-format=json',
                  '--all-targets', '--all-features'
                }
              }
            }
          }
        })
      end,
      ['lua_ls'] = function ()
        lspconfig.lua_ls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" }, -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              diagnostics = { globals = { "vim" } }, -- Get the language server to recognize the `vim` global
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false, -- remove annoying dialog
              }, -- Make the server aware of Neovim runtime files
              telemetry = { enable = false }, -- Do not send telemetry data containing a randomized but unique identifier
            },
          },
        })
      end,
      --[[ ['cssmodules_ls'] = function ()
        lspconfig.cssmodules_ls.setup({
          on_attach = function(client, bufnr)
            -- avoid accepting `go-to-definition` responses from this LSP
            client.server_capabilities.goto_definition = false
            on_attach(client, bufnr)
          end,
          capabilities = capabilities,
          init_options = {
            camelCase = true,
          },
        })
      end ]]
    })
  end,
}
