" Open diff in a vertical split
set diffopt+=vertical

" Relative number
set number
set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" Always show context around the current line
set scrolloff=5

" Enable mouse selection
set mouse=a

" Get rid of unnecessary gui options
set guioptions=ac

if has('statusline') && !&compatible
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
let g:airline_theme='light'
let g:airline#extensions#neomake#enabled = 1
let g:airline_section_a = airline#section#create_left(['mode', 'crypt', 'paste', 'iminsert'])
let g:airline_highlighting_cache = 1

"YouCompleteMe
" Enable identifier completion after 3 chars.
let g:ycm_min_num_of_chars_for_completion = 3
" Turn off ycm opening a window at the top of the screen.
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
" Ruby semantic completion isn't very helpful, so let's turn it off.
let g:ycm_filetype_specific_completion_to_disable = {
    \ 'ruby': 1
    \ }
let g:ycm_seed_identifiers_with_syntax = 1

" fzf.vim
let g:fzf_layout = { 'down': '~33%' }

" ripgrep
if executable('rg')
  " Use ripgrep over grep
  set grepprg=rg\ --vimgrep
endif

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
set bg=light
colorscheme alabaster
if !has('gui_vimr')
  colorscheme alabaster-256
endif

" Row/column settings
set colorcolumn=100
set textwidth=100

" Colorful style for vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

" Ale
let g:ale_echo_msg_format = '%linter%: %s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
" Turn off default linters.
let g:ale_linters = {
      \ 'html': [],
      \ 'javascript': [],
      \ 'ruby': ['ruby'],
      \}

" Neoformat
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END
let g:neoformat_enabled_json = []
let g:neoformat_enabled_scss = []
let g:neoformat_enabled_javascript = []
let g:neoformat_only_msg_on_error = 1
" Example Neoformat formatter options for JavaScript:
"   let g:neoformat_enabled_javascript = ['prettier']
"   let g:neoformat_javascript_prettier = {
"         \ 'exe': nrun#Which('prettier'),
"         \ 'args': ['--stdin', '--trailing-comma', '--single-quote', '--print-width ' . &textwidth],
"         \ 'stdin': 1,
"         \ }
" Example Neoformat formatter options for SCSS:
"   let g:neoformat_enabled_scss = ['prettier']
"   let g:neoformat_scss_prettier = {
"         \ 'exe': nrun#Which('prettier'),
"         \ 'args': ['--stdin', '--trailing-comma es5', '--single-quote', '--print-width 100', '--bracket-spacing', '--parser postcss', '--tab-width 2', '--no-semi'],
"         \ 'stdin': 1,
"         \ }

" Enable Rust autoformating
let g:rustfmt_autosave = 1

" Enables HTML/CSS syntax highlighting in JavaScript files.
let g:javascript_enable_domhtmlcss = 1

" Enable vim-closetag for the following filetypes
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.erb'

set synmaxcol=256
syntax on

" Show quick preview of off-screen substitution matches.
set inccommand=split

let g:highlightedyank_highlight_duration = 500

" Edit crontab in place
autocmd filetype crontab setlocal nobackup nowritebackup

" Use the old regex engine for Ruby files. Apparently vim's Ruby syntax is using something that's
" slower on the newer engine, so this should improve performance.
" https://stackoverflow.com/a/38616348/742872
augroup ft_rb
    au!
    au FileType ruby setlocal re=1
    au FileType eruby setlocal re=1
augroup END
