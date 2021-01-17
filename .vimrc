"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=c:\code\sr\dotfiles\.vim\bundle\vundle.vim     " Set the runtime path to include Vundle and initialize

call vundle#begin('c:\code\sr\dotfiles\.vim\bundle')           " Install plugins in this dir

Plugin 'VundleVim/Vundle.vim'                       " let Vundle manage Vundle, required
Plugin 'itchyny/lightline.vim'                      " informative status bar
Plugin 'scrooloose/nerdtree'		                " quick dir viewer
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'frazrepo/vim-rainbow'                       " rainbow paranthesis
Plugin 'vim-python/python-syntax'
"Plugin 'ap/vim-css-color'                           " color previews for CSS
Plugin 'tpope/vim-surround'                         " change surrounding marks
Plugin 'tpope/vim-repeat'                           " dot works with plugins
Plugin 'mtdl9/vim-log-highlighting'
Plugin 'vimwiki/vimwiki'                            " Vim wiki
Plugin 'tpope/vim-commentary'                       " Better comments
Plugin 'unblevable/quick-scope'                     " First letter highlighting
"Plugin 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

"Plugin 'dracula/vim', { 'name': 'dracula' }         " colorscheme
"Plugin 'gosukiwi/vim-atom-dark', { 'name': 'vim-atom-dark' }         " colorscheme
Plugin 'tomasiser/vim-code-dark'


call vundle#end()		        " required, all plugins must appear before this line.
filetype plugin indent on       " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('win32')
    "set guifont=Ubuntu\ Mono:h16
    set guifont=Consolas:h17
else
    set guifont=Monaco:h15
    "set guifontwide=NSimsun:h12
endif

"colorscheme atom-dark
colorscheme codedark
"colorscheme dracula

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hexokinase
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Hexokinase_highlighters = [ 'sign_column' ]
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names,'
let g:Hexokinase_ftEnabled = ['css', 'html', 'js', 'qml']



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick Scope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tags =C:\code\app-player\hd\Source\tags
set tags+=C:\code\app-player\opengl\tags
set tags+=C:\code\app-player\arabica\source\tags
set tags+=C:\code\scratch-sohil\tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'codedark',
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vimwiki_list = [
            \ {
            \   'path': 'c:\code\sr\dotfiles\.vim\vimwiki',
            \   'syntax': 'markdown',
            \   'ext': '.md',
            \}
            \]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <space> za
nnoremap <c-u> veU
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

"Tabs
nnoremap tn :tabnew<CR>
nnoremap tj :tabprev<CR>
nnoremap tk :tabnext<CR>
nnoremap tq :tabclose<CR>

" Remove  chars
nnoremap tt :%s/<C-M>//g<CR>

"Switch between windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR><CR>
nmap <silent> <A-=> :wincmd =<CR><CR>
nmap <silent> <A-_> :wincmd _<CR><CR>
nmap <silent> <A-\|> :wincmd \|<CR><CR>

"Open matching tag in new tab or vsp
nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

let mapleader = ","

nnoremap <leader>ev :vsp c:\code\sr\dotfiles\.vimrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
inoremap jk <esc>
"inoremap <esc> <nop>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show statusline
set laststatus=2

syntax enable
set number relativenumber
let g:rehash256 = 1

" Use spaces instead of tabs
set expandtab
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch
set hlsearch                    " Keep matches highlighted
set nobackup
set noswapfile

let g:python_highlight_all = 1

set ignorecase

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set clipboard=unnamed

" Start NERDTree if no file else in insert mode
function InsertIfEmpty()
    if @% == ""                                 " No file opened
        NERDTree
    elseif filereadable(@%) == 0                " File doesn't exist yet
        startinsert
    elseif line('$') == 1 && col('$') == 1      " File is empty
        startinsert
    endif
endfunction

au VimEnter * call InsertIfEmpty()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38
let g:NERDTreeWinPos = "right"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Force convert text to UTF-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setglobal termencoding=utf-8 fileencodings=
scriptencoding utf-8
set encoding=utf-8

autocmd BufNewFile,BufRead  *   try
autocmd BufNewFile,BufRead  *   set encoding=utf-8
autocmd BufNewFile,BufRead  *   endtry

"Convert to UNIX fileformat (avoid CRLF)
set fileformat=unix

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Ignore 'useless' extensions for wildmenu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildignore+=*.a,*.o,*.so,*.pyc,.git,*.obj
set wildignore+=*.jpg,*.png,*.gif,*.bmp,*.ico,*.pdf
set wildignore+=*.tmp,*.swp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Trailing spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CleanExtraSpaces() "Function to clean unwanted spaces
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun


autocmd BufWritePre * :call CleanExtraSpaces()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  highlight LineNr           ctermfg=8    ctermbg=none    cterm=none
  highlight CursorLineNr     ctermfg=7    ctermbg=8       cterm=none
  highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
  highlight Statement        ctermfg=2    ctermbg=none    cterm=none
  highlight Directory        ctermfg=4    ctermbg=none    cterm=none
  highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
  highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
  highlight NERDTreeClosable ctermfg=2
  highlight NERDTreeOpenable ctermfg=8
  highlight Comment          ctermfg=4    ctermbg=none    cterm=none
  highlight Constant         ctermfg=12   ctermbg=none    cterm=none
  highlight Special          ctermfg=4    ctermbg=none    cterm=none
  highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
  highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
  highlight String           ctermfg=12   ctermbg=none    cterm=none
  highlight Number           ctermfg=1    ctermbg=none    cterm=none
  highlight Function         ctermfg=1    ctermbg=none    cterm=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Language
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let $LANG='en'
set langmenu=en

"Sourcing evrything again
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
