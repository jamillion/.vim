" better plugin management
call pathogen#infect()

set tabpagemax=50
set sidescroll=1
set sidescrolloff=10
set scrolloff=10
set backspace=indent,eol,start " fixes issue with compiled 7.3 not backspacing properly
set nocompatible
set number
set ruler
set wildmode=list:longest,full
set showmode
set history=50
set nomodeline
set nowrap
set shiftwidth=2
set shiftround
set expandtab
set tabstop=2
" set textwidth=80 " Hard-wrap column
filetype on
filetype plugin indent on
syntax enable
autocmd FileType html set formatoptions+=t1
set ignorecase
set smartcase
set incsearch
au BufRead,BufNewFile *.hamlc set ft=haml
au BufRead,BufNewFile Capfile set ft=ruby
au BufRead,BufNewFile Rakefile set ft=ruby
au BufRead,BufNewFile Guardfile set ft=ruby


" For easy select of recently pasted text
nnoremap gp `[v`]
nmap <C-T> :TagbarToggle<CR>
" Visual Bell instead of Audio Bell
set vb

" Tidy XML when opened
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" used to map Space bar as fold key
" set foldmethod=syntax
" set foldlevel=99 " files open with no folds
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
" vnoremap <Space> zf

set clipboard+=unnamed

" shows TODOs in project
map <F4> :grep TODO -r app/ test/ config/ db/ lib/<CR>

" NERDTree shortcut
map <C-N> :NERDTreeToggle<CR>

" Swap windows more easily
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <C-w>y :call MarkWindowSwap()<CR>
nmap <silent> <C-w>m :call DoWindowSwap()<CR>

" Syntastic Syntax Options
let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': ['ruby', 'php', 'javascript'],
                            \ 'passive_filetypes': ['html', 'haml', 'erb'] }
map <C-S> :SyntasticToggleMode<CR>

" load different shell
set shell=/usr/local/bin/zsh

" ignores
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,/public/js/vendor/,/components/*,*/builtAssets/*,*/coverage/*
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|log|solr|public\/js\/vendor|components|builtAssets|node_modules)$'
let NERDTreeIgnore=['node_modules']

" Files over 1 MB are considered large files
let g:LargeFile=1

" Disable syntax on files over 5000 lines
au BufRead,BufNewFile * if line("$") > 5000|set syntax=|endif


" used to save viewstate, but conflicts with rails.vim
" au BufWinLeave * silent! mkview
" au BufWinEnter * silent! loadview
"

" Inspiration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Maintainer: 
" "       Amir Salihefendic
" "       http://amix.dk - amix@amix.dk
" "
" " Version: 
" "       5.0 - 29/05/12 15:43:36
" "
" " Blog_post: 
" "       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
" "
" " Awesome_version:
" "       Get this config, nice color schemes and lots of plugins!
" "
" "       Install the awesome version from:
" "
" "           https://github.com/amix/vimrc
" "
" " Syntax_highlighted:
" "       http://amix.dk/vim/vimrc.html
" "
" " Raw_version: 
" "       http://amix.dk/vim/vimrc.txt
" "
" " Sections:
" "    -> General
" "    -> VIM user interface
" "    -> Colors and Fonts
" "    -> Files and backups
" "    -> Text, tab and indent related
" "    -> Visual mode related
" "    -> Moving around, tabs and buffers
" "    -> Status line
" "    -> Editing mappings
" "    -> vimgrep searching and cope displaying
" "    -> Spell checking
" "    -> Misc
" "    -> Helper functions
" "
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => General
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Sets how many lines of history VIM has to remember
" set history=700

" " Enable filetype plugins
" filetype plugin on
" filetype indent on

" " Set to auto read when a file is changed from the outside
" set autoread

" " With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
" let mapleader = ","
" let g:mapleader = ","

" " Fast saving
" nmap <leader>w :w!<cr>


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => VIM user interface
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Set 7 lines to the cursor - when moving vertically using j/k
" set so=7

" " Turn on the WiLd menu
" set wildmenu

" " Ignore compiled files
" set wildignore=*.o,*~,*.pyc

" "Always show current position
" set ruler

" " Height of the command bar
" set cmdheight=2

" " A buffer becomes hidden when it is abandoned
" set hid

" " Configure backspace so it acts as it should act
" set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

" " Ignore case when searching
" set ignorecase

" " When searching try to be smart about cases 
" set smartcase

" " Highlight search results
" set hlsearch

" " Makes search act like search in modern browsers
" set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" " For regular expressions turn magic on
" set magic

" " Show matching brackets when text indicator is over them
" set showmatch
" " How many tenths of a second to blink when matching brackets
" set mat=2

" " No annoying sound on errors
" set noerrorbells
" set novisualbell
" set t_vb=
" set tm=500


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Colors and Fonts
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Enable syntax highlighting
" syntax enable

colorscheme busybee
set background=dark
" set background=light
" colorscheme pyte

" " Set extra options when running in GUI mode
" if has("gui_running")
"     set guioptions-=T
"     set guioptions+=e
"     set t_Co=256
"     set guitablabel=%M\ %t
" endif

" " Set utf8 as standard encoding and en_US as the standard language
" set encoding=utf8

" " Use Unix as the standard file type
" set ffs=unix,dos,mac


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Files, backups and undo
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Turn backup off, since most stuff is in SVN, git et.c anyway...
set noswapfile


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Text, tab and indent related
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Use spaces instead of tabs
" set expandtab

" " Be smart when using tabs ;)
" set smarttab

" " 1 tab == 4 spaces
" set shiftwidth=4
" set tabstop=4

" " Linebreak on 500 characters
" set lbr
" set tw=500

" set ai "Auto indent
" set si "Smart indent
" set wrap "Wrap lines


" """"""""""""""""""""""""""""""
" " => Visual mode related
" """"""""""""""""""""""""""""""
" " Visual mode pressing * or # searches for the current selection
" " Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Moving around, tabs, windows and buffers
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" " Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" " Disable highlight when <leader><cr> is pressed
" map <silent> <leader><cr> :noh<cr>

" " Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

" " Close the current buffer
" map <leader>bd :Bclose<cr>

" " Close all the buffers
" map <leader>ba :1,1000 bd!<cr>

" " Useful mappings for managing tabs
" map <leader>tn :tabnew<cr>
" map <leader>to :tabonly<cr>
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove

" " Opens a new tab with the current buffer's path
" " Super useful when editing files in the same directory
" map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" " Switch CWD to the directory of the open buffer
" map <leader>cd :cd %:p:h<cr>:pwd<cr>

" " Specify the behavior when switching between buffers 
" try
"   set switchbuf=useopen,usetab,newtab
"   set stal=2
" catch
" endtry

" " Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" " Remember info about open buffers on close
set viminfo^=%


" """"""""""""""""""""""""""""""
" " => Status line
" """"""""""""""""""""""""""""""
" " Always show the status line
set laststatus=2

" " Format the status line
set statusline=%{winnr()}\ %t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Editing mappings
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Remap VIM 0 to first non-blank character
" map 0 ^

" " Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" if has("mac") || has("macunix")
"   nmap <D-j> <M-j>
"   nmap <D-k> <M-k>
"   vmap <D-j> <M-j>
"   vmap <D-k> <M-k>
" endif

" " Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => vimgrep searching and cope displaying
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" " Open vimgrep and put the cursor in the right position
" map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" " Vimgreps in the current file
" map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" " When you press <leader>r you can search and replace the selected text
" vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" " Do :help cope if you are unsure what cope is. It's super useful!
" "
" " When you search with vimgrep, display your results in cope by doing:
" "   <leader>cc
" "
" " To go to the next search result do:
" "   <leader>n
" "
" " To go to the previous search results do:
" "   <leader>p
" "
" map <leader>cc :botright cope<cr>
" map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
" map <leader>n :cn<cr>
" map <leader>p :cp<cr>


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Spell checking
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Pressing ,ss will toggle and untoggle spell checking
" map <leader>ss :setlocal spell!<cr>

" " Shortcuts using <leader>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=


" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Misc
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Remove the Windows ^M - when the encodings gets messed up
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" " Quickly open a buffer for scripbble
" map <leader>q :e ~/buffer<cr>

" " Toggle paste mode on and off
" map <leader>pp :setlocal paste!<cr>



" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Helper functions
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" column highlighting
highlight OverLength ctermbg=59 ctermfg=grey guibg=#a0a0a0
match OverLength /\%81v.\+/
autocmd BufWritePost * match OverLength /\%81v.\+/
autocmd BufWinEnter * match OverLength /\%81v.\+/


