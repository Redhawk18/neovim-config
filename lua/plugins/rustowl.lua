{
  'cordx56/rustowl',
  version = '*',
  -- build = 'cargo install rustowl',
  lazy = false,
  opts = {
    auto_enable = false,
    idle_time = 300,
    highlight_style = 'underline',
    colors = {
      outlive = '#ff0000', -- Bright red for errors
    },
    client = {
      on_attach = function(_, buffer)
        vim.keymap.set('n', '<leader>ro', function()
          require('rustowl').toggle(buffer)
        end, { buffer = buffer, desc = 'Toggle RustOwl' })

        vim.keymap.set('n', '<leader>re', function()
          require('rustowl').enable(buffer)
        end, { buffer = buffer, desc = 'Enable RustOwl' })

        vim.keymap.set('n', '<leader>rd', function()
          require('rustowl').disable(buffer)
        end, { buffer = buffer, desc = 'Disable RustOwl' })
      end
    },
  },
}
