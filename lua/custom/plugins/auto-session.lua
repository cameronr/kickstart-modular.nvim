return {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require 'auto-session'

    auto_session.setup {
      -- don't save when it's just the dashboard, or a nvim-notify buffer
      bypass_session_save_file_types = { 'alpha', 'notify' },
      auto_restore_enabled = true,
      auto_save_enabled = true,

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
          vim.cmd 'Neotree close'
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
  end,
}
