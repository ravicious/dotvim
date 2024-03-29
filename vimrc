set nocompatible

set encoding=utf-8
set showcmd                     " display incomplete commands
" Set the command line height to two lines.
" Otherwise long messages (like after running prettier) won't fit
" in the command line which in turn will cause vim to display
" a prompt. http://vim.wikia.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompts
set cmdheight=2
set undofile " Maintain undo history between sessions
set undodir=~/.vim-undodir

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

" nvim
"=========================
let g:loaded_python_provider = 0
" neovim doesn't check if the file was changed by default
" https://github.com/qvacua/vimr/issues/242#issuecomment-318549413
au FocusGained * checktime
set noautoread

" fzf
"=========================
if executable('fzf')
  set rtp+=/usr/local/opt/fzf
  set rtp+=/opt/homebrew/opt/fzf
endif

" chruby
"=========================
set shell=$SHELL


" NeoBundle
"=========================

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
" Don't load CSApprox plugin
let g:CSApprox_loaded = 1
" All bundles are in bundle/bundles file
source ~/.vim/plugins.vim
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
