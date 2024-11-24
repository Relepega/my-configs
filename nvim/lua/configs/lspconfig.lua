-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
	html = {},
	cssls = {},

	gopls = {
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		root_dir = util.root_pattern("go.work", "go.mod", ".git"),
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
				},
			},
		},
	},

	-- pyright = {
	--   settings = {
	--     python = {
	--       analysis = {
	--         autoSearchPaths = true,
	--         typeCheckingMode = "basic",
	--       },
	--     },
	--   },
	-- },
}

for name, opts in pairs(servers) do
	opts.on_init = nvlsp.on_init
	opts.on_attach = nvlsp.on_attach
	opts.capabilities = nvlsp.capabilities

	lspconfig[name].setup(opts)
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
