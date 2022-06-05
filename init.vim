" TODO: move plugin specfic configurations to different files
" Install vim-plug if is not present on the system the init.vim is being used on
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  :echo "Installing Vim Plug"
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  :echo "Vim Plug installed"
endif

" set the font to Consolas and the font size to 14 pixels
set guifont=Consolas:h14
" show line numbers
set number
" show relative line numbers
set relativenumber
" disable annoying error bell to prevent your ears from dying
set noerrorbells visualbell t_vb=
" syntax highlighting
syntax on
" omni completion
filetype plugin on
" show mode in status bar (insert/replace/...)
set showmode
" show typed command in status bar
set showcmd
" show cursor position in status bar
set ruler
" show file in titlebar
set title
" 8 lines above/below cursor when scrolling
set scrolloff=8
" don't wrap lines
set nowrap
set omnifunc=syntaxcomplete#Complete
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set incsearch
set magic
set ignorecase
set smartcase
" failed attempt to halt Vim creating those pesky .swp and .~un files
set nobackup
set noswapfile
set wildmode=longest:full,full
set wildmenu
" auto close html tags
set matchpairs+=<:>
" set updatetime to 50 milliseconds
set updatetime=50
" set the working directory as the one of the file currently being edited
autocmd BufEnter * lcd %:p:h

" built in debugger
packadd termdebug

" plugins (make sure you have VimPlug installed, run :PlugInstall to install them)
call plug#begin('~/.vim/plugged')
" NERDTree
Plug 'scrooloose/nerdtree'
" Vim GitGutter
Plug 'airblade/vim-gitgutter'
" Lightline (status bar)
Plug 'itchyny/lightline.vim'
" Fugitive.vim
Plug 'tpope/vim-fugitive'
" Sensible.vim
Plug 'tpope/vim-sensible'
" Vim Surround
Plug 'tpope/vim-surround'
" Vim Commentary
Plug 'tpope/vim-commentary'
" indent guides
Plug 'yggdroot/indentline'
" Goyo
Plug 'junegunn/goyo.vim'
" GitHub Copilot
Plug 'github/copilot.vim'
" Rainbow Parentheses
Plug 'junegunn/rainbow_parentheses.vim'
" Conquerer of Completion(code completion)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Repeat.vim
Plug 'tpope/vim-repeat'
" Vim Startify
Plug 'mhinz/vim-startify'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Vim Sneak
Plug 'justinmk/vim-sneak'
" minimap.vim
" Plug 'wfxr/minimap.vim'
call plug#end()

" make sure that IndentLine is enabled
let g:indentLine_enabled = 1


" open the minimap on startup
" let g:minimap_auto_start = 1

" highlight git stuff in minimap
" let g:minimap_git_colors = 1

" activate RainbowParentheses
augroup rainbow_parens
  autocmd!
  autocmd VimEnter * RainbowParentheses
augroup end

" refresh minimap.vim on file change
" augroup minimap_refresh
"   autocmd!
"   autocmd TextChanged * MinimapRefresh
" augroup end

set bg=dark

" alt + k to move a line or selection up,
" alt + j to move a line or selection down
" amazing vim hack taken from the wiki:
" https://vim.fandom.com/wiki/Moving_lines_up_or_down#:~:text=In%20normal%20mode%20or%20in,to%20move%20the%20block%20up.
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" map ctrl +  backspace to delete the previous word in insert mode
imap <C-BS> <C-W>
" map shift + tab to unindent
inoremap <S-Tab> <C-d>

runtime plugins/startify.vim
runtime plugins/coc.vim
runtime plugins/nerdtree.vim
runtime plugins/fzf.vim
