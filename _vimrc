set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" =============================================================================
" initial config
" =============================================================================


" =============================================================================






" =============================================================================
" vundle config

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$VIM_HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$VIM_HOME/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin '$VIM_HOME/vimfiles/bundle/Vundle.vim'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'L9', {'name': 'newL9'}

" ------------------------------------------------------------------------
" jim's plugin
Plugin 'tommcdo/vim-exchange'

" github repo
" Plugin 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'

Plugin 'scrooloose/nerdtree'
" Plugin  'scrooloose/syntastic'
" Plugin 'tommcdo/vim-exchange'
Plugin 'terryma/vim-multiple-cursors'

" tpope's awesome vim plugins
Plugin 'tpope/vim-repeat'
Plugin  'tpope/vim-unimpaired'
" Plugin  'tpope/vim-speeddating'
Plugin  'tpope/vim-abolish'
Plugin  'tpope/vim-surround'
Plugin  'tpope/vim-commentary'
Plugin  'tpope/vim-eunuch'

"color scheme
Plugin 'altercation/vim-colors-solarized'
Plugin 'nelstrom/vim-blackboard'
Plugin 'sickill/vim-monokai'

"very useful plugins
" Plugin  'mileszs/ack.vim'
Plugin  'kien/ctrlp.vim'
Plugin  'Lokaltog/vim-easymotion'
" Plugin 'xolox/vim-lua-ftplugin'
" Plugin  'gabrielelana/vim-markdown'
Plugin  'pangloss/vim-javascript'
Plugin  'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin  'sjl/gundo.vim'
Plugin  'nelstrom/vim-visual-star-search'
Plugin  'nelstrom/vim-qargs'
Plugin  'klen/python-mode'
Plugin 'vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin  'SirVer/ultisnips'
" Plugin  'xuhdev/SingleCompile'
" Plugin  'oblitum/bufkill'
" Plugin  'wikitopian/hardmode'
Plugin  'Raimondi/delimitMate'
Plugin  'mileszs/ack.vim'
" Plugin  'kchmck/vim-coffee-script'
" Plugin  'skammer/vim-css-color'
Plugin  'xolox/vim-misc'
" Plugin  'Valloric/YouCompleteMe'
" if you use Vim for programming, please comment the necomplcache and use
" YouComplete Me instead
Plugin 'Shougo/neocomplcache.vim'
Plugin  'ervandew/supertab'

"text object plugin
Plugin  'kana/vim-textobj-lastpat'
Plugin  'kana/vim-textobj-user'
Plugin  'kana/vim-textobj-line'
Plugin  'kana/vim-textobj-indent'
Plugin  'kana/vim-textobj-entire'
Plugin  'kana/vim-textobj-syntax'

" gist repo
" Plugin  'mattn/gist-vim'
" Plugin  'mattn/webapi-vim'

" vim-scripts"
Plugin  'a.vim'
Plugin  'bufexplorer.zip'
" Plugin  'calendar.vim--Matsumoto'
" Plugin  'DoxygenToolkit.vim'
Plugin  'ZoomWin'
Plugin  'DrawIt'
" ------------------------------------------------------------------------

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" =============================================================================



" =============================================================================
" key map configs
let mapleader = ','
let g:mapleader = ','

" 去掉搜索高亮
"noremap <silent><leader>/ :nohls<CR>
map <leader>/ :nohls<CR>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" 手动刷新tags(含cscope)
nmap tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *<CR>:set tags+=./tags<CR>:!cscope -Rbq<CR>:cs add ./cscope.out .<CR>

" 切换buffer
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

" cscope设置
if has("cscope")
"    set csprg=/usr/bin/cscope   " 制定cscope命令
    set csto=0                  " ctags查找顺序，0表示先cscope数据库再标签文件，1表示先标签文件爱
    set cst                     " 同时搜索tag文件和cscope数据库
    set cscopequickfix=s-,c-,d-,i-,t-,e-  "使用QucikFix窗口来显示cscope查找结果
    set nocsverb
    if filereadable("cscope.out")  "如果当前目录下有cscope.out则加载进Vim
        cs add cscope.out
    elseif $CSCOPE_DB != ""       "否则只要环境变量不为空就添加制定的数据库到Vim
        cs add $CSCOPE_DB
    endif
    set csverb
endif
"map <F4>:!cscope -Rbq<CR>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
" 查找符号
nmap <leader>css :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
" 查找定义
nmap <leader>csg :cs find g <C-R>=expand("<cword>")<CR><CR>
" 查找被这个函数调用的函数
nmap <leader>csd :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
" 查找调用这个函数的函数
nmap <leader>csc :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
" 查找这个字符串
nmap <leader>cst :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
" 查找这个egrep匹配模式
nmap <leader>cse :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
" 查找这个文件
nmap <leader>csf :cs find f <C-R>=expand("<cfile>")<CR><CR>
" 查找include这个文件的文件
nmap <leader>csi :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>

" 设定是否使用QuickFix来显示结果
set cscopequickfix=s-,c-,d-,i-,t-,e-

" QuickFix open and close
nnoremap <F11> :copen<CR>
nnoremap <F12> :cclose<CR>

" QucikFix next and prev
nnoremap <F9> :cn<CR>
nnoremap <F10> :cp<CR>

" =============================================================================

" =============================================================================
" jim's config
set nu
colorscheme desert 
syntax enable 
syntax on
" 去掉菜单栏
"set go=
set cindent        "cindent smartindent   autoindent
set smartindent        "cindent smartindent   autoindent
set autoindent        "cindent smartindent   autoindent
set tabstop=4     " tab占用4个空格
set shiftwidth=4  " 设置缩进为4字节
set expandtab     " 扩展tab键为空格
set incsearch     " 增量式搜索
set hlsearch      " 高亮搜索

" 解决中文乱码
let &termencoding = &encoding
set fileencodings=utf-8,gbk

filetype on
filetype plugin on
filetype indent on

" 根据C cpp来缩进
"autocmd FileType c,cpp set foldmethod=indent
autocmd FileType c,cpp set number
autocmd FileType c,cpp set cindent

" 根据python来缩进
"autocmd FileType python set foldmethod=syntax
autocmd FileType python set number
autocmd FileType python set smartindent

" 文件修改后自动读入
set autoread

" 设置当前横竖线
" set cursorline
" set cursorcolumn

set ruler
set showcmd
set showmode
set showmatch
set smartcase
set ignorecase
set smarttab
set lbr
set shiftround
set completeopt=longest,menu
set wildmenu
set mouse=a        " 设置vim中可以使用鼠标
set magic          " 为了使用正则表达式
set nowrap

set backspace=indent,eol,start
set laststatus=2
set pastetoggle=<F2>

"plugins key maps" {{{
"--commentary plugin,comment a line
map <leader>/ \\\
"go back and forth from header file and source file
nmap <silent> <leader>f :A<cr>
"open a tag list ivew
nmap <silent> <leader>ta :TagbarToggle <CR>
"disable default buffergator keymaps"
let g:buffergator_suppress_keymaps = 1

"config for ZoomWin plugin map
nmap <silent>,o :ZoomWin <cr>

"config for BufferNavigator"
nmap <leader>bf :BufExplorer<cr>
"}}}

"nerdTree plugin config {{{
" autocmd vimenter * NERDTree
nmap <silent> <leader>n :NERDTreeToggle <CR>
let NERDTreeShowHidden=1
" bufkill bd's: really do not mess with NERDTree buffer
nnoremap <silent> <backspace> :BD<cr>
nnoremap <silent> <s-backspace> :BD!<cr>

" Prevent :bd inside NERDTree buffer
au FileType nerdtree cnoreabbrev <buffer> bd <nop>
au FileType nerdtree cnoreabbrev <buffer> BD <nop>
"}}}

"better tag navigation from www.vimbits.com {{{
nnoremap <leader><Enter> <C-]>
"}}}


"automatically save foldings in vim{{{
" au BufWinLeave * silent! mkview
" au BufWinEnter * silent! loadview
"}}}

"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


"configure for UltiSnips plugin {{{ 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"}}}

"mappings ctrl-s to save {{{
nnoremap <silent> <C-S> :<C-u>Update<CR>
" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
"}}}

set nocompatible

function! GetRunningOS()
  if has("win32")
    return "win"
  endif
  if has("unix")
    if system('uname')=~'Darwin'
      return "mac"
    else
      return "linux"
    endif
  endif
endfunction

let os = GetRunningOS()

if os=="win"
"set guioptions-=m
"set guioptions-=T
"language message zh_CN.utf-8
endif


" =============================================================================
