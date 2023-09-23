local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
require('telescope').setup({
  defaults = {
    preview = false,
    mappings = {
      n = {
        ["<C-f>"] = action_layout.toggle_preview
      },
      i = {
        ["<esc>"] = actions.close,
        ["<C-f>"] = action_layout.toggle_preview,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_next,
      }
    }
  },
  pickers = {
    find_files = {
      theme = "ivy"
    },
    git_files = {
      theme = "ivy"
    },
    live_grep = {
      theme = "ivy"
    },
    grep_string = {
      theme = "ivy"
    },
    current_buffer_fuzzy_find = {
      theme = "ivy"
    }
  }
})


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function() builtin.find_files({hidden=true, no_ignore=true}) end, {})
vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ss', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
vim.keymap.set('n', '<leader>,', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
