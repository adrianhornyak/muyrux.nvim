local colorbuddy = require("colorbuddy.init")
local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles

local M = {}

M.transparent = nil
M.current_theme = "dark" -- Загрузка темы

local function load_palette(theme)
	if theme == "dark" then
		require("muyrux.palette_dark")
	else
		require("muyrux.palette_light")
	end
end

function M.apply_groups()
	local c = load_palette(M.current_theme)

	-- Создаем все цвета
	for name, hex in pairs(c) do
		Color.new(name, hex)
	end

	local apply_groups = require("muyrux.groups")
	apply_groups(c, M.transparent)
end

-- Смена темы
function M.toggle_theme()
	if M.current_theme == "light" then
		M.current_theme = "dark"
	else
		M.current_theme = "light"
	end
	M.apply_groups()
end

-- Смена прозрачности
function M.toggle_transparent()
	if M.transparent == nil then
		M.transparent = true
	else
		M.transparent = not M.transparent
	end
	M.apply_groups()
end

-- Команды
vim.api.nvim_create_user_command("muyruxToggleTheme", function()
	M.toggle()
end, {})
vim.api.nvim_create_user_command("muyruxToggleTransparent", function()
	M.toggle_transparent()
end, {})

return M
