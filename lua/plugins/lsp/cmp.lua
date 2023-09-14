return {
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    local cmp_window = require "cmp.config.window"
    opts.sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip", max_item_count = 3 },
      { name = "buffer", max_item_count = 5, keyword_length = 5 },
      { name = "path", max_item_count = 5 },
    })
    opts.window = {
      completion = cmp_window.bordered(),
      documentation = cmp_window.bordered(),
    }
    opts.formatting.format = function(_, item)
      local icons = require("lazyvim.config").icons.kinds
      if icons[item.kind] then
        item.kind = icons[item.kind] .. item.kind
      end
      item.dup = { luasnip = 1, buffer = 1, path = 1, nvim_lsp = 0 }
      return item
    end
  end,
}

