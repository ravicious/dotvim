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
if has("gui_vimr") || exists('g:GuiLoaded')
  colorscheme alabaster
else
  colorscheme alabaster-256
endif

" Row/column settings
set colorcolumn=100
set textwidth=100

" Colorful style for vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

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

" Show filename in title in GUIs.
set title

set startofline

" coc-related settings
" https://github.com/neoclide/coc.nvim/tree/v0.0.80
set updatetime=300
set shortmess+=c
set signcolumn=yes

let g:coc_global_extensions = [
      \'coc-json', 'coc-tsserver', 'coc-prettier', 'coc-go', 'coc-eslint'
      \]

let g:airline#extensions#coc#enabled = 0

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" vim-go
let g:go_code_completion_enabled = 0
let g:go_fmt_autosave = 0
let g:go_imports_autosave = 0
let g:go_mod_fmt_autosave = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_get_update = 0
let g:go_gopls_enabled = 0
let g:go_list_autoclose = 0
let g:go_template_autocreate = 0
let g:go_highlight_functions = 1

" Disable mouse inside nvim
set mouse=

" Opens a split given by the splitCmd command with the file extension
" replaced with replacement.
function! OpenReplacementSplit(splitCmd, replacement)
    let l:filename = expand("%:r") . a:replacement
    execute a:splitCmd . " " . l:filename
endfunction

command! -nargs=+ SplitReplace call OpenReplacementSplit("split", <f-args>)
command! -nargs=+ VsplitReplace call OpenReplacementSplit("vsplit", <f-args>)

" Prevent tagalong.vim from mangling yanked content when pasting it in visual mode.
" https://github.com/AndrewRadev/tagalong.vim/issues/10
let g:tagalong_mappings = ['c', 'C', 'i', 'a']
