" plugins
" automatically install vim plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  :echo "Installing Vim Plug"
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  :echo "Vim Plug installed"
endif

" plugins (make sure you have vim plug installed, run :PlugInstall to install them)
call plug#begin('~/.vim/plugged')
" lua libary
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/impatient.nvim'
" vim popup api
Plug 'nvim-lua/popup.nvim'
" more aesthetic notifications
Plug 'rcarriga/nvim-notify'
" aesthetic code actions
Plug 'CosmicNvim/cosmic-ui'
Plug 'MunifTanjim/nui.nvim'
" file explorer
Plug 'preservim/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'Xuyuanp/nerdtree-git-plugin'
" richer git integration
Plug 'lewis6991/gitsigns.nvim'
" status bar
Plug 'nvim-lualine/lualine.nvim'
" basic git integration
Plug 'tpope/vim-fugitive'
" git conflict helper
Plug 'rhysd/conflict-marker.vim'
" sensible default settings
Plug 'tpope/vim-sensible'
" Vim Surround
Plug 'tpope/vim-surround'
" commenter
Plug 'numToStr/Comment.nvim'
" indent guides
Plug 'Yggdroot/indentLine'
" zen mode
Plug 'junegunn/goyo.vim'
" ai code suggestions
" Plug 'github/copilot.vim'
" easy parenthesis matching
Plug 'junegunn/rainbow_parentheses.vim'
" autocomplete
Plug 'hrsh7th/nvim-cmp'
" buffer completions
Plug 'hrsh7th/cmp-buffer'
" path completions
Plug 'hrsh7th/cmp-path'
" cmdline completions
Plug 'hrsh7th/cmp-cmdline'
" lsp completions
Plug 'hrsh7th/cmp-nvim-lsp'
" parameter hints
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
" lua completions
Plug 'hrsh7th/cmp-nvim-lua'
" calculation completions
Plug 'hrsh7th/cmp-calc'
" spelling suggestions
Plug 'f3fora/cmp-spell'
" emoji completions 😄
Plug 'hrsh7th/cmp-emoji'

" snippet completions
Plug 'saadparwaiz1/cmp_luasnip'
"  snippets
" snippet engine
Plug 'L3MON4D3/LuaSnip'
" snippets library
Plug 'rafamadriz/friendly-snippets' 

" enable LSP
Plug 'neovim/nvim-lspconfig'
" lspsaga
Plug 'glepnir/lspsaga.nvim'
" simple to use package manager
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Repeat.vim
Plug 'tpope/vim-repeat'
" start screen
Plug 'mhinz/vim-startify'
" fuzzy finder
Plug 'nvim-telescope/telescope.nvim'
" sets vim.ui.select to telescope
Plug 'nvim-telescope/telescope-ui-select.nvim'
" not supported on windows
" Plug 'nvim-telescope/telescope-media-files.nvim'
" TODO: get Telescope fzf working
" TODO: figure out why this extension is not being found
" increase telescope search speed
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
" better movement
Plug 'ggandor/leap.nvim'
" Plug 'ggandor/lightspeed.nvim'
" multi cursor support
Plug 'mg979/vim-visual-multi'
" Emmet
Plug 'mattn/emmet-vim'
" icons
Plug 'ryanoasis/vim-devicons'
" easily change dates
Plug 'tpope/vim-speeddating'
" keymap hints
Plug 'folke/which-key.nvim'
Plug 'folke/trouble.nvim'
" color scheme
Plug 'folke/tokyonight.nvim'
" better buffer management
Plug 'matbme/JABS.nvim'
call plug#end()

" enable IndentLine
let g:indentLine_enabled = 1
" prevent indentLine from setting conceallevel for markdown files
let g:markdown_syntax_conceal=0
" files for indentLine to exclude
let g:indentLine_fileTypeExclude = ['help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'NvimTree', 'Trouble', 'WhichKey', 'lsp-installer', 'mason', 'text', 'sh']
" use nerdfont icons for nerdtree git status indicators
let g:NERDTreeGitStatusUseNerdFonts = 1

" don't confirm opening, copying, or moving of files in nerdtree visual
" selection mode
let g:nerdtree_vis_confirm_open = 0
let g:nerdtree_vis_confirm_copy = 0
let g:nerdtree_vis_confirm_move = 0

let g:VM_maps = {}

" map Leader z to toggle Goyo
nnoremap <Leader>z :Goyo<CR>


nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-t> :Telescope live_grep<CR>

nnoremap <C-m> :TroubleToggle<CR>

nnoremap <leader>b :JABSOpen<CR>

" bind Enter to accept Copilot suggestions
" imap <silent><script><expr> <C-Enter> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" enable RainbowParentheses
augroup rainbow_parens
  autocmd!
  autocmd VimEnter * RainbowParentheses
augroup end

" lua stuff
lua <<EOF
-- TODO: organize lua code into modules
-- set the colorscheme to tokyonight
vim.cmd("colorscheme tokyonight")

-- make neovim faster
require('impatient')

require('Comment').setup()

require('gitsigns').setup({
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false
  },

})

require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
})

require("which-key").setup()

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require('jabs').setup({
  -- Options for the main window
  position = 'center', -- center, corner. Default corner
  width = 80, -- default 50
  height = 20, -- default 10
  border = 'single', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default shadow

  offset = { -- window position offset
      top = 2, -- default 0
      bottom = 2, -- default 0
      left = 2, -- default 0
      right = 2, -- default 0
  },

  -- Options for preview window
  preview_position = 'top', -- top, bottom, left, right. Default top
  preview = {
      width = 70, -- default 70
      height = 30, -- default 30
      border = 'single', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default double
  },

  -- Default highlights (must be a valid :highlight)
  highlight = {
      current = "Title", -- default StatusLine
      split = "WarningMsg", -- default StatusLine
      alternate = "StatusLine" -- default WarningMsg
  },


  -- Keymaps
  keymap = {
      close = "d", -- Close buffer. Default D
      jump = "<cr>", -- Jump to buffer. Default <cr>
      h_split = "h", -- Horizontally split buffer. Default s
      v_split = "v", -- Vertically split buffer. Default v
      preview = "p", -- Open buffer preview. Default P
  },
})

require('leap').set_default_keymaps()

require('cmp')
require('luasnip')

-- notify configurations
require('notify').setup({
  fps = 60,
  timeout = 3000,
  -- max_width = 50,
  stages = "fade",
})

vim.notify = require("notify")


local function notify_output(command, opts)
  local output = ""
  local notification
  local notify = function(msg, level)
    local notify_opts = vim.tbl_extend(
      "keep",
      opts or {},
      { title = table.concat(command, " "), replace = notification }
    )
    notification = vim.notify(msg, level, notify_opts)
  end
  local on_data = function(_, data)
    output = output .. table.concat(data, "\n")
    notify(output, "info")
  end
  vim.fn.jobstart(command, {
    on_stdout = on_data,
    on_stderr = on_data,
    on_exit = function(_, code)
      if #output == 0 then
        notify("No output of command, exit code: " .. code, "warn")
      end
    end,
  })
end


-- Utility functions shared between progress reports for LSP and DAP

local client_notifs = {}

local function get_notif_data(client_id, token)
 if not client_notifs[client_id] then
   client_notifs[client_id] = {}
 end

 if not client_notifs[client_id][token] then
   client_notifs[client_id][token] = {}
 end

 return client_notifs[client_id][token]
end


local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

local function update_spinner(client_id, token)
 local notif_data = get_notif_data(client_id, token)

 if notif_data.spinner then
   local new_spinner = (notif_data.spinner + 1) % #spinner_frames
   notif_data.spinner = new_spinner

   notif_data.notification = vim.notify(nil, nil, {
     hide_from_history = true,
     icon = spinner_frames[new_spinner],
     replace = notif_data.notification,
   })

   vim.defer_fn(function()
     update_spinner(client_id, token)
   end, 100)
 end
end

local function format_title(title, client_name)
 return client_name .. (#title > 0 and ": " .. title or "")
end

local function format_message(message, percentage)
 return (percentage and percentage .. "%\t" or "") .. (message or "")
end

-- LSP integration
-- Make sure to also have the snippet with the common helper functions in your config!

vim.lsp.handlers["$/progress"] = function(_, result, ctx)
 local client_id = ctx.client_id

 local val = result.value

 if not val.kind then
   return
 end

 local notif_data = get_notif_data(client_id, result.token)

 if val.kind == "begin" then
   local message = format_message(val.message, val.percentage)

   notif_data.notification = vim.notify(message, "info", {
     title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
     icon = spinner_frames[1],
     timeout = false,
     hide_from_history = false,
   })

   notif_data.spinner = 1
   update_spinner(client_id, result.token)
 elseif val.kind == "report" and notif_data then
   notif_data.notification = vim.notify(format_message(val.message, val.percentage), "info", {
     replace = notif_data.notification,
     hide_from_history = false,
   })
 elseif val.kind == "end" and notif_data then
   notif_data.notification =
     vim.notify(val.message and format_message(val.message) or "Complete", "info", {
       icon = "",
       replace = notif_data.notification,
       timeout = 3000,
     })

   notif_data.spinner = nil
 end
end

-- table from lsp severity to vim severity.
local severity = {
  "error",
  "warn",
  "info",
  "info", -- map both hint and info to info?
}
vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
             vim.notify(method.message, severity[params.type])
end



require("luasnip/loaders/from_vscode").lazy_load()
-- Setup nvim-cmp.
local cmp = require('cmp')

-- cmp icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "path" },
    { name = "cmdline" },
    { name = "calc" },
    { name = "spell" },
    { name = "emoji" },
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})


-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--   capabilities = capabilities
-- }

-- lspconfig mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>;', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', '<space>gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end


local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require('lspconfig')['vimls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['pyright'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['clangd'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['jdtls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['sumneko_lua'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['jsonls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['sqlls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['marksman'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['html'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['cssls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

-- disable neovim lsp's inline diagnostics(use lspsaga's popup diagnostics instead)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)


local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- lspsaga

local keymap = vim.keymap.set
local saga = require('lspsaga')

saga.init_lsp_saga()

-- Show cursor diagnostics automatically in popup window
-- vim.cmd("autocmd CursorHold * silent Lspsaga show_cursor_diagnostics")

-- Lsp finder find the symbol definition implement reference
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
-- keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
-- keymap("v", "<leader>ca", "<cmd>Lspsaga range_code_action<CR>", { silent = true })

-- Rename
-- keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Definition preview
keymap("n", "gD", "<cmd>Lspsaga preview_definition<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
keymap("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })


-- cosmic ui ✨
require('cosmic-ui').setup()

-- cosmic ui renamer
keymap("n", "<leader>rn", "<cmd>lua require('cosmic-ui').rename()<CR>", { silent = true })

--cosmic ui code actions
keymap("n", "<leader>ca", "<cmd>lua require('cosmic-ui').code_actions()<CR>", { silent = true })
keymap("v", "<leader>ca", "<cmd>lua require('cosmic-ui').range_code_actions()<CR>", { silent = true })


-- treesitter stuff
local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = "all",
  sync_install = false, 
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
}


-- require('telescope').load_extension('media_files')


require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,

        ["<C-c>"] = require('telescope.actions').close,
        ["<C-p>"] = require('telescope.actions').close,

        ["<Down>"] = require('telescope.actions').move_selection_next,
        ["<Up>"] = require('telescope.actions').move_selection_previous,

        ["<CR>"] = require('telescope.actions').select_default,
        ["<C-x>"] = require('telescope.actions').select_horizontal,
        ["<C-v>"] = require('telescope.actions').select_vertical,
        ["<C-t>"] = require('telescope.actions').select_tab,

        ["<C-u>"] = require('telescope.actions').preview_scrolling_up,
        ["<C-d>"] = require('telescope.actions').preview_scrolling_down,

        ["<PageUp>"] = require('telescope.actions').results_scrolling_up,
        ["<PageDown>"] = require('telescope.actions').results_scrolling_down,

        ["<Tab>"] = require('telescope.actions').toggle_selection + require('telescope.actions').move_selection_worse,
        ["<S-Tab>"] = require('telescope.actions').toggle_selection + require('telescope.actions').move_selection_better,
        ["<C-q>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
        ["<M-q>"] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist,
        ["<C-l>"] = require('telescope.actions').complete_tag,
        ["<C-_>"] = require('telescope.actions').which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = require('telescope.actions').close,
        ["<C-p>"] = require('telescope.actions').close,
        ["<CR>"] = require('telescope.actions').select_default,
        ["<C-x>"] = require('telescope.actions').select_horizontal,
        ["<C-v>"] = require('telescope.actions').select_vertical,
        ["<C-t>"] = require('telescope.actions').select_tab,

        ["<Tab>"] = require('telescope.actions').toggle_selection + require('telescope.actions').move_selection_worse,
        ["<S-Tab>"] = require('telescope.actions').toggle_selection + require('telescope.actions').move_selection_better,
        ["<C-q>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
        ["<M-q>"] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist,

        ["j"] = require('telescope.actions').move_selection_next,
        ["k"] = require('telescope.actions').move_selection_previous,
        ["H"] = require('telescope.actions').move_to_top,
        ["M"] = require('telescope.actions').move_to_middle,
        ["L"] = require('telescope.actions').move_to_bottom,

        ["<Down>"] = require('telescope.actions').move_selection_next,
        ["<Up>"] = require('telescope.actions').move_selection_previous,
        ["gg"] = require('telescope.actions').move_to_top,
        ["G"] = require('telescope.actions').move_to_bottom,

        ["<C-u>"] = require('telescope.actions').preview_scrolling_up,
        ["<C-d>"] = require('telescope.actions').preview_scrolling_down,

        ["<PageUp>"] = require('telescope.actions').results_scrolling_up,
        ["<PageDown>"] = require('telescope.actions').results_scrolling_down,

        ["?"] = require('telescope.actions').which_key,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    --[[ fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
  --]]

  --[[
    media_files = {
        -- filetypes whitelist
        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        filetypes = {"png", "webp", "jpg", "jpeg"},
        find_cmd = "rg" -- find command (defaults to `fd`)
      }
    --]]
  ["ui-select"] = {
    require("telescope.themes").get_dropdown {
    -- even more opts
    }
  }

    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}

require("telescope").load_extension("ui-select")
-- require('telescope').load_extension('fzf')
EOF

" plugin configurations
runtime plugins/startify.vim
runtime plugins/nerdtree.vim
runtime plugins/gitsigns.vim
