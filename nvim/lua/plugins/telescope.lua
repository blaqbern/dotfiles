vim.pack.add {
  { src ="https://github.com/nvim-telescope/telescope.nvim.git", version = "0.1.6" },
  "https://github.com/nvim-lua/plenary.nvim.git",
}

require("telescope").setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      preview_width = 0.65,
      horizontal = {
        size = {
          width = "95%",
          height = "95%",
        },
      },
    },
    path_display = {
      shorten = { len = 1, exclude = { 1, -1 } },
    },
  },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fa", builtin.live_grep)
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.git_files)
