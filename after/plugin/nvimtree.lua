require("nvim-tree").setup({
  view = {
    width = {}
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
})

vim.keymap.set("n", "<leader>.", "<cmd>:NvimTreeFindFile<CR>")
