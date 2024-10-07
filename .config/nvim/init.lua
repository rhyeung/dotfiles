-- ========================================================================== --
-- ==                           EDITOR SETTINGS                            == --
-- ========================================================================== --

-- Learn more about Neovim lua api
-- https://neovim.io/doc/user/lua-guide.html
-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/

vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.signcolumn = 'yes'

-- Space as leader key
vim.g.mapleader = ' '

-- Basic clipboard interaction
vim.keymap.set({'n', 'x', 'o'}, 'gy', '"+y', {desc = 'Copy to clipboard'})
vim.keymap.set({'n', 'x', 'o'}, 'gp', '"+p', {desc = 'Paste clipboard content'})

-- ========================================================================== --
-- ==                               PLUGINS                                == --
-- ========================================================================== --

local lazy = {}

function lazy.install(path)
  if not vim.uv.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy', 'lazy.nvim')
lazy.opts = {}

-- Learn more about lazy.nvim
-- https://dev.to/vonheikemen/lazynvim-plugin-configuration-3opi
lazy.setup({
  {import = 'plugins'},
  {'folke/tokyonight.nvim'},
  {'folke/which-key.nvim'},
  {'nvim-lualine/lualine.nvim'},
  {'nvim-lua/plenary.nvim', build = false},
  {'nvim-treesitter/nvim-treesitter'},
  {'nvim-telescope/telescope.nvim', branch = '0.1.x', build = false},
  {'natecraddock/telescope-zf-native.nvim', build = false},
  {'echasnovski/mini.nvim', branch = 'stable'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
})

-- ========================================================================== --
-- ==                         PLUGIN CONFIGURATION                         == --
-- ========================================================================== --

vim.cmd.colorscheme('tokyonight')

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30

-- See :help netrw-browse-maps
--vim.keymap.set('n', '<leader>e', '<cmd>Lexplore<cr>', {desc = 'Toggle file explorer'})
--vim.keymap.set('n', '<leader>E', '<cmd>Lexplore %:p:h<cr>', {desc = 'Open file explorer in current file'})

-- See :help lualine.txt
require('lualine').setup({
  options = {
    theme = 'tokyonight',
    icons_enabled = false,
    component_separators = '|',
    section_separators = '',
  },
})

-- See :help nvim-treesitter-modules
require('nvim-treesitter.configs').setup({
  highlight = { enable = true, },
  auto_install = true,
  ensure_installed = {'lua', 'vim', 'vimdoc', 'json'},
})

-- See :help which-key.nvim-which-key-setup
require('which-key').setup({
  icons = { mappings = false, },
})

require('which-key').add({
  {'<leader>s', group = '[S]earch'},
  {'<leader>b', group = '[B]uffer'},
  {'<leader>c', group = '[C]alendar'},
})

-- See :help MiniAi-textobject-builtin
require('mini.ai').setup({n_lines = 500})

-- See :help MiniComment.config
require('mini.comment').setup({})

-- See :help MiniSurround.config
require('mini.surround').setup({})

-- See :help MiniBufremove.config
require('mini.bufremove').setup({})

-- See :help MiniNotify.config
require('mini.notify').setup({
  lsp_progress = {enable = false},
})

-- See :help MiniNotify.make_notify()
vim.notify = require('mini.notify').make_notify({})

-- Close buffer and preserve window layout
vim.keymap.set('n', '<leader>bc', '<cmd>lua pcall(MiniBufremove.delete)<cr>', {desc = 'Close buffer'})

-- See :help telescope.builtin
require('telescope').load_extension('zf-native')

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

local cmp = require('cmp')

-- See :help cmp-config
cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer'},
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
})


local lspconfig = require('lspconfig')

-- Adds nvim-cmp's capabilities settings to
-- lspconfig's default config
lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- List of compatible language servers is here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- These are just examples. Replace them with the language
-- servers you have installed in your system.
require('lspconfig').gleam.setup({})
require('lspconfig').ocamllsp.setup({})
require('lspconfig').clangd.setup({})

------------------------------------------------------------------
-- => My Settings Start
------------------------------------------------------------------
local o = vim.o
o.expandtab = true -- expand tab input with spaces characters
o.smartindent = true -- syntax aware indentations for newline inserts
o.tabstop = 4 -- num of space characters per tab
o.shiftwidth = 4 -- spaces per indentation level
o.relativenumber = true

-- Normal keybinds
local keymap = vim.keymap
keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true, desc = 'which_key_ignore' })
keymap.set('v', 'jk', '<Esc>', { noremap = true, silent = true, desc = 'which_key_ignore' })
keymap.set('c', 'jk', '<C-c>', { noremap = true, silent = true, desc = 'which_key_ignore' })
keymap.set('i', 'kj', '<Esc>', { noremap = true, silent = true, desc = 'which_key_ignore' })
keymap.set('v', 'kj', '<Esc>', { noremap = true, silent = true, desc = 'which_key_ignore' })
keymap.set('c', 'kj', '<C-c>', { noremap = true, silent = true, desc = 'which_key_ignore' })
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Python
vim.g.python3_host_prog = '$HOME/.pyenv/versions/nvim/bin/python'

-- SQF
vim.api.nvim_create_autocmd({
  'BufNewFile',
  'BufRead',
}, {
  pattern = '*.sqf',
  callback = function()
    vim.o.omnifunc = 'syntaxcomplete#Complete'
  end,
})

------------------------------------------------------------------
-- => WhichKey Mappings
------------------------------------------------------------------
local wk = require 'which-key'
wk.add({
  { '<leader>n', group = '[N]eotree' },
  { '<leader>nb', '<cmd>Neotree toggle focus buffers right<cr>', desc = '[N]eotree [B]uffer List', remap = false },
  { '<leader>nd', '<cmd>Neotree toggle current reveal_force_cwd left<cr>', desc = '[N]eotree File [D]rawer', remap = false },
  { '<leader>nf', '<cmd>Neotree float reveal_force_cwd<cr>', desc = '[N]eotree File [F]loat', remap = false },
  { '<leader>ng', '<cmd>Neotree float git_status<cr>', desc = '[N]eotree [G]it Status', remap = false },
  { '<leader>p', '<cmd>lua require"telescope".extensions.project.project{}<cr>', desc = '[P]roject' },
  { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = '[U]ndo' },
  { '<leader>bs', '<cmd>Scratch<cr>', desc = '[s]cratch Buffer' },
  { '<leader>bS', '<cmd>ScratchSplit<cr>', desc = 'Scratch Buffer [S]plit' },
  { '<leader>t', group = '[T]elekasten' },
  { '<leader>tf', '<cmd>Telekasten find_notes<cr>', desc = '[F]ind notes' },
  { '<leader>tn', '<cmd>Telekasten new_note<cr>', desc = '[N]ew note' },
  { '<leader>tp', '<cmd>Telekasten panel<cr>', desc = '[P]anel' },
}, { prefix = '<leader>' })

------------------------------------------------------------------
-- => hop
------------------------------------------------------------------
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 't', function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 'T', function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true})

------------------------------------------------------------------
-- => nvim-lspconfig
------------------------------------------------------------------
require'lspconfig'.basedpyright.setup{}

------------------------------------------------------------------
-- => ale
------------------------------------------------------------------
vim.g.ale_fixers = {
  ['python'] = { "black", "isort", "autoflake" },
  ['cpp'] = { "clang-format" },
  ['c'] = { "astyle" },
}
vim.g.ale_echo_msg_format = '%linter% says %code%: %s'
vim.g.ale_c_astyle_executable = 'astyle --style=kr'
vim.g.ale_c_astyle_project_options = '.astylrc'
vim.g.ale_python_auto_poetry = 1
vim.g.ale_python_autoflake_auto_poetry = 1
vim.g.ale_python_flake8_auto_poetry = 1
vim.g.ale_python_black_auto_poetry = 1
vim.g.ale_python_isort_auto_poetry = 1
vim.g.ale_python_auto_virtualenv = 1

------------------------------------------------------------------
-- => telekasten
------------------------------------------------------------------
local status_ok, tel = pcall(require, "telekasten")
if not status_ok then
  return
end

local home = vim.fn.expand("~/Downloads/Document/notes")

tel.setup({
  home = home,
  
  -- if true, telekasten will be enabled when opening a note within the configured home
  take_over_my_home = false,
  
  -- auto-set telekasten filetype: if false, the telekasten filetype will not be used
  -- and thus the telekasten syntax will not be loaded either
  auto_set_filetype = false,
  -- dir names for special notes (absolute path or subdir name)
  --dailies = home .. "/" .. "daily",
  --weeklies = home .. "/" .. "weekly",
  templates = home .. "/" .. "templates",
  --
  -- image (sub)dir for pasting
  -- dir name (absolute path or subdir name)
  -- or nil if pasted images shouldn't go into a special subdir
  --image_subdir = "img",
  
  -- markdown file extension
  extension = ".md",
  
  -- Generate note filenames. One of:
  -- "title" (default) - Use title if supplied, uuid otherwise
  -- "uuid" - Use uuid
  -- "uuid-title" - Prefix title by uuid
  -- "title-uuid" - Suffix title with uuid
  new_note_filename = "title",
  -- file uuid type ("rand" or input for os.date()")
  uuid_type = "%Y%m%d%H%M",
  -- UUID separator
  uuid_sep = "-",
  
  -- following a link to a non-existing note will create it
  follow_creates_nonexisting = true,
  --dailies_create_nonexisting = true,
  --weeklies_create_nonexisting = true,
  
  -- skip telescope prompt for goto_today and goto_thisweek
  journal_auto_open = false,
  
  -- template for new notes (new_note, follow_link)
  -- set to `nil` or do not specify if you do not want a template
  template_new_note = home .. "/" .. "templates/new_note.md",
  
  -- template for newly created daily notes (goto_today)
  -- set to `nil` or do not specify if you do not want a template
  --template_new_daily = home .. "/" .. "templates/daily.md",
  
  -- template for newly created weekly notes (goto_thisweek)
  -- set to `nil` or do not specify if you do not want a template
  --template_new_weekly = home .. "/" .. "templates/weekly.md",
  
  -- image link style
  -- wiki:     ![[image name]]
  -- markdown: ![](image_subdir/xxxxx.png)
  image_link_style = "markdown",
  
  -- default sort option: 'filename', 'modified'
  sort = "filename",
  
  -- integrate with calendar-vim
  plug_into_calendar = true,
  calendar_opts = {
  	-- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
  	weeknm = 4,
  	-- use monday as first day of week: 1 .. true, 0 .. false
  	calendar_monday = 1,
  	-- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
  	calendar_mark = "left-fit",
  },
  -- telescope actions behavior
  close_after_yanking = false,
  insert_after_inserting = true,
  
  -- tag notation: '#tag', ':tag:', 'yaml-bare'
  tag_notation = ":tag:",
  
  -- command palette theme: dropdown (window) or ivy (bottom panel)
  command_palette_theme = "dropdown",
  
  -- tag list theme:
  -- get_cursor: small tag list at cursor; ivy and dropdown like above
  show_tags_theme = "dropdown",
  
  -- when linking to a note in subdir/, create a [[subdir/title]] link
  -- instead of a [[title only]] link
  subdirs_in_links = true,
  
  -- template_handling
  -- What to do when creating a new note via `new_note()` or `follow_link()`
  -- to a non-existing note
  -- - prefer_new_note: use `new_note` template
  -- - smart: if day or week is detected in title, use daily / weekly templates (default)
  -- - always_ask: always ask before creating a note
  template_handling = "smart",
  
  -- path handling:
  --   this applies to:
  --     - new_note()
  --     - new_templated_note()
  --     - follow_link() to non-existing note
  --
  --   it does NOT apply to:
  --     - goto_today()
  --     - goto_thisweek()
  --
  --   Valid options:
  --     - smart: put daily-looking notes in daily, weekly-looking ones in weekly,
  --              all other ones in home, except for notes/with/subdirs/in/title.
  --              (default)
  --
  --     - prefer_home: put all notes in home except for goto_today(), goto_thisweek()
  --                    except for notes with subdirs/in/title.
  --
  --     - same_as_current: put all new notes in the dir of the current note if
  --                        present or else in home
  --                        except for notes/with/subdirs/in/title.
  new_note_location = "smart",
  
  -- should all links be updated when a file is renamed
  rename_update_links = true,
  
  vaults = {
  	work = {
  		-- alternate configuration for vault2 here. Missing values are defaulted to
  		-- default values from telekasten.
  		-- e.g.
  		-- home = "/home/user/vaults/personal",
  		-- markdown file extension
  		auto_set_filetype = false,
  		extension = ".md",
  		template_handling = "smart",
  		home = home .. "/" .. "work",
  		dailies = home .. "/" .. "work/daily",
  		weeklies = home .. "/" .. "work/weekly",
  		templates = home .. "/" .. "work/templates",
  		-- template for new notes (new_note, follow_link)
  		-- set to `nil` or do not specify if you do not want a template
  		template_new_note = home .. "/" .. "work/templates/new_note.md",
  
  		-- template for newly created daily notes (goto_today)
  		-- set to `nil` or do not specify if you do not want a template
  		template_new_daily = home .. "/" .. "work/templates/daily.md",
  
  		-- template for newly created weekly notes (goto_thisweek)
  		-- set to `nil` or do not specify if you do not want a template
  		template_new_weekly = home .. "/" .. "work/templates/weekly.md",
  	},
  },
  
  -- how to preview media files
  -- "telescope-media-files" if you have telescope-media-files.nvim installed
  -- "catimg-previewer" if you have catimg installed
  media_previewer = "telescope-media-files",
  
  -- A customizable fallback handler for urls.
  follow_url_fallback = nil,
})
