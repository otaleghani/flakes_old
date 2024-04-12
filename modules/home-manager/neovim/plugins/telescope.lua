local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').setup {
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = { height = 999, width = 999 },
    file_ignore_patterns = { 'node%_modules/.*', 'node_modules', '.git', '.sst', '.next' }
    -- file_ignore_patterns = { 'node%_modules/.*', '.git', '.next', 'node_modules' }
  },

  pickers = {
    find_files = {
      prompt_title = '',
      results_title = '',
      preview_title = '',
      borderchars = {
        prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      width = 0.8,
    },
  },

  extensions = {}
}
