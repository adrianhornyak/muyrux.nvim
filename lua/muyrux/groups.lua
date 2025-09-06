local colorbuddy = require("colorbuddy.init")
local Group = colorbuddy.Group
local Color = colorbuddy.Color
local g = colorbuddy.groups
local s = colorbuddy.styles

local M = {}

function M.apply_groups(c, transparent)
	local bg = transparent and Color.new("Transparent", nil) or c.base

	-- Custom groups
	Group.new("Noise", c.pink, bg, s.none)

	-- Basic groups
	Group.new("Comment", c.dark, bg, s.none)
	Group.new("Normal", c.black, bg, s.none)
	Group.new("NonText", c.light_grey, bg, s.none)
	Group.new("Error", c.red, bg, s.none)
	Group.new("Number", c.blue_dark, bg, s.none)
	Group.new("Special", c.purple, bg, s.none)
	Group.new("String", c.green_deep, bg, s.none)
	Group.new("Title", c.blue, bg, s.none)
	Group.new("Todo", c.pink, bg, s.none)
	Group.new("Warning", c.orange, bg, s.none)

	-- User groups
	Group.new("User1", c.pink, bg, s.none)
	Group.new("User2", c.blue, bg, s.none)
	Group.new("User3", c.pink, bg, s.none)

	-- Diff
	Group.new("Added", g.Normal, c.green, s.none)
	Group.new("Changed", g.Normal, c.blue_dark, s.none)
	Group.new("Removed", g.Normal, c.red_light, s.none)

	-- Search and highlight
	Group.new("MatchParen", g.Normal, bg, s.underline)
	Group.new("CurSearch", c.pink, bg, s.underline)
	Group.new("IncSearch", c.pink, bg, s.none)
	Group.new("Search", c.pink, bg, s.none)

	-- Pmenu
	Group.new("Pmenu", c.darker, bg, s.none)
	Group.new("PmenuSel", c.grey, bg, s.none)
	Group.new("PmenuThumb", c.brown, bg, s.none)
	Group.new("WildMenu", c.pink, bg, s.none)

	-- Statusline
	Group.new("StatusLine", c.none, bg, s.none)
	Group.new("StatusLineNC", c.black, bg, s.none)

	-- Visual
	Group.new("Visual", g.Normal, c.light_grey, s.none)
	Group.new("VisualNOS", g.Normal, c.light_grey, s.none)

	-- Quickfix
	Group.new("qffilename", g.Title, g.Title, s.none)

	-- Spelling
	Group.new("SpellBad", c.red, bg, s.undercurl)
	Group.new("SpellCap", c.orange, bg, s.undercurl)
	Group.new("SpellLocal", c.brown, bg, s.undercurl)
	Group.new("SpellRare", c.blue, bg, s.undercurl)

	-- Links
	Group.link("Constant", g.Normal)
	Group.link("Boolean", g.Number)
	Group.link("Character", g.Number)
	Group.link("Conditional", g.Normal)
	Group.link("Debug", g.Todo)
	Group.link("Delimiter", g.Normal)
	Group.link("Directory", g.String)
	Group.link("Exception", g.Normal)
	Group.link("Function", g.Special)
	Group.link("Identifier", g.Normal)
	Group.link("Include", g.Normal)
	Group.link("Keyword", g.Noise)
	Group.new("Label", g.Normal, g.Normal, g.Normal + s.bold)
	Group.link("Macro", g.User2)
	Group.link("Operator", g.Noise)
	Group.link("PreProc", g.Normal)
	Group.link("Repeat", g.Normal)
	Group.link("SpecialChar", g.Special)
	Group.link("SpecialKey", g.Special)
	Group.link("Statement", g.Normal)
	Group.link("StorageClass", g.Normal)
	Group.link("Structure", g.Normal)
	Group.link("Tag", g.Normal)
	Group.link("Type", g.User3)
	Group.link("TypeDef", g.User3)

	-- Treesitter
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

	-- UI
	Group.link("ErrorMsg", g.Error)
	Group.link("ModeMsg", g.Normal)
	Group.link("MoreMsg", g.Normal)
	Group.link("Question", g.Warning)
	Group.link("WarningMsg", g.Warning)
	Group.link("Conceal", g.Comment)
	Group.link("CursorLine", g.StatusLine)
	Group.link("ColorColumn", g.CursorLine)
	Group.link("CursorLineNr", g.Noise)
	Group.link("EndOfBuffer", g.Noise)
	Group.link("Folded", g.NonText)
	Group.link("LineNr", g.NonText)
	Group.link("FoldColumn", g.LineNr)
	Group.link("SignColumn", g.LineNr)
	Group.link("VertSplit", g.NonText)
	Group.link("Whitespace", g.NonText)
	Group.link("WinSeparator", g.NonText)
	Group.link("NormalFloat", g.Normal)
	Group.link("TabLine", g.Normal)
	Group.link("TabLineFill", g.Normal)
	Group.link("TabLineSel", g.Special)
	Group.link("NvimInternalError", g.Error)
	Group.link("FloatBorder", g.NonText)

	-- Diagnostics
	Group.new("DiagnosticUnderlineError", c.none, c.none, s.underline, c.red)
	Group.new("DiagnosticUnderlineWarn", c.none, c.none, s.underline, c.orange)
	Group.new("DiagnosticUnderlineHint", c.none, c.none, s.underline)
	Group.new("DiagnosticUnderlineInfo", c.none, c.none, s.underline)
	Group.link("DiagnosticError", g.Error)
	Group.link("DiagnosticWarn", g.Warning)
	Group.link("DiagnosticHint", g.Comment)
	Group.link("DiagnosticInfo", g.Comment)
	Group.link("DiagnosticOk", g.String)

	-- GitSigns
	Group.new("GitSignsAdd", c.green_light, bg, s.none)
	Group.new("GitSignsChange", c.orange, bg, s.none)
	Group.new("GitSignsDelete", c.red, bg, s.none)

	-- NvimTree
	Group.link("NvimTreeOpenedFolderName", g.Special)
	Group.link("NvimTreeFolderIcon", g.Special)
	Group.link("NvimTreeFolderName", g.Normal)
	Group.link("NvimTreeEmptyFolderName", g.Comment)
	Group.link("NvimTreeGitDirty", g.Warning)
	Group.link("NvimTreeGitFileDirtyHL", g.Normal)
	Group.link("NvimTreeGitFolderDirtyHL", g.Normal)
	Group.link("NvimTreeGitStaged", g.TypeDef)
	Group.link("NvimTreeGitFileStagedHL", g.Normal)
	Group.link("NvimTreeGitFolderStagedHL", g.Normal)
	Group.link("NvimTreeGitMerge", g.Error)
	Group.link("NvimTreeGitFileMergeHL", g.Normal)
	Group.link("NvimTreeGitFolderMergeHL", g.Normal)
	Group.link("NvimTreeGitRenamed", g.Changed)
	Group.link("NvimTreeGitFileRenamedHL", g.Normal)
	Group.link("NvimTreeGitFolderRenamedHL", g.Normal)
	Group.link("NvimTreeGitNew", g.String)
	Group.link("NvimTreeGitFileNewHL", g.Normal)
	Group.link("NvimTreeGitFolderNewHL", g.Normal)
	Group.link("NvimTreeGitDeleted", g.Error)
	Group.link("NvimTreeGitFileDeletedHL", g.Normal)
	Group.link("NvimTreeGitFolderDeletedHL", g.Normal)
	Group.link("NvimTreeGitIgnored", g.Comment)

	-- Telescope
	Group.link("TelescopeBorder", g.Noise)
	Group.link("TelescopeMatching", g.User1)
	Group.link("TelescopePromptCounter", g.Noise)

	-- Markdown
	Group.link("@markup.list.unchecked.markdown", g.Error)
	Group.link("@markup.list.checked.markdown", g.Number)
	Group.link("@markup.link.label.markdown_inline", g.Special)
	Group.link("@markup.link.url.markdown_inline", g.Noise)

	-- Fugitive
	Group.link("fugitiveUnstagedModifier", g.TypeDef)
	Group.link("fugitiveStagedHeading", g.Warning)
	Group.link("fugitiveUntrackedHeading", g.Macro)
	Group.link("fugitiveUntrackedSection", g.Noise)
	Group.link("fugitiveUntrackedModifier", g.Noise)
	Group.new("diffadded", c.none, c.green, s.none)
	Group.new("diffremoved", c.none, c.red_light, s.none)
end

return M
