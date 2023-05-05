return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-telescope/telescope-ui-select.nvim'
  },
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find File' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>',  desc = 'Live Grep' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>',    desc = 'Find Buffer' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>',  desc = 'Find Help' }
  },
  init = function()
    local telescope = require('telescope')
    telescope.setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown({})
        }
      }
    }

    telescope.load_extension('ui-select')
  end
}
