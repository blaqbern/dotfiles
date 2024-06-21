return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			require("cmp_nvim_lsp").default_capabilities()
		)

		cmp.setup {
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<S-tab>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
				["<tab>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select  },
				["<right>"] = cmp.mapping.confirm { select = true },
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			})
		}

		local on_attach = function(_, bufnr)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
			vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { buffer = bufnr })
		end

		require("fidget").setup {}
		require("mason").setup {}
		require("mason-lspconfig").setup {
			ensure_installed = { "lua_ls", "gopls", "tsserver" },
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup {
						capabilities = capabilities,
						on_attach = on_attach,
					}
				end,

				lua_ls = function()
					require("lspconfig").lua_ls.setup {
						capabilities = capabilities,
						on_attach = on_attach,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					}
				end,
			}
		}

		-- manage ocamllsp manually, since it gives mason trouble
		require("lspconfig").ocamllsp.setup {}
	end
}
