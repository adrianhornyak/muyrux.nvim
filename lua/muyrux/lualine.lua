local module = {}

function module.setup(colors, background)
	local c = colors
	local blue = c.blue:to_vim()
	local green = c.green:to_vim()
	local orange = c.orange:to_vim()
	local purple = c.purple:to_vim()
	local red = c.red:to_vim()
	local black = c.black:to_vim()
	local base = c.base:to_vim()
	local bg = background

	return {
		normal = {
			a = { bg = blue, fg = black },
			b = { bg = bg, fg = blue },
			c = { bg = bg, fg = base },
		},
		insert = {
			a = { bg = green, fg = bg },
			b = { bg = bg, fg = green },
		},
		command = {
			a = { bg = orange, fg = bg },
			b = { bg = bg, fg = orange },
		},
		visual = {
			a = { bg = purple, fg = bg },
			b = { bg = bg, fg = purple },
		},
		replace = {
			a = { bg = red, fg = bg },
			b = { bg = bg, fg = red },
		},
		terminal = {
			a = { bg = pink, fg = bg },
			b = { bg = bg, fg = pink },
		},
		inactiv = {
			a = { bg = bg, fg = base },
			b = { bg = bg, fg = base, gui = "bold" },
			c = { bg = bg, fg = base },
		},
	}
end

return module
