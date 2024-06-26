return {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require 'auto-session'

    auto_session.setup {
      -- don't save when it's just the dashboard, or a nvim-notify buffer
      bypass_session_save_file_types = { 'alpha', 'notify' },
      auto_restore_enabled = true,
      auto_save_enabled = true,

      -- auto_restore_lazy_delay_enabled = true,
      -- close_unsupported_windows = true,
      -- log_level = 'debug',

      auto_session_suppress_dirs = { '~/', '~/Downloads', '~/Documents', '~/Desktop' },
      session_lens = {
        -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
        load_on_setup = true,
        theme_conf = { border = true },
      },
      -- cwd_change_handling = {
      --   restore_upcoming_session = true,
      -- },

      pre_save_cmds = {
        function()
          -- Close any tabs with these filetypes
          local fts_to_match = { 'Diffview' }

          -- Auto-session close unsupported will only close the DiffView window, I want to close
          -- the whole tab
          -- Look for any windows with buffers that match fts_to_match
          local function should_close_tab(tabpage)
            local windows = vim.api.nvim_tabpage_list_wins(tabpage)
            for _, window in ipairs(windows) do
              local buffer = vim.api.nvim_win_get_buf(window)
              local filetype = vim.api.nvim_get_option_value('filetype', { buf = buffer })
              for _, v in ipairs(fts_to_match) do
                if string.find(filetype, '^' .. v) then
                  return true
                end
              end
            end
            return false
          end

          -- Close any tabs that have the filetypes in fts_to_match
          local tabpages = vim.api.nvim_list_tabpages()
          for _, tabpage in ipairs(tabpages) do
            if should_close_tab(tabpage) then
              local tabNr = vim.api.nvim_tabpage_get_number(tabpage)
              vim.cmd('tabclose ' .. tabNr)
            end
          end
        end,
      },
    }
    local keymap = vim.keymap
    -- restore last workspace session for current directory
    keymap.set('n', '<leader>wr', require('auto-session.session-lens').search_session, { desc = '[W]orkspace [R]estore session' })

    -- save workspace session for current working directory
    keymap.set('n', '<leader>ws', '<cmd>SessionSave<CR>', { desc = '[W]orkspace [S]ave session root dir' })

    -- keymap.set('n', '<leader>sW', require('auto-session.session-lens').search_session, {
    --   desc = 'Search [W]orkspace session',
    --   noremap = true,
    -- })
  end, -- Close any Neogit/Diffview windows
}
