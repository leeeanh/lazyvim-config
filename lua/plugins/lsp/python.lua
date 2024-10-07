return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      servers = {
        basedpyright = {
          handlers = {
            ["textDocument/publishDiagnostics"] = function() end,
          },
          settings = {
            basedpyright = {
              disableOrganizeImports = true,
              typeCheckingMode = "basic",
            },
            python = {
              analysis = {
                autoSearchPaths = true,
                typeCheckingMode = "standard",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        ruff_lsp = {},
        jedi_language_server = {
          cmd = { "jedi-language-server" },
        },
      },
      setup = {
        basedpyright = function()
          LazyVim.lsp.on_attach(function(client, _)
            if client.name == "basedpyright" then
              -- disable hover in favor of jedi-language-server
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
        jedi_language_server = function()
          LazyVim.lsp.on_attach(function(client, _)
            if client.name == "jedi_language_server" then
              -- disable hover in favor of jedi-language-server
              client.server_capabilities.definitionProvider = false
            end
          end)
        end,
        ruff_lsp = function()
          LazyVim.lsp.on_attach(function(client, _)
            if client.name == "ruff_lsp" then
              -- Disable hover in favor of basedpyright
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
    },
  },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   opts = function()
  --     local nls = require("null-ls")
  --     return {
  --       root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
  --       sources = {
  --         nls.builtins.formatting.black.with({ { extra_args = { "--fast" } } }),
  --         nls.builtins.formatting.isort.with({ { extra_args = { "--profile", "black" } } }),
  --       },
  --     }
  --   end,
  -- },
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    opts = function(_, opts)
      opts.formatters_by_ft.python = { "ruff_format" }
    end,
  },
  -- require("util.mason").add_ensure_installed("python-lsp-server"),
  -- require("util.mason").add_ensure_installed("black"),
  -- require("util.mason").add_ensure_installed("ruff"),
}
