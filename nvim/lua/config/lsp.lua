vim.lsp.enable { "ts_ls", "lua_ls", "gopls" }

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(e)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
    vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename)
    vim.keymap.set("n", "<leader>i", vim.lsp.buf.incoming_calls)
    vim.keymap.set("n", "<leader>o", vim.lsp.buf.outgoing_calls)
    vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references)

    local client = vim.lsp.get_client_by_id(e.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.cmd [[set completeopt+=menuone,menu,noselect,fuzzy,popup]]
      vim.lsp.completion.enable(true, client.id, e.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function() vim.lsp.completion.get() end)
    end
  end,
})
