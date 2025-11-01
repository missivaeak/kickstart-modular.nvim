local builtin = require 'telescope.builtin'
local whichkey = require 'which-key'

-- Groups
whichkey.add {
  { '<leader>f', group = 'Find' },
  { '<leader>c', group = 'Code' },
  { '<leader>g', group = 'Git' },
  { '<leader>b', group = 'Buffer' },
  { '<leader>t', group = 'Tab' },
  { '<leader>w', group = 'Window' },
}

-- Root commands
vim.keymap.set({ 'n' }, '<Leader>e', require('mini.files').open, { desc = 'Explore files' })
vim.keymap.set('n', '<Leader>/', builtin.live_grep, { desc = 'Find text' })
vim.keymap.set('n', '<Leader><Leader>', builtin.find_files, { desc = 'Find file' })
vim.keymap.set('n', '<Leader>t', '<Cmd>ToggleTerm<Cr>', { desc = 'Terminal' })

-- Buffer commands
vim.keymap.set({ 'n' }, '<Leader>bd', '<Cmd>bd<Cr>', { desc = 'Delete buffer' })
vim.keymap.set({ 'n' }, '<Leader>bo', '<Cmd>1,.-bdelete<Cr><Cmd>.+,$bdelete<Cr>', { desc = 'Delete other buffers' })
vim.keymap.set({ 'n' }, '<Leader>bb', '<Cmd>b#<Cr>', { desc = 'Open last buffer' })

-- Window commands
vim.keymap.set({ 'n' }, '<Leader>wd', '<Cmd>q<Cr>', { desc = 'Delete window' })
vim.keymap.set({ 'n' }, '<Leader>wo', '<Cmd>only<Cr>', { desc = 'Delete other windows' })
vim.keymap.set({ 'n' }, '<Leader>ww', '<Cmd>wincmd p<Cr>', { desc = 'Open last window' })

-- Find commands
vim.keymap.set('n', '<Leader>fb', builtin.buffers, { desc = 'Find buffer' })
vim.keymap.set('n', '<Leader>fd', builtin.diagnostics, { desc = 'Find diagnostic' })
vim.keymap.set('n', '<Leader>fr', builtin.oldfiles, { desc = 'Find recent file' })
vim.keymap.set('n', '<Leader>fk', builtin.keymaps, { desc = 'Find keymap' })
vim.keymap.set('n', '<Leader>f/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Find text (open files)',
  }
end, { desc = 'Grep open files' })
vim.keymap.set('n', '<Leader>fs', require('persistence').select, { desc = 'Find session' })
