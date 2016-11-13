"http://stackoverflow.com/a/15330610/742872
noremap l h
noremap ; l
noremap h ;
map h <Plug>SneakNext

nmap <silent> <c-w>l :wincmd h<CR>
nmap <silent> <c-w>; :wincmd l<CR>

"Map space to leader
let mapleader = "\<Space>"

"Change the default mapping of ctrlp.vim
let g:ctrlp_map = '<c-f>'

"Make ctrlp.vim ignore specific files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }

"Make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"Map jk in insert mode to Esc
imap jk <Esc>

"Quick movements from vim wiki
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

"splitjoin.vim
nmap <leader>sj :SplitjoinSplit<cr>
nmap <leader>sk :SplitjoinJoin<cr>

"vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"switch.vim
nmap <Leader><Tab> :Switch<CR>

"Same as `gi`, but doesn't go into insert mode.
nmap <leader>gi `^
