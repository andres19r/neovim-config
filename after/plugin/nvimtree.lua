require("nvim-tree").setup({
	view = {
		width = {},
	},
	update_focused_file = {
		enable = true,
		update_root = false,
		ignore_list = {},
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
})

vim.keymap.set("n", "<leader>e", "<cmd>:NvimTreeFindFile<CR>")
