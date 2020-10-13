
"   .vimrc
"   @arvmtt

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible 

"   syntax 
syntax enable   " highlighting

"  cursor and linenumbers
set cursorline                                  " highlights the current line
set cursorlineopt=number                        " only highlight the linenumber
set number relativenumber " set relative linenumbers from absolute line
highlight LineNr ctermfg=DarkGrey               " set the color of all linenumbers 
highlight CursorLineNr cterm=none ctermfg=Red   " set the color of the current linenumber

"   finding files
set path+=**              " :find searches directoy recursivly
let g:netrw_banner=0      " hides the banner in netrw
let g:netrw_winsize = 15  " set netrw deafult size

"   spaces / tabs
set tabstop=2               " number of visual spaces per TAB
set shiftwidth=2            " number of space in TAB when editing
set expandtab               " Use the appropriate number of spaces to insert a TAB
filetype plugin indent on   " allow intelligent auto-indenting for each filetype

"   command / status bar
set wildmenu      " visual autocomplete for command menu
set laststatus=2  " always show the status line at the bottom

"   window
set title   " set the window’s title, reflecting the file currently being edited

"   splits
set splitbelow    " adds new horizontal splits below the current
set splitright    " adds new vertical splits to the right of the current

"   text rendering
set linebreak             " avoid wrapping a line in the middle of a word
set showmatch             " highlight matching [{()}]
set scrolloff=2           " the number of screen lines to keep above and below the cursor

"   searching
set incsearch   " search as characters are entered
set hlsearch    " highlight matches
set ignorecase  " ignore case sensitivity when searching.

"   performance
set lazyredraw  " don’t update screen during macro and script execution 

"   status line
" set statusline=
" set statusline+=\                           " padding
" set statusline+=%{CurrentBranchStatus()}    " git status symbol
" set statusline+=\ %{StatuslineGit()}        " current git branch
" set statusline+=\                           " padding 
" set statusline+=%#Title#                    " text highlight
" set statusline+=\ %m                        " modified flag
" set statusline+=\ %t                        " file name
" set statusline+=%=                          " seperatort left - right 
" set statusline+=%#LineNr#                   " text highlight
" set statusline+=lines:\ %L                  " total buffer lines

"   functions
function! CurrentBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! CurrentBranchStatus()
  let l:status = system("git status --short 2>/dev/null | cut -d \" \" -f 2 | tr -d '\n'")
  return strlen(l:status) > 0 ? l:status : ''
endfunction

function! StatuslineGit()
  let l:branchname = CurrentBranch()
  return strlen(l:branchname) > 0 ? l:branchname : ''
endfunction
