return {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require 'auto-session'

    auto_session.setup {
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { '~/', '~/Downloads', '~/Documents', '~/Desktop' },
    }

    local keymap = vim.keymap
    -- restore last workspace session for current directory
    keymap.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', { desc = '[W]orkspace [R]estore session for cwd' })

    -- save workspace session for current working directory
    keymap.set('n', '<leader>ws', '<cmd>SessionSave<CR>', { desc = '[W]orkspace [S]ave session root dir' })
  end,
}