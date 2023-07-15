require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "ellisonleao/gruvbox.nvim",        priority = 1000 },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "jose-elias-alvarez/null-ls.nvim",
    build = ":MasonUpdate",
  },
  {
    "kkoomen/vim-doge",
    build = ":call doge#install()",
  },
  { "lewis6991/gitsigns.nvim" },
  { "nvim-lualine/lualine.nvim" },
  {
    "peterhoeg/vim-qml",
    event = "BufRead",
    ft = { "qml" },
  },
  {
    "peterhoeg/vim-qml",
    event = "BufRead",
    ft = { "qml" },
  },
  { "numToStr/Comment.nvim" },
})
