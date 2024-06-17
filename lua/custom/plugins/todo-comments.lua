return {
  'folke/todo-comments.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local todo_comments = require 'todo-comments'

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set('n', '<leader>ct', function()
      todo_comments.jump_next()
    end, { desc = '[C]ode next [T]odo comment' })

    keymap.set('n', '<leader>cT', function()
      todo_comments.jump_prev()
    end, { desc = '[C]ode previous [T]odo comment' })

    todo_comments.setup()
  end,
}
