local opt = vim.opt
local g = vim.g

opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.completeopt = { "menu", "menuone", "noselect" }

opt.laststatus = 3
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.smartcase = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

opt.number = true
opt.numberwidth = 2
opt.ruler = false

opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- Download files to ~/.local/share/nvim/site/spell
-- http://ftp.vim.org/vim/runtime/spell/
opt.spell = true
opt.spelllang = { "en_us", "ru" }

g.mapleader = " "
