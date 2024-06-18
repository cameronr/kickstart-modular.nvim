return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- Set header
    dashboard.section.header.val = {
      '                                                     ',
      '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
      '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
      '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
      '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
      '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
      '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
      '                                                     ',
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button('e', '  New File', '<cmd>ene<CR>'),
      dashboard.button('SPC sf', '󰱼  Open Files'),
      dashboard.button('SPC sg', '  Search files'),
      dashboard.button('SPC s.', '󱑎  Recent Files'),
      dashboard.button('SPC n', '󰊢  Neogit'),
      dashboard.button('r', '󰁯  Restore Session For Current Directory', '<cmd>SessionRestore<CR>'),
      dashboard.button('u', '  Update plugins', '<cmd>Lazy sync<CR>'),
      dashboard.button('m', '  Install language tools', '<cmd>Mason<CR>'),
      dashboard.button('c', '  Edit configuration', ':e init.lua | :cd ~/.config/nvim<CR>'),
      dashboard.button('q', '󰩈  Quit NVIM', '<cmd>qa<CR>'),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
