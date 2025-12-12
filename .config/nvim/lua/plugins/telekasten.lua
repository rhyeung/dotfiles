return {
  {
    'renerocksai/telekasten.nvim',
    -- Keep the dependencies list as it is correct
    dependencies = {'nvim-telescope/telescope.nvim'},
    
    -- The setup call must be wrapped in a function assigned to the 'config' key.
    config = function()
      require('telekasten').setup(
        {
          -- Set the home directory for your notes
          home = vim.fn.expand("~/zettelkasten"),
          
          -- You can add other configurations here if needed, 
          -- such as specifying the file extension or markdown syntax.
        }
      )
      
      -- You can also add keymaps for the plugin here
      -- vim.keymap.set('n', '<leader>tk', '<cmd>Telekasten find_notes<CR>', { desc = "Find Zettel" })
    end,
  },
}
