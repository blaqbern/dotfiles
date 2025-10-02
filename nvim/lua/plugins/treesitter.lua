vim.pack.add {
  { src = "https://github.com/nvim-treesitter/nvim-treesitter.git", version = "master" },
}

require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "go", "lua", "ocaml", "typescript", "bash", "markdown",
    "terraform", "yaml", "json", "toml",
  },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = { enable = true },
  auto_install = false,
}

vim.api.nvim_create_autocmd("PackChanged", {
  desc = "manage treesitter updates",
  group = vim.api.nvim_create_augroup("treesitter-pack-changed-update-handler", { clear = true }),
  callback = function(event)
    if event.data.kind == "update" then
      pcall(vim.cmd, "TSUpdate")
    end
  end
})
