return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        selection_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        filter_rules = {
          include_current_win = true,
          autoselect_one = false,
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify", "noice", "neo-tree-preview" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
  },
  opts = {
    sources = { "filesystem" },
    window = {
      mappings = {
        ["l"] = "open_with_window_picker",
        ["h"] = "close_node",
        ["v"] = "open_vsplit",
        ["V"] = "open_split",
      },
    },
    default_component_configs = {
      container = {
        enable_character_fade = true,
        width = "100%",
        right_padding = 0,
      },
      --diagnostics = {
      --  symbols = {
      --    hint = "H",
      --    info = "I",
      --    warn = "!",
      --    error = "X",
      --  },
      --  highlights = {
      --    hint = "DiagnosticSignHint",
      --    info = "DiagnosticSignInfo",
      --    warn = "DiagnosticSignWarn",
      --    error = "DiagnosticSignError",
      --  },
      --},
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "󰉖",
        folder_empty_open = "󰷏",
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = "*",
        highlight = "NeoTreeFileIcon",
      },
      modified = {
        symbol = "",
        highlight = "NeoTreeModified",
      },
      git_status = {
        symbols = {
          -- Change type
          added = "󰝒", -- NOTE: you can set any of these to an empty string to not show them
          deleted = "󰮘",
          renamed = "󰬲",
          -- Status type
          modified = "",
          untracked = "󰡯",
          ignored = "",
          unstaged = "",
          staged = "󰸞",
          conflict = "󱈸",
        },
        align = "right",
      },
    },
  },
}

-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   dependencies = {
--     "s1n7ax/nvim-window-picker",
--     config = function()
--       require("window-picker").setup()
--     end,
--   },
--   opts = function(_, opts)
--     return vim.tbl_deep_extend("force", opts, config)
--   end,
-- }
