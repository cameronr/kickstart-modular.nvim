return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    local custom_tokyonight = require 'lualine.themes.tokyonight'

    -- Use bg_dark for the b section background
    custom_tokyonight.normal.b.bg = '#1f2335'
    custom_tokyonight.insert.b.bg = '#1f2335'
    custom_tokyonight.command.b.bg = '#1f2335'
    custom_tokyonight.visual.b.bg = '#1f2335'
    custom_tokyonight.replace.b.bg = '#1f2335'

    require('lualine').setup {
      options = {
        theme = custom_tokyonight,
      },
    }
  end,
}
