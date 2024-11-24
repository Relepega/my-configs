--- Clipboard in WSL without xclip
-- This is a WSL specific setting to use the Windows clipboard for + and * registers
-- If you have the default PowerShell, substitute pwsh.exe with powershell.exe
--
-- https://nvchad.com/docs/recipes#clipboard_in_wsl_without_xclip
vim.g.clipboard = {
	name = "WslClipboard",
	copy = {
		["+"] = "clip.exe",
		["*"] = "clip.exe",
	},
	paste = {
		["+"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		["*"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
	},
	cache_enabled = 0,
}
