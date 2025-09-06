local colorbuddy = require("colorbuddy.init")
local Group = colorbuddy.Group
local g = colorbuddy.groups
local s = colorbuddy.styles

local module = {}

function module.setup(c)
	Group.link("fugitiveUnstagedModifier", g.TypeDef)
	Group.link("fugitiveStagedHeading", g.Warning)
	Group.link("fugitiveUntrackedHeading", g.Macro)
	Group.link("fugitiveUntrackedSection", g.Noise)
	Group.link("fugitiveUntrackedModifier", g.Noise)
	Group.new("diffadded", c.none, c.green, s.none)
	Group.new("diffremoved", c.none, c.red_light, s.none)
end

return module
