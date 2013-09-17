" Relative number
set number
set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" Always show context around the current line
set scrolloff=5

" Get rid of unnecessary gui options
set guioptions=ac

if has("statusline") && !&cp
  set laststatus=2  " Always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif

" Backups
set directory=~/.swp//
set backupdir=~/.vim-backup-dir//

" vim-indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 2
let g:indent_guides_enable_on_vim_startup = 1

" matchit.vim
runtime macros/matchit.vim

" Colorscheme and GUI
if has("gui_running")
  colorscheme base16-monokai
else
  colorscheme mustang
endif
set background=dark
set gfn=Monaco\ for\ Powerline\ 9

set synmaxcol=128
syntax on
