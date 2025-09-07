-- ==========================
-- Настройка Muyrux ColorScheme
-- ==========================

-- Lazy-load Colorbuddy
local cb_status = pcall(require, "colorbuddy.init")
if not cb_status then
	vim.notify("Colorbuddy not found!", vim.log.levels.ERROR)
	return
end

-- Lazy-load Lualine
local ll_status = pcall(require, "lualine")
if not ll_status then
	vim.notify("Lualine not found!", vim.log.levels.ERROR)
	return
end

-- ==========================
-- Палитры
-- ==========================
local palettes = {
	light = require("muyrux.palettes.light"),
	dark = require("muyrux.palettes.dark"),
}

local lualine = require("lualine")
local colorbuddy = require("colorbuddy.init")
local Color = colorbuddy.Color
local c = colorbuddy.colors

-- ==========================
-- Основной модуль темы
-- ==========================
local theme = {}
theme.current = "dark" -- по умолчанию
theme.transparent = false -- по умолчанию

function theme.load(name, transparent)
	local pal = palettes[name]
	if not pal then
		vim.notify("Palette " .. name .. " not found!", vim.log.levels.ERROR)
		return
	end

	-- Установим background
	vim.o.background = (name == "dark") and "dark" or "light"

	-- Очистим предыдущие цвета
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	-- Загружаем цвета
	for key, hex in pairs(pal) do
		Color.new(key, hex)
	end

	-- Загружаем группы
	local groups_module = require("muyrux.groups")
	groups_module.apply_groups(c, transparent)

	local lualine_theme = require("muyrux.groups.lualine").setup(c, "")

	lualine.setup({ options = { theme = lualine_theme } })
end

-- ==========================
-- Toggle Theme
-- ==========================
function theme.toggle_theme()
	theme.current = (theme.current == "light") and "dark" or "light"
	theme.load(theme.current, theme.transparent)
end

-- ==========================
-- Toggle Transparent
-- ==========================
function theme.toggle_transparent()
	theme.transparent = not theme.transparent
	theme.load(theme.current, theme.transparent)
end

-- ==========================
-- Команды для Neovim
-- ==========================
vim.api.nvim_create_user_command("ToggleTheme", function()
	theme.toggle_theme()
end, {})

vim.api.nvim_create_user_command("ToggleTransparent", function()
	theme.toggle_transparent()
end, {})

-- ==========================
-- Автозагрузка темы при старте
-- ==========================
theme.load(theme.current, theme.transparent)

return theme
