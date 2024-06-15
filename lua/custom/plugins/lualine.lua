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

    -- Show LSP status, borrowed from Heirline cookbook
    -- https://github.com/rebelot/heirline.nvim/blob/master/cookbook.md#lsp
    local function lualine_lsp_status()
      local haveServers = false
      local names = {}
      for i, server in pairs(vim.lsp.get_clients { bufnr = 0 }) do
        -- msg = ' '
        haveServers = true
        table.insert(names, server.name)
      end
      if not haveServers then
        return ''
      end
      return ' ' .. table.concat(names, ',')
    end

    local opts = {
      options = {
        theme = custom_tokyonight,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { lualine_lsp_status, 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      extensions = {
        'fzf',
        'lazy',
        'mason',
        'quickfix',
        'neo-tree',
        'nvim-dap-ui',
        'trouble',
      },
    }

    require('lualine').setup(opts)
  end,
}
