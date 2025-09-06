local vim = vim
local M = {}
local path = vim.fn.stdpath("data") .. "/muyrux_state.json"

M.background = vim.o.background
M.transparent = nil

function M.save()
	local data = {
		background = M.background,
		transparent = M.transparent,
	}
	local encoded = vim.fn.json_encode(data)
	vim.fn.writefile(vim.split(encoded, "\n"), path)
end

function M.load()
	if vim.fn.filereadable(path) == 1 then
		local lines = vim.fn.readfile(path)
		local content = table.concat(lines, "\n")
		local ok, data = pcall(vim.fn.json_decode, content)
		if ok and data then
			M.background = data.background or vim.o.background
			M.transparent = data.transparent
		end
	end
	return M.background, M.transparent
end

return M
