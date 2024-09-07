return {
  "folke/trouble.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    modes = {
      diagnostics = { auto_close = true },
    },
  },
  cmd = "Trouble",
  keys = {{ "<leader>x", "<cmd>Trouble diagnostics toggle focus=true<cr>" }},
}
