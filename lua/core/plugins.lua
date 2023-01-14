-- plugins
return {
  -- better file explorer
  {
    'justinmk/vim-dirvish',
    dependencies = 'tpope/vim-eunuch'
  },
  {
    'tpope/vim-unimpaired',
    keys = { '[', ']' }
  },
  -- better git integration
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('plugins.gitsigns')
    end
  },
  -- status bar
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins.lualine')
    end
  },
  -- conveniently run git commands from vim
  {
    'tpope/vim-fugitive',
    lazy = true,
    cmd = { 'G' }
  },
  {
    'tpope/vim-surround',
    keys = { "ds", "cs", "ys", { "S", mode = 'v' }, { "gS", mode = 'v' } }
  },
  -- git commit browser
  {
    'junegunn/gv.vim',
    lazy = true,
    cmd = { 'GV' },
    dependencies = { 'tpope/vim-fugitive' }
  },
  -- commenter
  {
    'numToStr/Comment.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = { "gc", "gb", { "gc", mode = 'v' }, { "gb", mode = 'v' } },
    config = true,
  },
  -- indent guides
  {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  },
  -- zen mode
  {
    'folke/zen-mode.nvim',
    lazy = true,
    cmd = { 'ZenMode' },
    config = true,
  },
  -- parentheses colorizer
  {
    'junegunn/rainbow_parentheses.vim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      vim.cmd [[RainbowParentheses]]
    end
  },
  -- completion + lsp
  {
    'neoclide/coc.nvim',
    branch = 'release',
    lazy = true,
    -- VimEnter loads coc faster but startup time is increased by ~20ms
    event = { 'VeryLazy' },
    dependencies = { 'neoclide/coc-sources', 'honza/vim-snippets' },
    config = function()
      require('plugins.coc')
    end
  },
  -- improved syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = true,
    event = {'VeryLazy'},
    cmd = {
      'TSBufDisable',
      'TSBufEnable',
      'TSBufToggle',
      'TSConfigInfo',
      'TSDisable',
      'TSEditQuery',
      'TSEditQueryUserAfter',
      'TSEnable',
      'TSInstall',
      'TSInstallFromGrammar',
      'TSInstallInfo',
      'TSInstallSync',
      'TSModuleInfo',
      'TSToggle',
      'TSUninstall',
      'TSUpdate',
      'TSUpdateSync',
    },
    config = function()
      -- treesitter stuff
      local configs = require("nvim-treesitter.configs")
      configs.setup {
        ensure_installed = "all",
        sync_install = false,
        ignore_install = { "" }, -- List of parsers to ignore installing
        highlight = {
          enable = true, -- false will disable the whole extension
          disable = { "" }, -- list of language that will be disabled
        },
        indent = { enable = true, disable = { "yaml" } },
      }
      -- hack to make rainbow_parentheses work with treesitter
      vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "" })
    end
  },
  -- automatically close pairs
  {
    "windwp/nvim-autopairs",
    -- load when starting bracket delimiter is pressed
    keys = {
      { '(', mode = 'i' },
      { '{', mode = 'i' },
      { '[', mode = 'i' },
      { '"', mode = 'i' },
      { "'", mode = 'i' }
    },
    config = true,
  },

  -- start screen
  {
    'goolord/alpha-nvim',
    config = function()
      require('plugins.alpha')
    end
  },
  -- fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = { 'Telescope' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      {
        -- increase telescope search speed
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      }
    },
    config = function()
      require("plugins.telescope")
    end
  },

  -- improved movement
  {
    'ggandor/leap.nvim',
    keys = { 's', 'S', { 's', mode = 'v' }, { 'S', mode = 'v' }, 'gs' },
    config = function()
      require('leap').set_default_keymaps()
    end
  },

  {
    'wellle/context.vim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      vim.cmd [[ContextEnable]]
    end
  },

  {
    'wellle/targets.vim',
    lazy = true,
    event = 'VeryLazy'
  },
  -- icons
  'nvim-tree/nvim-web-devicons',
  -- colorscheme
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme kanagawa]]
    end
  },
  -- markdown preview
  {
    'ellisonleao/glow.nvim',
    lazy = true,
    ft = 'markdown'
  },
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup()
    end
  }
}