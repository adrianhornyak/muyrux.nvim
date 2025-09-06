local colorbuddy = require("colorbuddy.init")
local Group = colorbuddy.Group
local g = colorbuddy.groups

local module = {}

function module.setup()
	Group.link("@type.builtin", g.User3)
	Group.link("@constant.builtin", g.User1)
	Group.link("@constructor", g.Special)
	Group.link("@exception.operator", g.Special)
	Group.link("@function.macro", g.Normal)
	Group.link("@namespace", g.Normal)
	Group.link("@punctuation.special", g.Normal)
	Group.link("@keyword.storage", g.User2)
	Group.link("@type.qualifier", g.Normal)
	Group.link("@variable", g.Normal)
	Group.link("@variable.builtin", g.String)
end

return module
