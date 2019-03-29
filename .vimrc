" Configure 256 colors for xterm mode
if &term =~ "xterm"
  let &t_Co=256
endif

" Gui options - only for gvim
if has('gui_running')
  set guioptions=e
  set guifont=Consolas:h11:cRUSSIAN
endif

" Enable syntax
syn on

" Width for one shift is 4 spaces
set shiftwidth=4
" Spaces number for tab visualization
set tabstop=4
" but for pascal its 2 spaces
au FileType pascal  set shiftwidth=2 tabstop=2

" Auto replace tabs with spaces 
set expandtab
" but do not do it for Makefiles
au FileType make    set noexpandtab

" Auto generate shifts with syntax information
set smartindent
set autoindent

" Highlight found patternes with / command
set hlsearch
" Show matched pattern while typing a search command
set incsearch

" Try to detect file encoding, UTF-8 is more preferred
set fileencodings=utf-8,cp1251

" Show status always
set laststatus=2
" Status line format
set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ [+]\ ':''}%*%=%c%V,%l\ %P\ [%n]

" Show all possibilities when press tab in commandline
set wildmenu

" Left arrow to switch to left tab
noremap <LEFT> gT
" Right arrow to switch to right tab
noremap <RIGHT> gt

" Up arrow to move up cursor to one displayed line
noremap <UP> gk
" Down arrow to move down cursor to one displayed line
noremap <DOWN> gj

" Toggle folding status with space
nnoremap <SPACE> za

""" Color scheme
" Select colormap: 'soft', 'softlight', 'standard' or 'allblue'
let xterm16_colormap = 'allblue'
" Select brightness: 'low', 'med', 'high', 'default' or custom levels
let xterm16_brightness = 'default'
" Choose scheme
colo xterm16

" Folding options for pascal
function PascalMarker()
  set fdm=marker
  set commentstring=//%s
  set foldmarker={{{,}}}
endfunction

" Set folding mode
au FileType pascal  call PascalMarker()
au FileType pascal  if &ft == 'pascal' | call PascalMarker() | endif

" Using delphi mode (more useful for free pascal)
let pascal_delphi=1

" Choose syntax by filename
au BufRead,BufNewFile .shareprofile set syn=sh
au BufRead,BufNewFile *.pas set syn=pascal
au BufRead,BufNewFile *.pp set syn=pascal
au BufRead,BufNewFile *.pas4 set syn=pascal
au BufRead,BufNewFile *.inc set syn=pascal

" Delete trailing spaces after saving
au BufWritePre *.pas4\|*.pas\|*.inc\|*.cpp\|*.h %s/[ ]\+$//e

" Option for :tabf
set path=.,,**
" Opening new tab
noremap T :tabf<SPACE>

" F5 to insert header for new journal entry
inoremap <F5> <ESC>0i<CR><C-R>=strftime('%a %d %b %Y  %H:%M:%S')<CR><CR>---<CR>
nnoremap <F5> o<ESC>0i<CR><C-R>=strftime('%a %d %b %Y  %H:%M:%S')<CR><CR>---<CR>
