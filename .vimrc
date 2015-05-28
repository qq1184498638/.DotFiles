""""""""""""""""""""""""""""""""""
" TODO SECTION
" - use silver searcher: https://github.com/ggreer/the_silver_searcher
" - analyze .vimrc files: https://github.com/thoughtbot/dotfiles/blob/master/vimrc
" - Ben Orenstein
" - koles z vim as a python ide
" - TIDY your vimrc

""""""""""""""""""""""""""""""""""
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


" Make backspace behave linke normal again
set bs=2

" Rebind <Leader> key
let mapleader = ","

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
 noremap <C-n> :nohl<CR>
 vnoremap <C-n> :nohl<CR>

" Quicksave command
"noremap <Leader>a :update<CR>
"vnoremap <Leader>a :update<CR>
"noremap <C-S> :update<CR>
"vnoremap <C-S> <C-C>:update<CR>

":noremap <M-s> :w<kEnter>  "Works in normal mode, must press Esc first"
":inoremap <M-s> <Esc>:w<kEnter>i "Works in insert mode, saves and puts back in insert mode"

" vmap y ygv<Esc>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

noremap <Leader>v :vsplit .<CR>
noremap <Leader>h :split .<CR>
noremap <Leader>r :Ex<CR>

" Emacs-like beginning and end of line.
"imap <c-e> <c-o>$
"imap <c-a> <c-o>^

" your working directory will be always the same as the file you are editing
autocmd BufEnter * silent! lcd %:p:h

noremap <Leader>d "_d

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" learn normal navigation you stinky bastard!!!!!
" provide hjkl movements in Insert mode and Command-line mode via the <Alt> modifier key
noremap! <A-h> <Left>
noremap! <A-j> <Down>
noremap! <A-k> <Up>
noremap! <A-l> <Right>

" provide hjkl movements in Command-line mode via the <Alt> modifier key
cnoremap <A-h> <Left>
cnoremap <A-j> <Down>
cnoremap <A-k> <Up>
cnoremap <A-l> <Right>


"Forget compatibility with Vi. Who cares.
set nocompatible

" searching done!
noremap <Leader>/ :nohls<CR>

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <Leader>t <esc>:tabnew<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

set tw=110   " width of document (used by gd)

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Setup Pathogen to manage your plugins
call pathogen#infect()

set laststatus=2

"map xx <Plug>NERDComInvertComment
"remap <leader><leader> <plug>NERDComInvertComment
" imap <C-/> <plug>NERDComInvertComment
" vmap <C-/> <plug>NERDComInvertComment

" """""""""""""""""""""""
" Setting up syntactic check (eslint, python, ...)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_args = "-c /Users/tomasz/.eslintrc"
let g:syntastic_python_pylint_args = "--rcfile /Users/tomasz/.pylintrc"
" let g:syntastic_python_checkers = []
let g:syntastic_tex_checkers = []

:let g:syntastic_loc_list_height=5
" syntactic end.

autocmd BufNewFile,BufReadPost *.styl set filetype=stylus

"folding settings
" set foldmethod=syntax    "fold based on indent
" set foldmethod=indent    "fold based on indent
" set foldnestmax=10      "deepest fold is 10 levels
" set nofoldenable        "dont fold by default
" set foldlevel=1         "this is just what i use

noremap :b<CR> :ConqueTerm bash<CR>

let g:jedi#goto_definitions_command = "<leader>D"

" Ctrl-Space for completions. Heck Yeah!
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

"inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"set nofoldenable

""set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
"
"Plugin 'https://github.com/907th/vim-auto-save'

"" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
"" To ignore plugin indent changes, instead use:
""filetype plugin on
""
"" Brief help
"" :PluginList       - lists configured plugins
"" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""
"" see :h vundle for more details or wiki for FAQ
"" Put your non-Plugin stuff after this line
"
"let g:auto_save = 1  " enable AutoSave on Vim startup

"execute pathogen#infect()
"filetype plugin indent on
filetype plugin on

" Terminal config
let g:ConqueTerm_Color = 1

":noremap j 6j <CR>
":noremap k 6k <CR>
:noremap J 8j<CR>
:noremap K 6k<CR>

:set number
:set relativenumber
:set wrap
:set linebreak
:set nolist  " list disables linebreak
:set mouse=a

:set history=70
:set autoread

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Enable syntax highlighting
syntax enable

colorscheme desert
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Turn backup off, since most stuff is in SVN, git et.c anyway...
" TODO set this on and set dir for these
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

set wrap "Wrap lines

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"set colorcolumn=110
"highlight ColorColumn ctermbg=7

:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen  

" Show trailing whitespace and spaces before a tab:
:match ExtraWhitespace /\s\+$\| \+\ze\t | [^\t]\zs\t\+/

"coloring characters after 80
"highlight OverLength ctermbg=green ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

vnoremap # :s#^#\##<cr>
vnoremap -# :s#^\###<cr>

" No need to be compatible with ancient software
set nocompatible

" Show title of file we are editing
set title

" Fast terminal, give me a smooth graphical experience
set ttyfast

" Pasting is good
set paste

" Show what mode we are in
set showmode
set showcmd
set laststatus=2

set autowrite

" Show the line we're currently on
set cursorline
" biale nr linii poza aktualna
highlight LineNr ctermfg=green

" kodowanie
set encoding=utf-8
set fileencodings=utf-8,latin2,cp1250
set termencoding=utf-8

" Allows vim to handle multiple buffers at the same time
set hidden

" Redraw only when we need to
" Vim loves to redraw the screen during things it probably doesn't need to—like
" in the middle of macros. This tells Vim not to bother redrawing during these
" scenarios, leading to faster macros.
" - http://dougblack.io/words/a-good-vimrc.html
set lazyredraw


" Show current git branch in statusline.
"set statusline=%{fugitive#statusline()}

" Make search/replace global by default
set gdefault

" Persistent undo
set undodir='~/vim_undo'
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer relod

" Autofix simple typos
iabbrev teh the
iabbrev Teh The
iabbrev wiht with

" Standard save method. Simpler and shorter
"map <c-s> :w<CR>

let g:SuperTabDefaultCompletionType = "context"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
        return 'PASTE MODE '
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

""""""""""""""""""""""""
" nice tabs numbers

:set tabline=%!MyTabLine()

if exists("+showtabline")
     function! MyTabLine()
         let s = ''
         let t = tabpagenr()
         let i = 1
         while i <= tabpagenr('$')
             let buflist = tabpagebuflist(i)
             let winnr = tabpagewinnr(i)
             let s .= '%' . i . 'T'
             let s .= (i == t ? '%1*' : '%2*')
             let s .= ' '
             let s .= i . ')'
             let s .= ' %*'
             let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
             let file = bufname(buflist[winnr - 1])
             let file = fnamemodify(file, ':p:t')
             if file == ''
                 let file = '[No Name]'
             endif
             let s .= file
             let i = i + 1
         endwhile
         let s .= '%T%#TabLineFill#%='
         let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
         return s
     endfunction
     set stal=2
     set tabline=%!MyTabLine()
endif

" navigation between panes in split window
:nmap <silent> <C-h> :wincmd h<CR>
:nmap <silent> <C-j> :wincmd j<CR>
:nmap <silent> <C-k> :wincmd k<CR>
:nmap <silent> <C-l> :wincmd l<CR>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

:imapclear
imap <Up> dd<CR>
imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>
inoremap <Up> dd<CR>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

inoremap <C-Z> <C-O>:update<CR>
inoremap <C-n> :nohl<CR>
