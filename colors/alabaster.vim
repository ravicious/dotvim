" Vim color file
" alabaster
" Created by Rafał Cieślak with ThemeCreator (https://github.com/mswift42/themecreator)
" Based on Alabaster theme by Nikita Prokopov https://github.com/tonsky/vscode-theme-alabaster

hi clear

if exists('syntax on')
  syntax reset
endif

set t_Co=256
let g:colors_name = 'alabaster'


" Define reusable colorvariables.
let s:bg='#F7F7F7'
let s:fg='#000000'
let s:fg2='#141414'
let s:fg3='#292929'
let s:fg4='#3d3d3d'
let s:bg2='#e3e3e3'
let s:bg3='#cfcfcf'
let s:bg4='#bcbcbc'
let s:keyword='#000000'
let s:builtin='#000000'
let s:const= '#7A3E9D'
let s:comment='#AA3731'
let s:func='#325CC0'
let s:str='#448C27'
let s:type='#325CC0'
let s:var='#000000'
let s:warning='#ff0000'
let s:warning2='#ff8800'
let s:punc='#777777'
let s:lightblue='#BFDBFE'
let s:orange='#FFE9A6'
let s:orange2='#FFBC5D'
let s:gray='#9DA39A'
let s:gray2='#BCBCBC'

exe 'hi Normal guifg='s:fg' guibg='s:bg
exe 'hi Cursor guifg='s:bg' guibg='s:fg
exe 'hi CursorLine guibg='s:bg2
exe 'hi CursorColumn guibg='s:bg2
exe 'hi ColorColumn guibg='s:bg2
exe 'hi SignColumn guibg='s:bg
exe 'hi LineNr guifg='s:gray' guibg='s:bg
exe 'hi CursorLineNr gui=NONE guifg='s:punc' guibg='s:bg
exe 'hi VertSplit guifg='s:gray2' guibg='s:gray2
exe 'hi MatchParen guifg='s:warning2'  gui=underline'
exe 'hi StatusLine gui=NONE guifg='s:fg2' guibg='s:bg3
exe 'hi Pmenu guifg='s:fg' guibg='s:bg2
exe 'hi PmenuSel  guibg='s:bg3
exe 'hi IncSearch guibg='s:str' guifg='s:orange2
exe 'hi Search guibg='s:orange
exe 'hi Directory guifg='s:const
exe 'hi Folded guifg='s:fg4' guibg='s:bg
exe 'hi Visual guibg='s:lightblue

exe 'hi Comment guifg='s:comment
exe 'hi Conditional guifg='s:keyword' gui=NONE'
exe 'hi Constant guifg='s:const
exe 'hi String guifg='s:str
exe 'hi Character guifg='s:str
exe 'hi Number guifg='s:const
exe 'hi Boolean guifg='s:const
exe 'hi Float guifg='s:const
exe 'hi Define guifg='s:keyword
exe 'hi DiffAdd guifg=#f8f8f8 guibg=#46830c gui=bold'
exe 'hi DiffDelete guifg=#ff0000'
exe 'hi DiffChange guifg='s:fg' guibg='s:var
exe 'hi DiffText guifg='s:fg' guibg='s:builtin' gui=bold'
exe 'hi ErrorMsg guifg='s:warning' guibg='s:bg2' gui=bold'
exe 'hi WarningMsg guifg='s:fg' guibg='s:warning2
exe 'hi Function guifg='s:func
exe 'hi Identifier guifg='s:type' gui=NONE'
exe 'hi Keyword guifg='s:keyword
exe 'hi Label guifg='s:var
exe 'hi NonText guifg='s:bg4' guibg='s:bg2
exe 'hi Operator guifg='s:keyword
exe 'hi PreProc guifg='s:keyword
exe 'hi Special guifg='s:fg
exe 'hi SpecialKey guifg='s:fg2' guibg='s:bg2
exe 'hi Statement guifg='s:keyword' gui=NONE'
exe 'hi StorageClass guifg='s:keyword' gui=NONE'
exe 'hi Tag guifg='s:keyword
exe 'hi Title guifg='s:fg
exe 'hi Todo guifg='s:fg2'  gui=inverse'
exe 'hi Type guifg='s:type' gui=NONE'
exe 'hi Typedef guifg='s:keyword' gui=NONE'
exe 'hi Underlined guifg='s:keyword' gui=underline'

" Ruby Highlighting
exe 'hi rubyClassName guifg='s:type
exe 'hi rubyModuleName guifg='s:type
exe 'hi rubyConstant guifg='s:keyword
exe 'hi rubyClassDeclaration guifg='s:keyword
exe 'hi rubyModuleDeclaration guifg='s:keyword
exe 'hi rubyClassVariable guifg='s:keyword
exe 'hi rubyInstanceVariable guifg='s:keyword
exe 'hi rubyPseudoVariable guifg='s:const
exe 'hi rubySymbol guifg='s:str
exe 'hi rubyRegexp guifg='s:const
exe 'hi rubyRegexpQuantifier guifg='s:str
exe 'hi rubyRegexpAnchor guifg='s:punc
exe 'hi rubyRegexpDelimiter guifg='s:punc
exe 'hi rubyRegexpCharClass guifg='s:punc

" Python Highlighting
exe 'hi pythonBuiltinFunc guifg='s:builtin

" Go Highlighting
exe 'hi goBuiltins guifg='s:builtin
exe 'hi goImportString guifg='s:func
exe 'hi goFormatSpecifier guifg='s:const

" Javascript Highlighting
exe 'hi jsBuiltins guifg='s:builtin
exe 'hi jsFunction guifg='s:keyword' gui=NONE'
exe 'hi jsGlobalObjects guifg='s:keyword
exe 'hi jsAssignmentExps guifg='s:var
exe 'hi jsObjectProp guifg='s:fg
exe 'hi jsFuncArgs guifg='s:fg
exe 'hi jsRegexpCharClass guifg='s:const
exe 'hi jsRegexpQuantifier guifg='s:str
exe 'hi jsFuncCall guifg='s:func

" Html Highlighting
exe 'hi htmlLink guifg='s:var' gui=underline'
exe 'hi htmlStatement guifg='s:keyword
exe 'hi htmlSpecialTagName guifg='s:keyword
hi htmlH1 gui=NONE
hi htmlH2 gui=NONE
hi htmlH3 gui=NONE
hi htmlH4 gui=NONE
hi htmlH5 gui=NONE
hi htmlH6 gui=NONE

" Markdown Highlighting
exe 'hi mkdCode guifg='s:builtin
