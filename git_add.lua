#!/usr/bin/env lua

local targets = {
	".gitignore",
	"git_add.lua", -- This script gets VC'd
	".config/nvim/init.lua",
	".config/nvim/lua",
	".config/fish",
	".config/wezterm",
	".config/kitty",
	".config/alacritty",
	".config/paru",
}

for _, target in ipairs(targets) do
	os.execute("git add -f " .. os.getenv("HOME") .. "/" .. target)
end
