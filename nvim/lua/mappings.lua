require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- general purpose tools
map("n", "<leader>pv", "<cmd>Oil<cr>", { desc = "Open file explorer" })
map("n", "<leader>op", function()
	local peek = require "peek"
	if peek.is_open() then
		peek.close()
	else
		peek.open()
	end
end, { desc = "Peek (Markdown Preview)" })

-- show diagnostics
map("n", "<leader>of", function()
	vim.diagnostic.open_float {
		-- 	relative = "cursor",
		-- 	width = 80,
		-- 	height = #lines + 2,
		-- 	col = 0,
		-- 	row = 0,
		-- 	-- border = "rounded",
		-- 	-- style = "minimal",
	}
end, {
	desc = "Open Diagnostic floating window",
	noremap = true,
	silent = true,
})

-- dap
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dus", function()
	local widgets = require "dap.ui.widgets"
	local sidebar = widgets.sidebar(widgets.scopes)
	sidebar.open()
end, { desc = "Open debugging sidebar" })

-- golang specific
map("n", "<leader>dgt", function()
	require("dap-go").debug_test()
end, { desc = "Debug go test" })
map("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "Add json struct tags" })
map("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "Add yaml struct tags" })

-- nvim tmux navigation integration things
map("n", "<C-h>", "<cmd> TmuxNavigateLeft <CR>", { desc = "Window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight <CR>", { desc = "Window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown <CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp <CR>", { desc = "Window up" })

-- trouble.nvim
map("n", "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>tl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- template
-- map("n", "<leader>", "", { desc = "" })
