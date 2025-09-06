local M = {}

-- default state
M.background = vim.o.background
M.transparent = false

-- сохраняем состояние в файл
function M.save()
	local path = vim.fn.stdpath("config") .. "/lua/muyrux/state.lua"
	local content =
		string.format("return { background = '%s', transparent = %s }", M.background, tostring(M.transparent))
	vim.fn.writefile(vim.split(content, "\n"), path)
end

-- загружаем состояние
function M.load()
	local path = vim.fn.stdpath("config") .. "/lua/muyrux/state.lua"
	if vim.fn.filereadable(path) == 1 then
		local ok, data = pcall(dofile, path)
		if ok and data then
			M.background = data.background or vim.o.background
			M.transparent = data.transparent or false
		end
	end
	return M.background, M.transparent
end

return M
