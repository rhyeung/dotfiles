-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'sqwishy/vim-sqf-syntax',
  'mbbill/undotree',
  'tpope/vim-fugitive',
  'nvim-telescope/telescope-project.nvim',
  'dense-analysis/ale',
  'jonpas/vim-sqflint-ale',
  'direnv/direnv.vim',
  {
    'smoka7/hop.nvim',
    version = '*',
    opts = {},
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    -- branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    "swaits/scratch.nvim",
    lazy = true,
    cmd = {
      "Scratch",
      "ScratchSplit",
    },
    opts = {},
  };
}
