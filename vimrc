"===================================
""    Vundle基本配置start
"===================================
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
call vundle#end()            " required
filetype plugin indent on    " required
"===================================
""    Vundle基本配置end
"===================================


"===================================
""    Vim基本配置start
"===================================
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$" 
        set encoding=utf-8 
endif
" 不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题
set nocompatible
" 检测文件的类型
filetype on
filetype plugin on
filetype plugin indent on
set completeopt=longest,menu
syntax on
" 去掉烦人的交换文件
set noswf
" 自动缩进 
set autoindent
"智能对齐方式 
set smartindent
" 一个tab是4个字符 
set tabstop=4
" 按一次tab前进4个字符 
set softtabstop=4
" 设置自动缩进 
set ai!
" 缩进的字符个数 
set cindent shiftwidth=4 
set autoindent shiftwidth=4
" 显示行号 
set number
" 打开光标的行列位置显示功能 
set ruler
" 行高亮 
set cursorline
" 高亮搜索的关键字 
set hlsearch
" 搜索忽略大小写 
set ignorecase
" 设置命令历史行数
set history=100
" 不要闪烁 
set novisualbell
" 显示TAB健 
"set list 
"set listchars=tab:>-,trail:-
" 去掉有关vi一致性模式，避免以前版本的一些bug和局限 
set nocp  
" 增强模式中的命令行自动完成操作 
set wildmenu
" 修改注释的颜色
highlight Comment ctermfg=yellow guifg=yellow

"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"set cursorline cursorcolumn

"() {} []自动不全
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
"":inoremap < <><ESC>i
"":inoremap > <c-r>=ClosePair('>')<CR>
"function ClosePair(char)
"	if getline('.')[col('.') - 1] == a:char
"		return \"\<Right>"
"	else
"		return a:char
"	endif
"endf

au FileType php call AddPHPFuncList()
function AddPHPFuncList()
	set dictionary-=~/.vim/php_funclist.txt dictionary+=~/.vim/php_funclist.txt
	set complete-=k complete+=k
endfunction

"在当前含的上面添加函数的注释
map <F5> ms:call AddNotes()<cr>'s
function AddNotes()
	call append(line(".")-1,"/**")
	call append(line(".")-1," * description\t")
	call append(line(".")-1," * @access\tpublic")
	call append(line(".")-1," * @author\t\zhaoyingnan\t".strftime("%Y-%m-%d %H:%M"))
	call append(line(".")-1," * @param\tint\t\t\t$iVar")
	call append(line(".")-1," * @param\tstring\t\t$sVar")
	call append(line(".")-1," * @param\tarray\t\t$arVar")
	call append(line(".")-1," * @return\t")
	call append(line(".")-1," * @note\t")
	call append(line(".")-1," **/")
	normal gg=G
endfunction

"添加头文件
map <F4> ms:call AddTitle()<cr>'s
function AddTitle()
	call append(1,"/**")
	call append(2," * @package\tDescription")
	call append(3," * @author\tzhaoyingnan<zhaoyn@bbtree.com>")
	"call append(3," * Create date:".strftime("%Y-%m-%d %H:%M"))
	"call append(4," * Modified date:".strftime("%Y-%m-%d%H:%M"))
	call append(4," * @copyright\t")
	call append(5," * @version\t")
	call append(6," * @since\t")
	call append(7," **/")
endfunction

"python
map <F6> ms:call AddNotesForPython()<cr>'s
function AddNotesForPython()
	call append(line(".")-1," ###")
	call append(line(".")-1," # description\t")
	call append(line(".")-1," # @access\tpublic")
	call append(line(".")-1," # @author\t\zhaoyingnan\t".strftime("%Y-%m-%d %H:%M"))
	call append(line(".")-1," # @param\tint\t\t\tiVar")
	call append(line(".")-1," # @param\tstring\t\tsVar")
	call append(line(".")-1," # @param\tarray\t\tarVar")
	call append(line(".")-1," # @return\t")
	call append(line(".")-1," # @note\t")
	call append(line(".")-1," ###")
	normal gg=G
endfunction

"===================================
""    Vim基本配置end
"===================================


"===================================
""    airline setting start
"===================================
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" color
set laststatus=2
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '▶'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#buffline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
" 启用/禁用标签模式显示标签数
let g:airline#extensions#tabline#show_tab_nr = 0
" rename label for buffers (default: 'buffers')
let g:airline#extensions#tabline#buffers_label = 'buffers'

" 快捷键切换
let mapleader=','
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" other setting
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let airline#extensions#c_like_langs = ['c', 'cpp', 'cuda', 'javascript', 'ld', 'php']
"===================================
""    airline setting end
"===================================


"===================================
""    syntastic setting start
"===================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"===================================
""    syntastic setting end
"===================================


"===================================
""    nerdtree setting start
"===================================
" open a NERDTree automatically
autocmd vimenter * NERDTree
" 设置光标默认不在NERDTree 的窗口中
wincmd w
autocmd VimEnter * wincmd w

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" map a specific key or shortcut to open NERDTree(Ctrl+a)
map <C-a> :NERDTreeToggle<CR>
" change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"===================================
""    nerdtree setting end
"===================================


"===================================
""   tagbar setting start
"===================================
" map a specific key or shortcut to open Tagbar(<F8>)
nmap <F8> :TagbarToggle<CR>
" Tagbar window will be opened on right-hand,we can set this option to open it on left instead
"let g:tagbar_left = 1
" Tagbar window will automatically close when you jump to a tag
"let g:tagbar_autoclose = 1
" If you set this option the cursor will move to the Tagbar window when it is opened
"let g:tagbar_autofocus = 1
" If you set this option the cursor will move to the Tagbar window when it is opened
let g:tagbar_autofocus = 0
"===================================
""   tagbar setting end
"===================================


"===================================
""   AutoComplPop setting start
"===================================
let g:acp_enableAtStartup = 1
"===================================
""   AutoComplPop setting end
"===================================
"vim-easy-align{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"}


"===================================
""   python-mode setting start
"===================================
"基本设置
let g:pymode = 1 " 开启该插件
let g:pymode_warnings = 1 " Turn off plugin's warnings
let g:pymode_trim_whitespaces = 1 " Trim unused white spaces on save
let g:pymode_options = 1 " Setup default python options
let g:pymode_options_max_line_length = 79 " Setup max line length(中间的红色分割线)
let g:pymode_options_colorcolumn = 1 " Enable colorcolumn display at max_line_length
let g:pymode_quickfix_minheight = 3 " etup pymode |quickfix| window
let g:pymode_quickfix_maxheight = 6 " etup pymode |quickfix| window
let g:pymode_folding = 1 " Enable pymode folding 折行
let g:pymode_run = 1 " Turn on the run code script 运行脚本
let g:pymode_run_bind = '<leader>r' " Binds keys to run python code 运行脚本的key
let g:pymode_breakpoint = 1 " Pymode automatically detects available debugger
let g:pymode_breakpoint_bind = '<leader>b' " Bind debugger keys

"check code Setup
let g:pymode_lint = 1 " 开启代码检测
let g:pymode_lint_on_write = 1 " Check code on every save (if file has been modified)
let g:pymode_lint_unmodified = 1 " Check code on every save (every)
let g:pymode_lint_on_fly = 0 " Check code when editing (on the fly)
let g:pymode_lint_message = 1 " Show error message if cursor placed at the error line
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe'] " Default code checkers (you could set several)

"===================================
""   python-mode setting end
"===================================
