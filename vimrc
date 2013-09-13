set nocompatible

set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" NeoBundle

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
" All bundles are in bundle/bundles file
source ~/.vim/bundle/bundles.vim
NeoBundleCheck

"Ignore files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*.swp,*~,._*

"" Mappings
source ~/.vim/mappings.vim

"" Other
"Relative number

set relativenumber

function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

"Always show context around the current line
set scrolloff=5

"Get rid of unnecessary gui options
set guioptions=ac

"Always show a status line
set laststatus=2

"backups!
set directory=~/.swp//
set backupdir=~/.vim-backup-dir//

if has("gui_running")
  colorscheme base16-monokai
else
  colorscheme mustang
endif
set background=dark
set gfn=Monaco\ 10
syntax on
