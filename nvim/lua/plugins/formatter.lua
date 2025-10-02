vim.pack.add { "https://github.com/stevearc/conform.nvim" }

require("conform").setup{
  format_after_save = { lsp_format = "fallback" },
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    javascriptreact = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier" },
  }
}
