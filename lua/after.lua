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
  for i, terminal in ipairs(require('toggleterm.terminal').get_all()) do
    if i == 11 then
      break
    end

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

-- LSP commands
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'grt')
vim.keymap.set('n', 'gn', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set({ 'n', 'x' }, 'ga', vim.lsp.buf.code_action, { desc = 'Goto code action' })
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = 'Goto references' })
vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, { desc = 'Goto implementation' })
vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = 'Goto definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Goto declaration' })
vim.keymap.set('n', 'gO', require('telescope.builtin').lsp_document_symbols, { desc = 'Open Document Symbols' })
vim.keymap.set('n', 'gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = 'Open Workspace Symbols' })
vim.keymap.set('n', 'gt', require('telescope.builtin').lsp_type_definitions, { desc = 'Goto type definition' })
