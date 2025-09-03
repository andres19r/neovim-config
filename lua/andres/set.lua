local api = vim.api

vim.o.background = "dark"

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim.undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.handlebars", command = "set filetype=html" })
-- api.nvim_create_autocmd(
--   { "BufWritePre" },
--   { command = "Neoformat" }
-- )
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
