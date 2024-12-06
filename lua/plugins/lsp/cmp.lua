return {
  {
    -- "hrsh7th/nvim-cmp",
    "yioneko/nvim-cmp",
    branch = "perf-up",
    enabled = false,
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      local cmp_window = require("cmp.config.window")
      -- opts.sources = cmp.config.sources({
      --   { name = "nvim_lsp" },
      --   { name = "snippets", max_item_count = 3 },
      --   { name = "buffer", max_item_count = 5, keyword_length = 5 },
      --   { name = "path", max_item_count = 5 },
      -- })
      opts.window = {
        completion = cmp_window.bordered({ col_offset = -8 }),
        documentation = cmp_window.bordered(),
      }
      opts.formatting.fields = { "kind", "abbr", "menu" }
      opts.formatting.format = function(_, item)
        local icons = require("lazyvim.config").icons.kinds
        local kind = item.kind
        item.menu = " (" .. kind .. ")"

        if icons[item.kind] then
          item.kind = " " .. icons[item.kind]
        end
        item.dup = { luasnip = 1, buffer = 1, path = 1, nvim_lsp = 0 }
        return item
      end
    end,
  },
  {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = "rafamadriz/friendly-snippets",

    -- use a release tag to download pre-built binaries
    version = "v0.*",
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',

    opts = {
      keymap = {
        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<Down>"] = { "select_next" },
        ["<Up>"] = { "select_prev" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
      },
      highlight = {
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = true,
      },
      menu = {
        draw = { columns = { { "label", "label_description", gap = 1 }, { "kind_icon", gap = 1, "kind" } } },
        border = "single",
      },
      ghost_text = { enabled = true },

      signature = { enabled = true, window = { border = "rounded" } },
      documentation = {
        window = {
          border = "rounded",
          min_width = 15,
          max_width = 45, -- smaller, due to https://github.com/Saghen/blink.cmp/issues/194
          max_height = 10,
          auto_show = true,
          auto_show_delay_ms = 250,
        },
      },
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",

      -- experimental auto-brackets support
      -- accept = { auto_brackets = { enabled = true } }

      -- experimental signature help support
      -- trigger = { signature_help = { enabled = true } }
    },
  },
}
