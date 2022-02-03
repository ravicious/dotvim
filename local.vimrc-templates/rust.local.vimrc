let g:neoformat_rust_rustfmt = {
        \ 'exe': 'rustfmt',
        \ 'args': ['--edition 2018'],
        \ 'stdin': 1,
        \ }

let g:ale_rust_cargo_check_tests = 1
