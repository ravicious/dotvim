" Open diff in a vertical split
set diffopt+=vertical

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
let g:indent_guides_color_change_percent = 6

" matchit.vim
runtime macros/matchit.vim

"vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='light'

"YouCompleteMe
let g:ycm_min_num_of_chars_for_completion = 3
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

"haskellmode-vim
let g:haddock_browser="xdg-open"

" ripgrep
if executable('rg')
  " Use ripgrep over grep
  set grepprg=rg\ --vimgrep

  " Use ripgrep in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'rg --files --hidden --follow --glob "!.git/*" %s'

  " ripgrep is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"use ctrl-cmatcher
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

"treat .md files as markdown files
autocmd BufRead,BufNewFile *.md set filetype=markdown

"treat .es6 files as JavaScript files
autocmd BufRead,BufNewFile *.es6 set filetype=javascript

"automatically enable rainbow parentheses
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" Colorscheme and GUI
colorscheme white-sand
set macligatures
set guifont=Fira\ Code:h12

" Row/column settings
set cc=100
set textwidth=100

" Colorful style for vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

" Ale
let g:ale_echo_msg_format = '%linter%: %s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

" Turn off vim-flow checks, since Ale handles that.
let g:flow#enable = 0

" Neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END
" Example Neoformat formatter options for JavaScript:
"   let g:neoformat_enabled_javascript = ['prettier']
"   let g:neoformat_javascript_prettier = {
"         \ 'exe': nrun#Which('prettier'),
"         \ 'args': ['--stdin', '--trailing-comma', '--single-quote', '--print-width ' . &textwidth],
"         \ 'stdin': 1,
"         \ }

" Enable Rust autoformating
let g:rustfmt_autosave = 1

" Enables HTML/CSS syntax highlighting in JavaScript files.
let g:javascript_enable_domhtmlcss = 1

" Enable vim-closetag for the following filetypes
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx,*.erb"

" elm-vim
let g:elm_format_autosave = 1

set synmaxcol=256
syntax on
