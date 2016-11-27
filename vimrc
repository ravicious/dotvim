set nocompatible

set encoding=utf-8
set showcmd                     " display incomplete commands

set spell spelllang=en_us       " spellchecking

" Whitespace
"===========
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
"=========================
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" List chars
"=========================
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen
set list

" Ignore files
"=========================
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*/tmp/*,*.so,*.zip
set wildignore+=*.swp,*~,._*


" NeoBundle
"=========================

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
" All bundles are in bundle/bundles file
source ~/.vim/bundles.vim
call neobundle#end()
filetype plugin indent on
filetype detect " Required by matchit
NeoBundleCheck

" Commands
"=========================
source ~/.vim/commands.vim

" Mappings
"=========================
source ~/.vim/mappings.vim

" Other settings
"=========================
source ~/.vim/other_settings.vim
