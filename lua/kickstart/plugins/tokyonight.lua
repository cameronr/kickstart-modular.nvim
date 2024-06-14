return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      style = 'night',
      styles = {
        comments = { italic = false },
      },
      lualine_bold = true,
      -- on_highlights = function(hl, colors)
      --   hl.IblIndent = {
      --     fg = '#1f2335',
      --   }
      -- end,
    },

    init = function()
      -- Activate the colorscheme here. Tokyonight will pick the right style as set above
      vim.cmd.colorscheme 'tokyonight'

      -- You can configure highlights by doing something like:
      -- Setting italic to false in styles.comments above accomplishes the same thing
      -- vim.cmd.hi 'Comment gui=none'

      -- Use bg.dark for the cursor line background to make it more subtle
      vim.cmd.hi 'CursorLine guibg=#1f2335'

      -- Make IndentBlankLines indent markers much fainter (bg_dark in tokyonight)
      vim.cmd.hi 'IblIndent guifg=#1f2335'

      -- Brighter git colors in LuaLine
      vim.cmd.hi 'LuaLineDiffAdd guifg=#2e9e98'
      vim.cmd.hi 'LuaLineDiffChange guifg=#7aa2f7'
      vim.cmd.hi 'LuaLineDiffDelete guifg=#f25a64'

      -- Could use the below to make both Lualine and Gitsigns brighter
      -- vim.cmd.hi 'GitSignsAdd guifg=#2e9e98'
      -- vim.cmd.hi 'GitSignsChange guifg=#7aa2f7'
      -- vim.cmd.hi 'GitSignsDelete guifg=#f25a64'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
