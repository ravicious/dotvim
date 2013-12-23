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

"vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme="jellybeans"

"YouCompleteMe
let g:ycm_min_num_of_chars_for_completion = 3

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" vim-sneak
let g:sneak#streak = 1

" Colorscheme and GUI
colorscheme jellybeans
set background=dark
set gfn=Consolas\ 9

set synmaxcol=256
syntax on
