--- @type MasonConfig
local opts = {
	pkgs = {
		-- deno
		"deno",

		-- golang
		"delve",
		"gomodifytags",
		"gotests",
		"impl",
		"iferr",
		"goimports-reviser",
		"goimports",
	},
}

return opts
