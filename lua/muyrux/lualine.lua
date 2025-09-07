local module = {}

function module.setup(c, bg)
	vim.print(">>> COLORS >>>")
	vim.print(c.blue)
	vim.print(c.green)
	vim.print("Transparent:", bg)
	return {
		normal = {
			a = { bg = c.blue, fg = c.black },
			b = { bg = bg, fg = c.blue },
			c = { bg = bg, fg = c.base },
		},
		insert = {
			a = { bg = c.green, fg = bg },
			b = { bg = bg, fg = c.green },
		},
		command = {
			a = { bg = c.orange, fg = bg },
			b = { bg = bg, fg = c.orange },
		},
		visual = {
			a = { bg = c.purple, fg = bg },
			b = { bg = bg, fg = c.purple },
		},
		replace = {
			a = { bg = c.red, fg = c.bg },
			b = { bg = c.bg, fg = c.red },
		},
		terminal = {
			a = { bg = c.pink, fg = bg },
			b = { bg = bg, fg = c.pink },
		},
		inactiv = {
			a = { bg = bg, fg = c.base },
			b = { bg = bg, fg = c.base, gui = "bold" },
			c = { bg = bg, fg = c.base },
		},
	}
end

return module
