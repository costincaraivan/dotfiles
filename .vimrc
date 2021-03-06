"colorscheme - relaxing
"color wombat
"highlight current column, useful for checking indentation (sometimes it can be annoying)
"set colorcolumn=80,100,120
" pick up color theme from user folder
set runtimepath+=~/.vimfiles
set fileformats=unix,dos
set fileformat=unix
"set the starting working directory to something where we have access rights
" this also means that the swap files do not pollute the working folders
if has("win32") || has("win64")
   set undodir=C:\\users\\ccaraivan\\vimfiles\\undo
   set directory=C:\\Users\\ccaraivan\\vimfiles\\directory
   set backupdir=C:\\Users\\ccaraivan\\vimfiles\\backup
else
   set undodir=/tmp
   set directory=/tmp
   set backupdir=/tmp
end 
"stop beeping when errors occur - set visual bell
set visualbell
"show invisible characters
set list
"set list of invisible characters
set listchars=eol:�,tab:��,nbsp:�,precedes:�,extends:�,trail:�
"use spell checker
"setlocal spell spelllang=en_us
"make backup files
set backup
set writebackup
"enable persistent undo
set undofile
"autoload files which have been changed outside of this Vim buffer
set autoread
"stop Vi compatibility mode - allows multiple undo, ...
set nocompatible
"show line numbers
set number
"highlights the current line
set cursorline
"incremental search - search as you type
set incsearch
"highlight search results
set hlsearch
"automatic indent, great for programming
set autoindent
"show current line and other details in the bottom row
set ruler
"shows current command in the bottom row, before execution
set showcmd
"always show the status line
set laststatus=2
"configure status line text
set statusline=%R%M\ �\ "read only [RO] and modified [+] flags
set statusline+=File:%<%F\ �\ "file name
set statusline+=Type:%Y\ �\ "file type aka .txt & co
set statusline+=OS:%{&ff}\ �\ "file format aka Win & co
set statusline+=Encoding:%{&fileencoding?&fileencoding:&encoding} "file encoding aka utf8 & co
set statusline+=%= "left-right groups separator
set statusline+=\ �\ Char:%B\ �\ "character code - to spot funny characters like non-breaking space
set statusline+=Line:%l\ �\ "line number
set statusline+=Column:%c\ �\  "column number
set statusline+=%P "percentage based position in file
"open a command window for longer commands (for example regexp replaces)
map <C-F> <Esc>:<C-F>i
"detect and highlight syntax
syntax on
"set no line wrapping
set nowrap
"filetype detection and textwidth
filetype on
"autocmd FileType text setlocal textwidth=80
"filetype specific options
filetype plugin on
"filetype specific indent
filetype plugin indent on
"use backspace as usual
set backspace=eol,indent,start
"command history
set history=10000
"do not replace tabs inserted with space
set noexpandtab
"do not insert spaces according to shiftwidth or softtabstop
set smarttab
"tabs from indentation will be 4 spaces long
set shiftwidth=4
"tabs inserted will be 4 spaces long (important for external applications)
set tabstop=4
"consecutive spaces will be treated as tabs
set softtabstop=0
"folding method
set foldmethod=marker
"foldmarker, so Vim will know where to fold
set foldmarker=#region,#endregion
"not sure about this
set showfulltag
"show possible completion on the bottom command line
set wildmenu
set wildmode=list:full
"console vim gets to use the mouse :) vim ~ gvim this way :)
set mouse=a
"scroll ahead, to prevent ugly line scrolling
set scrolloff=3
set sidescrolloff=3
"normal side scrolling (1 character, instead of half a screen)
set sidescroll=1
"easy gui copy/cut/paste, with Ctrl-C/Ctr-X/Ctrl-V
vmap <C-c> "+y
vmap <C-x> "+x
vmap <C-v> "+gP
"unmap and remap Ctrl-A, for selecting all
vmap <C-a> <Esc>ggVG
"map <Alt-v> for pasting in command mode.
cmap <C-v> <C-r>"
"nice Windows font, good for Linux too (sometimes it is not available)
set guifont=Consolas:h11
"always show tabbar
set showtabline=2
"disable menubar & toolbar
set guioptions-=m
set guioptions-=T
set guioptions-=t
"since we don't use a menu, disable the menu shortcuts
set winaltkeys=no
"setting tab widths and labels, for Gvim and Vim
set guitablabel=%N)%<%-20.30F
set guitabtooltip=%F\ %y
set tabline=%N)%<%-20.30F
"shortcuts for accessing the tabs - Alt+1..9 for direct access
map <A-1>  <Esc>1gt
map <A-2>  <Esc>2gt
map <A-3>  <Esc>3gt
map <A-4>  <Esc>4gt
map <A-5>  <Esc>5gt
map <A-6>  <Esc>6gt
map <A-7>  <Esc>7gt
map <A-8>  <Esc>8gt
map <A-9>  <Esc>9gt
map <A-0>  <Esc>10gt
"Ctrl-Tab, Ctrl - Shift - Tab for rotating through the tabs
map <C-Tab> <Esc>:tabnext<CR>
map <C-S-Tab> <Esc>:tabprevious<CR>
"Alt-Left, Alt-Right for moving *through* tabs left or right
map <M-Left> <Esc>:tabprevious<CR>
map <M-Right> <Esc>:tabnext<CR>
"Ctrl-Left, Ctrl-Right for moving tabs left or right
map <silent> <C-Left> <Esc>:exe "silent! tabmove ".(tabpagenr() - 2)<CR>
map <silent> <C-Right> <Esc>:exe "silent! tabmove ".(tabpagenr() + 1)<CR>
"tab completion
imap <S-Tab> <C-X><C-N>
" Map Escape to remove highlight from searches. This makes it easy to get rid
" of the highlight ;)
nnoremap <Esc> :noh<CR><Esc>
" Highlight spaces - wanted to see individual spaces, not used anymore, left for highlight reference.
"highlight Spaces gui=undercurl guifg=Black guibg=bg
"match Spaces /\s/
"start fullscreen on Windows (sends Alt-Space x)
au GUIEnter * simalt ~x
"autoload the session at Vim start up
"source ~/vimfiles/vimmainsession.vis"
"save session
map <F4> <Esc>:mksession! ~/vimfiles/vimmainsession.vis<CR>"
" Remap Ctrl-Space to autocomplete. Taken from here:
" http://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim.
inoremap <C-Space> <C-P>
" TODO: fix arrow keys in command mode in the console

