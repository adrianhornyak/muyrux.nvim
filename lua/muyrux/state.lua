local vim = vim
local M = {}
local path = vim.fn.stdpath("data") .. "/muyrux_state.json"

M.background = vim.o.background
M.transparent = nil

-- Сохраняем состояние
function M.save()
	local data = {
		background = M.background or "dark",
		transparent = M.transparent,
	}
	local encoded = vim.fn.json_encode(data)
	local f = io.open(path, "w")
	if f then
		f:write(encoded)
		f:close()
	end
end

-- Загружаем состояние
function M.load()
	local f = io.open(path, "r")
	if f then
		local content = f:read("*a")
		f:close()
		local ok, data = pcall(vim.fn.json_decode, content)
		if ok and data then
			M.background = data.background or "dark"
			M.transparent = data.transparent
		end
	end
	return M.background, M.transparent
end

return M
