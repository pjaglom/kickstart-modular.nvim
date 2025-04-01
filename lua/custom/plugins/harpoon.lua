return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup {}
      -- REQUIRED

      -- Existing keymaps
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Add current buffer to harpoon ' })

      vim.keymap.set('n', '<C-1>', function()
        harpoon:list():select(1)
      end, { desc = 'Switch to harpoon buffer 1' })
      vim.keymap.set('n', '<C-2>', function()
        harpoon:list():select(2)
      end, { desc = 'Switch to harpoon buffer 2' })
      vim.keymap.set('n', '<C-3>', function()
        harpoon:list():select(3)
      end, { desc = 'Switch to harpoon buffer 3' })
      vim.keymap.set('n', '<C-4>', function()
        harpoon:list():select(4)
      end, { desc = 'Switch to harpoon buffer 4' })

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end, { desc = 'Switch to previous harpoon buffer' })
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end, { desc = 'Switch to next harpoon buffer' })

      -- Telescope integration
      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      vim.keymap.set('n', '<C-e>', function()
        toggle_telescope(harpoon:list())
      end, { desc = 'Open harpoon window' })
    end,
  },
}
