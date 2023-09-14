return {
    {
      "folke/noice.nvim",
      opts = function(_, opts)
            opts.routes = {
                { -- filter write messages "xxxL, xxxB"
                    filter = {
                        event = "msg_show",
                        find = "AutoSave",
                    },
                    opts = { skip = true },
                },
            }
        end,
  --     opts = {
  --       cmdline = { view = "cmdline" },
  --       presets = {
  --         command_palette = false,
  --       },
  --     },
  --     config = function(_, opts)
  --       require("telescope").load_extension("noice")
  --       require("noice").setup(opts)
  --     end,
    },
}
