local Color, colors, Group, groups, styles = require("colorbuddy.init").setup()
local M = {}
M.transparent = false

local function apply_groups(c)
	local bg = M.transparent and "NONE" or c.base

	-- BASIC EDITOR GROUPS
	Group.new("Normal", c.black, bg)
	Group.new("Comment", c.dark, nil, styles.none)
	Group.new("NonText", c.light_grey, nil)
	Group.new("Error", c.red, nil)
	Group.new("Number", c.blue_dark)
	Group.new("Special", c.purple)
	Group.new("String", c.green_deep)
	Group.new("Title", c.blue)
	Group.new("Todo", c.pink)
	Group.new("Warning", c.orange)

	-- User groups
	Group.new("User1", c.pink)
	Group.new("User2", c.blue)
	Group.new("User3", c.pink)

	-- Diff
	Group.new("Added", groups.Normal, c.green)
	Group.new("Changed", groups.Normal, c.blue_dark)
	Group.new("Removed", groups.Normal, c.red_light)

	-- Spell
	Group.new("SpellBad", c.red, nil, styles.undercurl)
	Group.new("SpellCap", c.orange, nil, styles.undercurl)
	Group.new("SpellLocal", c.brown, nil, styles.undercurl)
	Group.new("SpellRare", c.blue, nil, styles.undercurl)

	-- Diagnostics
	Group.new("DiagnosticUnderlineError", nil, nil, styles.underline, c.red)
	Group.new("DiagnosticUnderlineWarn", nil, nil, styles.underline, c.orange)
	Group.new("DiagnosticUnderlineHint", nil, nil, styles.underline)
	Group.new("DiagnosticUnderlineInfo", nil, nil, styles.underline)
	Group.link("DiagnosticError", groups.Error)
	Group.link("DiagnosticWarn", groups.Warning)
	Group.link("DiagnosticHint", groups.Comment)
	Group.link("DiagnosticInfo", groups.Comment)
	Group.link("DiagnosticOk", groups.String)

	-- GitSigns
	Group.new("GitSignsAdd", c.green_light)
	Group.new("GitSignsChange", c.orange)
	Group.new("GitSignsDelete", c.red)

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

-- Загрузка темы
function M.load(theme, transparent)
	M.transparent = transparent or false
	local palette
	if theme == "dark" then
		palette = require("muyrux.palette_dark")
	else
		palette = require("muyrux.palette_light")
	end

	vim.g.colors_name = "muyrux"
	apply_groups(palette)
end

-- Переключение светлой/тёмной темы
function M.toggle()
	if vim.o.background == "dark" then
		vim.o.background = "light"
		M.load("light", M.transparent)
	else
		vim.o.background = "dark"
		M.load("dark", M.transparent)
	end
end

-- Включение/выключение прозрачного фона
function M.toggle_transparent()
	M.transparent = not M.transparent
	M.load(vim.o.background, M.transparent)
end

-- Создаём команды для Neovim
vim.api.nvim_create_user_command("MuyruxToggleTheme", function()
	M.toggle()
end, {})

vim.api.nvim_create_user_command("MuyruxToggleTransparent", function()
	M.toggle_transparent()
end, {})

return M
