" Autocorrect current file, wait for user input (so they can see changes RuboCop made),
" call Neomake (to remove existing warnings or see which didn't get automatically corrected)
" and finally reload current buffer with the updated file.
command -bar RuboCopAutoCorrect execute ':!rubocop --format clang -a %' | :call input("Press any key to continue") | :Neomake | :e
command -bar RA RuboCopAutoCorrect

command -bar EslintFix execute ':!./node_modules/.bin/eslint % --fix' | :call input("Press any key to continue") | :Neomake | :e
command -bar EF EslintFix
