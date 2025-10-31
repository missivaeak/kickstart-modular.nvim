return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      local logo = [[
                                        ████                                
                                    ████▒▒██                                
                                  ████  ▒▒██                                
                                ██▒▒  ▒▒▒▒▒▒██                              
                              ██▒▒██        ██                              
  ████                      ██▒▒██          ██                              
██▒▒▒▒██████                ██▒▒██      ▒▒  ████                            
██▒▒▒▒██    ████      ██████▒▒▒▒▒▒██    ▒▒▒▒██████████████                  
██▒▒    ████▒▒▒▒██████▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒▒▒▒▒████              
██▒▒▒▒      ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██            
  ██▒▒      ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒████        
  ██        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██      
  ██▒▒    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██    
  ██▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██    
    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    ██▒▒▒▒▒▒▒▒▒▒████▒▒▒▒▒▒▒▒██  
    ████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██      ██▒▒▒▒▒▒████▒▒▒▒▒▒▒▒▒▒▒▒██  
    ██▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██        ██▒▒▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██  
      ██▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██        ██████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██  
      ██▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██      ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██
        ████  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██
          ██    ▒▒██████▒▒▒▒▒▒▒▒▒▒▒▒▒▒    ██▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██
          ██            ████▒▒▒▒▒▒▒▒▒▒    ██  ▒▒  ▒▒        ▒▒▒▒▒▒▒▒▒▒▒▒██  
            ██                      ██  ████  ▒▒          ▒▒▒▒▒▒▒▒▒▒▒▒▒▒██  
              ██                      ██▒▒██              ▒▒  ▒▒▒▒▒▒▒▒▒▒██  
                ██████████████████████▒▒▒▒██                    ▒▒▒▒▒▒██    
                      ██▒▒      ██▒▒▒▒▒▒▒▒██                    ▒▒▒▒██      
                      ██▒▒▒▒  ██▒▒▒▒▒▒▒▒████                  ▒▒▒▒██        
                      ██▒▒▒▒▒▒██▒▒▒▒▒▒██  ██                    ██          
                        ██████▒▒▒▒▒▒██    ██                ████            
                              ██████      ██          ██████                
                                            ██    ████                      
                                            ██████                          
]]
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      -- require('mini.sessions').setup {
      --   -- Whether to read latest session if Neovim opened without file arguments
      --   autoread = false,
      --   -- Whether to write current session before quitting Neovim
      --   autowrite = true,
      --   -- Directory where global sessions are stored (use `''` to disable)
      --   directory = '~/.vim/sessions', --<"session" subdir of user data directory from |stdpath()|>,
      --   -- dir = vim.fn.stdpath 'state' .. '/sessions',
      --   -- File for local session (use `''` to disable)
      --   file = '', -- 'Session.vim',
      --   verbose = { read = true, write = true, delete = true },
      -- }
      require('mini.surround').setup()
      require('mini.notify').setup()
      require('mini.starter').setup {
        header = logo,
        items = {
          function()
            local config = require 'persistence.config'
            local sessions = require('persistence').list()
            local items = {}
            local have = {}

            for _, session in ipairs(sessions) do
              if vim.uv.fs_stat(session) then
                local file = session:sub(#config.options.dir + 1, -5)
                vim.print('file ' .. file)
                local dir = unpack(vim.split(file, '%%', { plain = true }))
                vim.print('dir ' .. dir)
                dir = dir:gsub('%%', '/') .. '/'
                if jit.os:find 'Windows' then
                  dir = dir:gsub('^(%w)/', '%1:/')
                end

                if vim.fn.filereadable(dir) then
                end

                if not have[dir] then
                  have[dir] = true
                  local name = (dir:match '([^/]+)/*$' or '') .. string.format(' (%s)', dir:match '(.+)/[^/]+/*$' or '')
                  items[#items + 1] = {
                    section = 'Sessions',
                    name = name,
                    action = function()
                      vim.cmd('cd ' .. dir)
                      require('persistence').load()
                    end,
                  }
                end
              end
            end

            return items
          end,
          -- require('mini.starter').sections.sessions(),
          require('mini.starter').sections.recent_files(10, false),
        },
        footer = [[ ]],
        content_hooks = {
          require('mini.starter').gen_hook.adding_bullet '› ',
          function(content)
            -- Coords
            local starter = require 'mini.starter'
            local header_coords = starter.content_coords(content, 'header')
            local section_coords = starter.content_coords(content, 'section')
            local item_coords = starter.content_coords(content, 'item')
            local footer_coords = starter.content_coords(content, 'footer')

            -- Lines
            local header_width = math.max(unpack(vim.tbl_map(function(c)
              local line = content[c.line][c.unit].string
              return vim.fn.strdisplaywidth(line)
            end, header_coords)))
            local section_width = math.max(unpack(vim.tbl_map(function(c)
              local line = content[c.line][c.unit].string
              return vim.fn.strdisplaywidth(line)
            end, section_coords)))
            local item_width = math.max(unpack(vim.tbl_map(function(c)
              local line = content[c.line][c.unit].string
              return vim.fn.strdisplaywidth(line)
            end, item_coords)))
            local footer_width = math.max(unpack(vim.tbl_map(function(c)
              local line = content[c.line][c.unit].string
              return vim.fn.strdisplaywidth(line)
            end, footer_coords)))
            local max_width = math.max(header_width, section_width, item_width, footer_width)

            for _, line in ipairs(content) do
              if not (#line == 0 or (#line == 1 and line[1].string == '')) then
                local line_str = ''
                local line_types = {}
                for _, unit in ipairs(line) do
                  line_str = line_str .. unit.string
                  table.insert(line_types, unit.type)
                end
                local line_width = 0
                for _, type in ipairs(line_types) do
                  if type == 'item' or type == 'section' then
                    line_width = math.max(item_width, section_width)
                  elseif type == 'header' then
                    line_width = header_width
                  elseif type == 'footer' then
                    line_width = footer_width
                  end
                end
                local left_pad = string.rep(' ', (max_width - line_width) * 0.5)

                table.insert(line, 1, { string = left_pad, type = 'empty' })
              end
            end
            return content
          end,
          require('mini.starter').gen_hook.aligning('center', 'center'),
        },
      }
      require('mini.files').setup {
        mappings = {
          close = 'q',
          go_in = '<Right>',
          go_in_plus = '<S-Right>',
          go_out = '<Left>',
          go_out_plus = '<S-Left>',
          mark_goto = "'",
          mark_set = 'm',
          reset = '<BS>',
          reveal_cwd = '@',
          show_help = 'g?',
          synchronize = '=',
          trim_left = '<',
          trim_right = '>',
        },
      }

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
