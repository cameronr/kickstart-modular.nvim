return {
  'karb94/neoscroll.nvim',
  config = function()
    require('neoscroll').setup {}
    local neoscroll = require 'neoscroll'
    vim.keymap.set('n', '<PageUp>', function()
      neoscroll.ctrl_u { duration = 200 }
    end)
    vim.keymap.set('n', '<PageDown>', function()
      neoscroll.ctrl_d { duration = 200 }
    end)
  end,
}
