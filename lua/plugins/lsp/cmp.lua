return {
  {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = "rafamadriz/friendly-snippets",

    -- use a release tag to download pre-built binaries
    version = "v1.*",
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
      completion = {
        menu = {
          draw = { columns = { { "label", "label_description", gap = 1 }, { "kind_icon", gap = 1, "kind" } } },
          border = "single",
        },
        ghost_text = { enabled = true },
      },

      signature = { enabled = true, window = { border = "rounded" } },
    },
  },
}
