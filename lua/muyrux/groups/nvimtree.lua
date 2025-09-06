local colorbuddy = require("colorbuddy.init")
local Group = colorbuddy.Group
local g = colorbuddy.groups

local module = {}

function module.setup()
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
end

return module
