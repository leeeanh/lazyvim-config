return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          handlers = {
            ["textDocument/publishDiagnostics"] = function() end,
          },
          on_attach = function(client, _)
            client.server_capabilities.codeActionProvider = false
          end,
          settings = {
            pyright = {
              disableOrganizeImports = true,
            },
            python = {
              analysis = {
                autoSearchPaths = true,
                typeCheckingMode = "basic",
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
        pyright = function()
          require("lazyvim.util").on_attach(function(client, _)
            if client.name == "pyright" then
              -- disable hover in favor of jedi-language-server
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
        ruff_lsp = function()
          require("lazyvim.util").on_attach(function(client, _)
            if client.name == "ruff_lsp" then
              -- Disable hover in favor of Pyright
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.black.with({ { extra_args = { "--fast" } } }),
          nls.builtins.formatting.isort.with { { extra_args = { "--profile", "black" } } },
        },
      }
    end,
  },
  -- require("util.mason").add_ensure_installed("python-lsp-server"),
  -- require("util.mason").add_ensure_installed("black"),
  -- require("util.mason").add_ensure_installed("ruff"),
}
