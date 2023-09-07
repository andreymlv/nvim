require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          work = "/hdd/Notes/Work",
          home = "/hdd/Notes/Home",
          tstu = "/hdd/Notes/TSTU",
        },
      },
    },
  },
})
