return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'zapling/mason-conform.nvim',
        -- setup is conditionally called in lspconfig.lua so don't set any opts = {} here
      },
    },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      -- Confirm for formatters
      formatters = {
        yamlfix = {
          env = {
            YAMLFIX_SEQUENCE_STYLE = 'block_style',
            YAMLFIX_preserve_quotes = 'true',
          },
        },
      },
      --
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'isort', 'black' },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = { { 'prettierd', 'prettier' } },
        typescript = { { 'prettierd', 'prettier' } },
        javascriptreact = { { 'prettierd', 'prettier' } },
        typescriptreact = { { 'prettierd', 'prettier' } },
        svelte = { { 'prettierd', 'prettier' } },
        css = { { 'prettierd', 'prettier' } },
        html = { { 'prettierd', 'prettier' } },
        json = { { 'prettierd', 'prettier' } },
        yaml = { { 'prettierd', 'prettier' } },
        markdown = { { 'prettierd', 'prettier' } },
        graphql = { { 'prettierd', 'prettier' } },
        liquid = { { 'prettierd', 'prettier' } },

        sh = { 'beautysh' },
        zsh = { 'beautysh' },
        -- yaml = { 'yamlfix' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
