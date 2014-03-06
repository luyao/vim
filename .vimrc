""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Copyright 2011-2014 by Yao Lu(yaolu1103@gmail.com) 
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => for the vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
"for golang
Bundle 'dgryski/vim-godef'
Bundle 'cespare/vim-golang'
"Nerdtree
Bundle 'scrooloose/nerdtree'
"I cant use it, I'm just familiar with comdoc
"Bundle 'git://github.com/vim-scripts/c.vim.git'

Bundle 'git://github.com/mrtazz/DoxygenToolkit.vim.git'

"Bundle 'Valloric/YouCompleteMe'

"" The following are examples of different formats supported.
"" Keep bundle commands between here and filetype plugin indent on.
"" scripts on GitHub repos
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'tpope/vim-rails.git'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"" scripts from http://vim-scripts.org/vim/scripts.html
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"" scripts not on GitHub
"Bundle 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///home/gmarik/path/to/plugin'
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> TODO
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"1 make code to be intend
"nnoremap <silent><F8> :<ESC>:%s#\s\+##g<CR><ESC>gg=G
"2 auto change dir
"set autochdir
"
"DONT KNOW HOW TO USE THEM
"set minibuffer toggler
"map <silent><F11> : <ESC>\: TbToggle<cr> 
"
"let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplMapWindowsNavVim=1
"let g:miniBufExplMapWindowNavArrows=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Global variables
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" => Set mapleader
""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","

""""""""""""""""""""""""""""""
" => buffer
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=1
let g:bufExplorerSortBy = "name"

""""""""""""""""""""""""""""""
" => DoxygenToolkit settings
""""""""""""""""""""""""""""""
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param [in/out]"
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="-------------------------------"
let g:DoxygenToolkit_blockFooter="---------------------------------"
let g:DoxygenToolkit_authorName="Yao lu"
let g:DoxygenToolkit_licenseTag="Copyright (c) YaoLu(yaolu1103@gmail.com)\n All Rights Reserved"

""""""""""""""""""""""""""""""""
" => supper tab
""""""""""""""""""""""""""""""""
let g:SuperTabRetainCompletionType=1
let g:SuperTabDefaultCompletionType="<C-X><C-O>"


"Sets how many lines of history VIM har to remember
set history=400


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Some auto command definition
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<C-Y>
"set grep, we can simply use <F9>
"nnoremap <silent><F9> :Grep<CR>
nnoremap <silent><F9> :Ack<CR><>
"Fast saving
nmap <leader>w :w!<cr>

""""""""""""""""""""""""""""""""
" => Fast input the C-style code
""""""""""""""""""""""""""""""""
:inoremap #i<cr> #include<space><esc>a
:inoremap #d<cr> #define<space><esc>a
:inoremap #f<cr> #ifdef <cr><cr>#endif<esc>kk<esc>$a
:inoremap if<cr> if () {<cr><cr>}<esc>2k3la
:inoremap wh<cr> while () {<cr><cr>}<esc>2k6la
:inoremap fo<cr> for (;;) {<cr><cr>}<esc>2k4la
:inoremap cla<cr> class <cr>{<cr>public:<cr>protect:<cr>private:<cr>};<esc>6k7la
:inoremap str<cr> struct <cr>{<cr>};<esc>3k8la
:inoremap do<cr> do {<cr><cr>}while(0);<esc>2ko

""""""""""""""""""""""""""""""""
" => auto close the () {} and []
""""""""""""""""""""""""""""""""
:inoremap ( ()<ESC>i
:inoremap { {}<ESC>i
:inoremap [ []<ESC>i
":inoremap < <><ESC>i we some times need the < and >
":inoremap )<c-r>=ClosePair(')')<CR>
":inoremap }<c-r>=ClosePair('}')<CR>
":inoremap ]<c-r>=ClosePair(']')<CR>
":inoremap ><c-r>=ClosePair('>')<CR>
"function ClosePair(char)
"    if getline('.')[col('.')- 1]== a:char
"        return "\<Right"
"    else
"        return a:char
"    endif
"endf

"Map space to / and c-space to ?
map <space> /
map <leader><space> ?

"Switch to current dir
map <leader>cd :cd %:p:h<cr>

""""""""""""""""""""""""""""""""
" => hot key for file control 
""""""""""""""""""""""""""""""""
"next file
map <right> :<Esc>:bn<cr>
"previous file
map <left>  :<Esc>:bp<cr>
"close the file
map <down>  :<Esc>:w<cr>:bd<cr>
"we get a plan B here, we can use table line to changer buffer
if v:version>=700
    set switchbuf=usetab
endif
if exists("&showtabline")
    set stal=4
endif

""""""""""""""""""""""""""""""""
" => hot keys for NERDTree 
""""""""""""""""""""""""""""""""
map <leader>nd :<Esc>:NERDTreeToggle<cr>
map <leader>nc :<Esc>:NERDTreeClose<cr>

"WindowZ
map <c-w><c-t> :WMToggle<cr>

""""""""""""""""""""""""""""""""
" => General Abbrev
""""""""""""""""""""""""""""""""
"My information, we can use xdate or xname to complate them
ia  xdate <c-r>=strftime("%Y/%m/%d %H:%M:%S")<cr>
iab xname Yao Lu(yaolu1103@gmail.com) 



"Enable filetype plugin
filetype on
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
"set noswapfile
set nowb

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fen
set fdl=0



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set the systags
set tags+=/home/luyao/tags/tags

""""""""""""""""""""""""""""""
" => Tag list (ctags)
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Sort_Type = "name"
let Tlist_GainFocus_On_ToggleOpen = 1 
let Tlist_Show_Menu = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
map <leader>tt :<esc>:TlistToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Font and scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable
"set background=dark
colorscheme default 

"color
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black

"Highlight current
set cursorline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fileformat & File encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetype
set ffs=unix,dos,mac
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

"encoding
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

"set the help doc's language to chinese
set helplang=cn


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text option
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Restore cursor to file position in previous editing session
set viminfo='10,"100,:20,%,n~/.viminfo
"do not want any tab, use space to substitute them
set list
"set blanks visiable
set listchars=tab:\|\ 
highlight LeaderTab guifg=#666666
match LeaderTab /^\t/
"Auto indent
set ai
set wrap
set ts=4
set expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn on WiLd menu, we can use tab to complate the cmd
set wildmenu
"Always show current position
set ruler
"The commandbar is 1 high
set cmdheight=1
"Show line number
set nu
"Change buffer - without saving, its useful when edit multi-files
set hid 
"Set backspace
set whichwrap+=<,>,h,l
set backspace =eol,indent,start  
"set case when searching
set incsearch
"Set magic on
set magic
"No sound on errors.
set noerrorbells
set novisualbell
"show matching bracet
set showmatch
"How many tenths of a second to blink
set mat=4
"Highlight search thing
set hlsearch



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! Cwd()
    let cwd = getcwd()
    return "e" . cwd
endfunc

func! DeleteTillSlash()
    let g:cmd = getcmdline()
    if MySys() == "unix" || MySys() == "mac"
        let g:cmd_edited = substitute(g:cmd, "(.*[/]).*", "", "")
    else
        let g:cmd_edited = substitute(g:cmd, "(.*[\]).*", "", "")
    endif
    if g:cmd == g:cmd_edited
        if MySys() == "unix" || MySys() == "mac"
            let g:cmd_edited = substitute(g:cmd, "(.*[/]).*/", "", "")
        else
            let g:cmd_edited = substitute(g:cmd, "(.*[\]).*[\]", "", "")
        endif
    endif
    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Format the statusline
" Nice statusbar
set laststatus=2
set statusline=
set statusline+=%2*%-3.3n%0*\ " buffer number
set statusline+=%f\ " file name
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=[
if v:version >= 600
    set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
    set statusline+=%{&encoding}, " encoding
endif
set statusline+=%{&fileformat}] " file format
set statusline+=%1*\ %-16{strftime(\"%Y-%M-%d\ %H:%M:%S\")} " timer
if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
    set statusline+=\ %{VimBuddy()} " vim buddy
endif
set statusline+=%= " right align
set statusline+=%2*0x%-8B\ " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

" special statusbar for special window
if has("autocmd")
    au FileType qf
                \ if &buftype == "quickfix" |
                \ setlocal statusline=%2*%-3.3n%0* |
                \ setlocal statusline+=\ \[Compiler\ Messages\] |
                \ setlocal statusline+=%=%2*\ %<%P |
                \ endif

    fun! FixMiniBufExplorerTitle()
        if "-MiniBufExplorer-" == bufname("%")
            setlocal statusline=%2*%-3.3n%0*
            setlocal statusline+=\[Buffers\]
            setlocal statusline+=%=%2*\ %<%P
        endif
    endfun

    if v:version>=600
        au BufWinEnter *
                    \ let oldwinnr=winnr() |
                    \ windo call FixMiniBufExplorerTitle() |
                    \ exec oldwinnr . " wincmd w"
    endif
endif

" Nice window title
if has('title') && (has('gui_running') || &title)
    "Set titlestring=
    set titlestring+=%f\ " file name
    set titlestring+=%h%m%r%w " flag
    set titlestring+=\ -\ %{v:progname} " program name
endif



