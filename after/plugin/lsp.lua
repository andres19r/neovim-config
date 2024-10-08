local lsp_zero = require('lsp-zero').preset({})
local cmp = require('cmp')
local navbuddy = require("nvim-navbuddy")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local lspkind = require('lspkind')

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
  if client.server_capabilities.documentSymbolProvider then
    require('nvim-navic').attach(client, bufnr)
  end
  -- navbuddy.attach(client, bufnr)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>cR", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>cw", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>cd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['prettier'] = { 'javascript', 'typescript', 'css', 'scss', 'html' },
  }
})

--lsp.setup_servers({'tsserver', 'eslint', 'pyright'})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())

lsp_zero.setup()

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      -- maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                     -- can also be a function to dynamically calculate max width such as 
                     -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  },
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = {
    -- `Enter` key to confirm completion
    ['<Tab>'] = cmp.mapping.confirm({ select = false }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-i>'] = cmp.mapping.complete(),
  }
})
