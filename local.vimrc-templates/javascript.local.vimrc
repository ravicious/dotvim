let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_javascript_prettier = {
      \ 'exe': nrun#Which('prettier'),
      \ 'args': ['--stdin-filepath', '"%:p"'],
      \ 'stdin': 1,
      \ }

let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \}
