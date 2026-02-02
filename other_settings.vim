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
let g:airline_section_x = '%{get(b:, "coc_current_function", "")} ' . airline#section#create_right(['tagbar', 'filetype'])
let g:airline_section_z = '%p%% ㏑%l/%L c%v'
let g:airline_highlighting_cache = 1
" Update Airline when coc_current_function changes.
autocmd User CocStatusChange AirlineRefresh

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
if exists("g:gui_vimr")
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

set splitbelow
set splitright

lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed =  {
    "lua",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "css",
    "typescript",
    "javascript",
    "tsx",
    "go",
    "gomod",
    "gosum",
    "comment",
    "yaml",
    "json",
    "toml",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 512 * 1024 -- 512 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true or false
      include_surrounding_whitespace = true,
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
        --
        -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
        ["]o"] = "@loop.*",
        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
        --
        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
      -- Below will go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- Make it even more gradual by adding multiple queries and regex.
      goto_next = {
        ["]d"] = "@conditional.outer",
      },
      goto_previous = {
        ["[d"] = "@conditional.outer",
      }
    },
  },
}
EOF

command! -nargs=0 CloseTabsToRight :.+1,$tabdo :tabc
