"#############################################################################
"               I. Using the pathogen plugin management
"#############################################################################
" Now any plugins you wish to install can be extracted to a subdirectory under
" ~/.vim/bundle
execute pathogen#infect()
syntax on
filetype plugin indent on




"#############################################################################
"               II. VIM common configuration
"#############################################################################
"1. Using the VIM setting, rather than VI setting
set nocompatible

"2. Keep backup file
set nobackup

"3. Switch syntax highlighting on
set hlsearch
set incsearch

"4. Set the textwidth
autocmd FileType * setlocal textwidth=80 formatoptions+=tcqrn
" set textwidth=80
" set colorcolumn=80

"5. Set the colorscheme
set background=dark
" set background=light

" colorscheme default
" colorscheme molokai
" colorscheme desert
" colorscheme torte
" colorscheme ron
colorscheme solarized
let g:solarized_contrast='high'
let g:solarized_visibility='high'
set t_Co=256

"6. Set the GUI fonts
" set guifont=Courier\ 10\ Pitch\ Regular\ 11
" set guifont=Monospace\ Regular\ 11
" set guifont=WenQuanYi\ Micro\ Hei\ Mono\ Regular\ 11

"7. Highlighting the edit lines
autocmd InsertLeave * set nocul nocuc
autocmd InsertEnter * set cul   cuc

"8. Allow the backspace over everything in the insert mode
" set backspace=indent,eol,start

"9. Keep 50 lines of command history
set history=50

"10. Show the cursor position all the time
set ruler

"11. Display the incomplete commands
set showmode
set showcmd

"12. Show the number of the line
set nu

"13. No bink
set novisualbell

"14. Display the confirm information, when operate the unsaved or read-only
"file etc.
set confirm

"15. Auto fold the lines when change the VIM window size
set wrap

"16. Set the auto format
" set formatoptions=tcrqn
" t: auto-return accord to the textwidth
" c: auto-write the comment symbol, when return a line in source code
" r: auto-write the comment symbol, when return a line in comments
" q: can use the 'gq' command in comments
" n: recognise the list number, the indent of next line accord to number

"17. Autocomplete the code
set completeopt=preview,menu
set completeopt=longest,menu

"18. Set the indent style
set autoindent      " Inherit the indent of the previous line
set smartindent
set cindent

"19. Set the TAB
set tabstop=4       " tab width, the default is 8
set softtabstop=4   " all the indent width it 4
set shiftwidth=4
set smarttab        " tab in the lines or paragraph
set expandtab       " white space replace the tab
" set noexpandtab

"20. Searching ignores the case
" set ignorecase

"21. Highlighting the matched brackets
set showmatch
set matchtime+=1

"22. Enable to folding
" set foldenable
" set foldmethod=indent
" set foldcolumn=0
" set foldlevel=1

"23. Gvim tool bar
set guioptions+=T
set guioptions-=m

"24. Auto write the template
autocmd BufNewFile *.pl 0r ~/.vim/template/perl.tlp
autocmd BufNewFile *.py 0r ~/.vim/template/python.tlp

"25. Set the unwanted characters
" Enter the right-angle-quote by pressing Ctrl-k then >>
" Enter the middle-dot by pressing Ctrl-k then .M
set list listchars=tab:»·,trail:·


"#############################################################################
"               III. Personal shortcuts and functions
"#############################################################################
"===========================================================
"       1. Concel the searching highlight
"===========================================================
nnoremap <silent> \h :nohlsearch<CR>

"===========================================================
"       2. Autocomplete the brackets
"===========================================================
inoremap [ <c-r>=AutoPair('[',']')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap ( <c-r>=AutoPair('(',')')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { <c-r>=AutoPair('{','}')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
function! AutoPair(open, close)
    let line = getline('.')
    if col('.') > strlen(line) || line[col('.') - 1] == ''
        return a:open.a:close."\<ESC>i"
    else
        return a:open
    endif
endfunction

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

inoremap {{ {<CR>}<ESC>kA<CR>
inoremap () ()<ESC>i
inoremap [] []<ESC>i
inoremap {} {}<ESC>i
inoremap <> <><ESC>i
inoremap '' ''<ESC>i
inoremap "" ""<ESC>i
inoremap `` ``<ESC>i




"#############################################################################
"               IV. Plugins Configuration
"#############################################################################
"===========================================================
"       1. Trinity Configuration
"===========================================================
" open and close the tree plugins on the same time
nmap <F8> :TrinityToggleAll<CR>

" open and close the srcexpl.vim separately
nmap <F6> :TrinityToggleSourceExplorer<CR>

" open and close the taglist.vim separately
nmap <F5> :TrinityToggleTagList<CR>

" open and close the NERD_tree.vim separately
nmap <F7> :TrinityToggleNERDTree<CR>
