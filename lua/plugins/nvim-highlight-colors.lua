return {
  'brenoprata10/nvim-highlight-colors',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    render = 'virtual',
    virtual_symbol_position = 'eol',
    virtual_symbol_prefix = '',
    virtual_symbol = '⬤ ',
  },
  config = function(_, opts) require('nvim-highlight-colors').setup(opts) end,
}
