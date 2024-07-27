return {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "cyberdream",
    icons = {
      kinds = vim.tbl_map(function(icon)
        return icon .. " "
      end, require("config.icons").lspkind),
    },
  },
}
