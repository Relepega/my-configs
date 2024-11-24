-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {
	nvdash = {
		load_on_startup = true,
	},
}

M.base46 = {
	theme = "ayu_dark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.nvdash = {
	load_on_startup = true,
}

M.mason = require "lua.configs.mason"

return M
