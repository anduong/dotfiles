" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader = ","

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'

" Install color theme to ~/.config/nvim/colors
Plug 'lifepillar/vim-solarized8'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Set fzf command prefix
" For example: :Files command will become :FzfFiles command
let g:fzf_command_prefix = 'Fzf'
if executable('fzf')
  " FZF {{{
  " <C-p> to search files
  nnoremap <silent> <C-p> :FZF -m<cr>
  " }}}
end
" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg 
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

Plug 'terryma/vim-multiple-cursors'

Plug 'Yggdroot/indentLine'
let g:indentLine_enabled = 1 

" Install deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Make sure that you have filetype plugins enabled, as the plugin makes use of 
" |commentstring| where possible (which is usually set in a filetype plugin)
Plug 'scrooloose/nerdcommenter'

" ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim 
" and Vim 8 while you edit your text files
Plug 'w0rp/ale'

" Shows a git diff in the 'gutter' (sign column). It shows which lines have 
" been added, modified, or removed
Plug 'airblade/vim-gitgutter'

" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

" Surround.vim is all about 'surroundings': parentheses, brackets, quotes, 
" XML tags, and more. The plugin provides mappings to easily delete, change and
" add such surroundings in pairs.
Plug 'tpope/vim-surround'

" Helps to end certain structures automatically
Plug 'tpope/vim-endwise'

" Supertab is a vim plugin which allows you to use <Tab> for all your insert 
" completion needs (:help ins-completion).
Plug 'ervandew/supertab'
call plug#end()

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================
set number                      "Line numbers are good
set numberwidth=5
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" A file type plugin (ftplugin) is a script that is run automatically when Vim 
" detects the type of file when the file is created or opened. The type can be 
" detected from the file name (for example, file sample.c has file type c), or 
" from the file contents.
filetype plugin on

" show the cursor position all the time
set ruler

" =================== Theme and UI ====================
" Set to use truecolor
if has('termguicolors') && $COLORTERM ==# 'truecolor'
  " True-color terminal
  set termguicolors
else
  " set notermguicolors is the default
  let g:solarized_use16 = 1  " If you want to use ANSI colors
endif

" Set color theme
set background=dark
colorscheme solarized8

" Set softtabs, 2 spaces
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Indentation
set autoindent
set smartindent

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" ======================== Searching ======================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ====================== Settings ============================

" ==================== Mappings =============================
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>
