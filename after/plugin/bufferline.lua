vim.opt.termguicolors = true
require("bufferline").setup {}
vim.keymap.set('n', '<S-l>', ":BufferLineCycleNext<CR>", {})
vim.keymap.set('n', '<S-h>', ":BufferLineCyclePrev<CR>", {})
