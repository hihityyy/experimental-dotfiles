local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#131314",
		base01 = "#1f2020",
		base02 = "#2a2a2a",
		base03 = "#8d9193",
		base04 = "#c3c7c9",
		base05 = "#e4e2e2",
		base06 = "#e4e2e2",
		base07 = "#e4e2e2",
		base08 = "#ffb4ab",
		base09 = "#eee0f0",
		base0A = "#c2c7c9",
		base0B = "#d8e7ec",
		base0C = "#cfc2d2",
		base0D = "#bac9ce",
		base0E = "#c2c7c9",
		base0F = "#93000a",
	})

	local hi = function(group, opts)
		vim.api.nvim_set_hl(0, group, opts)
	end

	-- ═══════════════════════════════════════════════════════
	-- Dashboard.nvim highlight groups
	-- ═══════════════════════════════════════════════════════
	-- Общие
	hi("DashboardHeader", { fg = "#d8e7ec", bold = true })
	hi("DashboardFooter", { fg = "#8d9193" })

	-- Doom theme
	hi("DashboardDesc", { fg = "#e4e2e2" })
	hi("DashboardKey", { fg = "#d8e7ec", bold = true })
	hi("DashboardIcon", { fg = "#c2c7c9" })
	hi("DashboardShortCut", { fg = "#c3c7c9" })

	-- Hyper theme
	hi("DashboardProjectTitle", { fg = "#d8e7ec", bold = true })
	hi("DashboardProjectTitleIcon", { fg = "#d8e7ec" })
	hi("DashboardProjectIcon", { fg = "#c2c7c9" })
	hi("DashboardMruTitle", { fg = "#d8e7ec", bold = true })
	hi("DashboardMruIcon", { fg = "#c2c7c9" })
	hi("DashboardFiles", { fg = "#e4e2e2" })
	hi("DashboardShortCutIcon", { fg = "#8d9193" })

	-- ═══════════════════════════════════════════════════════
	-- Перезагрузка открытых dashboard-буферов
	-- ═══════════════════════════════════════════════════════
	-- dashboard.nvim использует nvim_buf_add_highlight с ns_id=0,
	-- поэтому цвета "запечены" в буфер. Только пересоздание поможет.
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].filetype == "dashboard" then
			vim.api.nvim_win_call(win, function()
				vim.cmd("Dashboard")
			end)
		end
	end
end

-- ═══════════════════════════════════════════════════════
-- Signal handler (matugen → SIGUSR1)
-- ═══════════════════════════════════════════════════════
if _G.__matugen_signal then
	_G.__matugen_signal:stop()
	_G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
	"sigusr1",
	vim.schedule_wrap(function()
		package.loaded["matugen"] = nil
		require("matugen").setup()
	end)
)

return M
