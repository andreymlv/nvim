require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {}, -- Adds pretty icons to your documents
		["core.dirman"] = {
			config = {
				workspaces = {
					work = "/mnt/hdd/Notes/Work",
					home = "/mnt/hdd/Notes/Home",
				},
			},
		},
	},
})
