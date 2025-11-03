local builtin = require 'telescope.builtin'
local whichkey = require 'which-key'

-- Groups
whichkey.add {
  { '<leader>f', group = 'Find' },
  { '<leader>c', group = 'Code' },
  { '<leader>g', group = 'Git' },
  { '<leader>b', group = 'Buffer' },
  { '<leader>w', group = 'Window' },
}

-- Root commands
vim.keymap.set({ 'n' }, '<Leader>e', function()
  local MiniFiles = require 'mini.files'
  local buffer_name = vim.api.nvim_buf_get_name(0)
  local in_starter = buffer_name:find 'ministarter' ~= nil

  if in_starter then
    MiniFiles.open()
    MiniFiles.reveal_cwd()
    return
  end

  local _ = MiniFiles.close() or MiniFiles.open(buffer_name, false)
  vim.schedule(MiniFiles.reveal_cwd)
end, { desc = 'Explore files' })
vim.keymap.set('n', '<Leader>/', builtin.live_grep, { desc = 'Find text' })
vim.keymap.set('n', '<Leader><Leader>', builtin.find_files, { desc = 'Find file' })
vim.keymap.set('n', '<Leader>q', '<Cmd>qa<Cr>', { desc = 'Quit all buffers' })

-- Terminal stuff
vim.keymap.set('n', '<Leader>t', '<Cmd>ToggleTerm<Cr>', { desc = 'Terminal' })
vim.keymap.set({ 'x', 'n', 's', 'i' }, '<C- >', function()
  for _, terminal in ipairs(require('toggleterm.terminal').get_all()) do
    if terminal:is_open() and terminal:is_focused() then
      vim.cmd 'wincmd p' -- go to last window
      return
    end

    if not terminal:is_open() then
      terminal:open()
    end

    -- if not terminal:is_focused() then
    terminal:focus()
    -- end

    return
  end

  return require('toggleterm').toggle()
end, { desc = 'Terminal test' })

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
