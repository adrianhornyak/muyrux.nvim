local colorbuddy = require("colorbuddy.init")
local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles

local M = {}
M.transparent = false

-- 🔹 Применение всех групп
local function apply_groups()
	local bg = M.transparent and "NONE" or colors.base

	-- Базовые группы
	Group.new("Normal", colors.black, bg)
	Group.new("Comment", colors.dark, nil, styles.none)
	Group.new("NonText", colors.light_grey)
	Group.new("Error", colors.red)
	Group.new("Warning", colors.orange)
	Group.new("Todo", colors.pink)
	Group.new("Special", colors.purple)
	Group.new("Number", colors.blue_dark)
	Group.new("String", colors.green_deep)
	Group.new("Title", colors.blue)
	Group.new("Noise", colors.pink)

	-- User группы
	Group.new("User1", colors.pink)
	Group.new("User2", colors.blue)
	Group.new("User3", colors.pink)

	-- Diff
	Group.new("Added", groups.Normal, colors.green)
	Group.new("Removed", groups.Normal, colors.red_light)
	Group.new("Changed", groups.Normal, colors.blue_dark)

	-- Spell
	Group.new("SpellBad", colors.red, nil, styles.undercurl)
	Group.new("SpellCap", colors.orange, nil, styles.undercurl)
	Group.new("SpellLocal", colors.brown, nil, styles.undercurl)
	Group.new("SpellRare", colors.blue, nil, styles.undercurl)

	-- Diagnostics
	Group.new("DiagnosticUnderlineError", nil, nil, styles.underline, colors.red)
	Group.new("DiagnosticUnderlineWarn", nil, nil, styles.underline, colors.orange)
	Group.new("DiagnosticUnderlineHint", nil, nil, styles.underline)
	Group.new("DiagnosticUnderlineInfo", nil, nil, styles.underline)
	Group.link("DiagnosticError", groups.Error)
	Group.link("DiagnosticWarn", groups.Warning)
	Group.link("DiagnosticHint", groups.Comment)
	Group.link("DiagnosticInfo", groups.Comment)
	Group.link("DiagnosticOk", groups.String)

	-- GitSigns
	Group.new("GitSignsAdd", colors.green_light)
	Group.new("GitSignsChange", colors.orange)
	Group.new("GitSignsDelete", colors.red)

	-- NvimTree
	Group.link("NvimTreeOpenedFolderName", groups.Special)
	Group.link("NvimTreeFolderIcon", groups.Special)
	Group.link("NvimTreeFolderName", groups.Normal)
	Group.link("NvimTreeEmptyFolderName", groups.Comment)
	Group.link("NvimTreeGitDirty", groups.Warning)
	Group.link("NvimTreeGitStaged", groups.User2)
	Group.link("NvimTreeGitMerge", groups.Error)
	Group.link("NvimTreeGitRenamed", groups.Changed)
	Group.link("NvimTreeGitNew", groups.String)
	Group.link("NvimTreeGitDeleted", groups.Error)
	Group.link("NvimTreeGitIgnored", groups.Comment)

	-- Telescope
	Group.link("TelescopeBorder", groups.Noise)
	Group.link("TelescopeMatching", groups.User1)
	Group.link("TelescopePromptCounter", groups.Noise)

	-- Markdown
	Group.link("@markup.list.unchecked.markdown", groups.Error)
	Group.link("@markup.list.checked.markdown", groups.Number)
	Group.link("@markup.link.label.markdown_inline", groups.Special)
	Group.link("@markup.link.url.markdown_inline", groups.Noise)

	-- Fugitive
	Group.link("fugitiveUnstagedModifier", groups.User2)
	Group.link("fugitiveStagedHeading", groups.Warning)
	Group.link("fugitiveUntrackedHeading", groups.User2)
	Group.link("fugitiveUntrackedSection", groups.Noise)
	Group.link("diffadded", groups.Added)
	Group.link("diffremoved", groups.Removed)

	-- Treesitter
	Group.link("@type.builtin", groups.User3)
	Group.link("@constant.builtin", groups.User1)
	Group.link("@constructor", groups.Special)
	Group.link("@exception.operator", groups.Special)
	Group.link("@function.macro", groups.Normal)
	Group.link("@namespace", groups.Normal)
	Group.link("@punctuation.special", groups.Normal)
	Group.link("@keyword.storage", groups.User2)
	Group.link("@type.qualifier", groups.Normal)
	Group.link("@variable", groups.Normal)
	Group.link("@variable.builtin", groups.String)
end

-- 🔹 Загрузка темы
function M.load(theme, transparent)
	M.transparent = transparent or false
	if theme == "dark" then
		require("muyrux.palette_dark")
	else
		require("muyrux.palette_light")
	end
	vim.g.colors_name = "muyrux"
	apply_groups()
end

-- 🔹 Переключение темы
function M.toggle()
	if vim.o.background == "dark" then
		vim.o.background = "light"
		M.load("light", M.transparent)
	else
		vim.o.background = "dark"
		M.load("dark", M.transparent)
	end
end

-- 🔹 Переключение прозрачности
function M.toggle_transparent()
	M.transparent = not M.transparent
	M.load(vim.o.background, M.transparent)
end

-- 🔹 Команды
vim.api.nvim_create_user_command("MuyruxToggleTheme", function()
	M.toggle()
end, {})
vim.api.nvim_create_user_command("MuyruxToggleTransparent", function()
	M.toggle_transparent()
end, {})

return M
