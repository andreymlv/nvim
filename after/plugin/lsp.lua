vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set({ "n", "v" }, "<space>la", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<space>lf", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  }),
})

local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
lspconfig.clangd.setup({
  capabilities = lsp_capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
})
lspconfig.pyright.setup({})
lspconfig.lua_ls.setup({})
lspconfig.nil_ls.setup({})
lspconfig.texlab.setup({
  settings = {
    texlab = {
      build = {
        onSave = true,
      },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
      chktex = {
        onEdit = true,
        onOpenAndSave = true,
      },
    },
  },
})
lspconfig.marksman.setup({})
lspconfig.qmlls.setup({
  cmd = { "qmlls6" },
  filetypes = { "qmljs", "qml" },
})
lspconfig.zls.setup({})

local null_ls = require("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.latexindent,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.latexindent,
    null_ls.builtins.formatting.nixpkgs_fmt,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.qmlformat,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.stylua,

    null_ls.builtins.diagnostics.chktex,
    null_ls.builtins.diagnostics.qmllint,
    null_ls.builtins.diagnostics.typos,

    null_ls.builtins.hover.dictionary,
    null_ls.builtins.hover.printenv,
  },
})
