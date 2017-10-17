"Vundle
"==================================
" Vundle.vim Configure Plugins [
"==================================
set nocompatible " be iMproved, required
filetype off     " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'          " airline
Plugin 'vim-airline/vim-airline-themes'   " alrline-themes
Plugin 'majutsushi/tagbar'                " tagbar
Plugin 'scrooloose/syntastic'             " 语法检测
Plugin 'scrooloose/nerdtree'              " 目录树
Plugin 'vim-scripts/AutoComplPop'         " 提示
Plugin 'junegunn/vim-easy-align'          " 按指定符号对齐
Plugin 'kien/ctrlp.vim'                   " 搜索
Plugin 'bronson/vim-trailing-whitespace'  " 删除空格
Plugin 'kshenoy/vim-signature'            " 标签
Plugin 'KabbAmine/zeavim.vim'             " zea离线文档
Plugin 'Yggdroot/indentLine'              " 对齐线
"Plugin 'Valloric/YouCompleteMe'
Plugin 'fugalh/desert.vim'                " colorscheme
Plugin 'tomasr/molokai'                   " colorscheme
Plugin 'altercation/vim-colors-solarized' " colorscheme
"Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'davidhalter/jedi-vim'

call vundle#end()            " required
filetype plugin indent on    " required
"==================================
" Vundle.vim Configure Plugins ]
"==================================


" vim-airline
"==================================
" vim-airline Configure Plugins [
"==================================
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1 " 0关闭 1启用
" color
set laststatus=2
set t_Co=256
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
"==================================
" vim-airline Configure Plugins ]
"==================================


" syntastic
"==================================
" syntastic Configure Plugins [
"==================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_ignore_files = ['php'] " 忽略的文件类型
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1 " 打开文件时检测
let g:syntastic_check_on_wq              = 1 " 保存时检测
let g:syntastic_error_symbol             = '✗'
let g:syntastic_warning_symbol           = '⚠'
"==================================
" syntastic Configure Plugins ]
"==================================


" tagbar
"==================================
" tagbar Configure Plugins [
"==================================
nmap <F8> :TagbarToggle<CR> " map a specific key or shortcut to open Tagbar(<F8>)
"let g:tagbar_left = 1 " Tagbar window will be opened on right-hand,we can set this option to open it on left instead
"let g:tagbar_autoclose = 1 " Tagbar window will automatically close when you jump to a tag
"let g:tagbar_autofocus = 1 " If you set this option the cursor will move to the Tagbar window when it is opened
let g:tagbar_autofocus = 0 " If you set this option the cursor will move to the Tagbar window when it is opened
"==================================
" tagbar Configure Plugins ]
"==================================


" nerdtree
"==================================
" nerdtree Configure Plugins [
"==================================
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
"==================================
" nerdtree Configure Plugins [
"==================================


" AutoComplPop
"==================================
" AutoComplPop Configure Plugins [
"==================================
let g:acp_enableAtStartup = 1 " 1开启 0关闭
"==================================
" AutoComplPop Configure Plugins ]
"==================================


" vim-easy-align
"==================================
" vim-easy-align Configure Plugins [
"==================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"==================================
" vim-easy-align Configure Plugins ]
"==================================


" ctrlp
"==================================
" ctrlp Configure Plugins [
"==================================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"==================================
" ctrlp Configure Plugins ]
"==================================


" vim-trailing-whitespace
"==================================
" vim-trailing-whitespace Configure Plugins [
"==================================
map <leader><space> :FixWhitespace<cr>
"==================================
" vim-trailing-whitespace Configure Plugins ]
"==================================


" indentLine
"==================================
" indentLine Configure Plugins [
"==================================
let g:indentLine_enabled = 1 " close indentLine with 0
"==================================
" indentLine Configure Plugins ]
"==================================


" signature
"==================================
" signature Configure Plugins [
"==================================
" mx           Toggle mark 'x' and display it in the leftmost column
" dmx          Remove mark 'x' where x is a-zA-Z
" m,           Place the next available mark
" m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
" m-           Delete all marks from the current line
" m<Space>     Delete all marks from the current buffer
" ]`           Jump to next mark
" [`           Jump to prev mark
" ]'           Jump to start of next line containing a mark
" ['           Jump to start of prev line containing a mark
" `]           Jump by alphabetical order to next mark
" `[           Jump by alphabetical order to prev mark
" ']           Jump by alphabetical order to start of next line having a mark
" '[           Jump by alphabetical order to start of prev line having a mark
" m/           Open location list and display marks from current buffer
" m[0-9]       Toggle the corresponding marker !@#$%^&*()
" m<S-[0-9]>   Remove all markers of the same type
" ]-           Jump to next line having a marker of the same type
" [-           Jump to prev line having a marker of the same type
" ]=           Jump to next line having a marker of any type
" [=           Jump to prev line having a marker of any type
" m?           Open location list and display markers from current buffer
" m<BS>        Remove all markers
"==================================
" signature Configure Plugins ]
"==================================

"==================================
" markdown-preview Configure Plugins [
"==================================
let g:mkdp_path_to_chrome = "google-chrome" " 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）
let g:mkdp_auto_start = 0 " 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开markdown 文件的时候打开一次
let g:mkdp_auto_open = 1 " 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预览窗口
let g:mkdp_auto_close = 1 " 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不自动关闭预览窗口
let g:mkdp_refresh_slow = 0 " 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时更新预览
let g:mkdp_command_for_global = 0 " 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown 文件可以使用改命令
" 键位设定
" 默认情况下，插件没有进行任何的按键绑定，如果想绑定按键去预览 markdown
" 文件，可以绑定
" 按键到<Plug>MarkdownPreview来打开预览窗口，绑定按键到<Plug>StopMarkdownPreview来
" 关闭预览窗口
nmap <silent> <F9> <Plug>MarkdownPreview        " 普通模式
imap <silent> <F9> <Plug>MarkdownPreview        " 插入模式
nmap <silent> <F10> <Plug>StopMarkdownPreview    " 普通模式
imap <silent> <F10> <Plug>StopMarkdownPreview    " 插入模式
"==================================
" markdown-preview Configure Plugins [
"==================================

"==================================
" 基本配置 [
"==================================
" 主题方案
"colorscheme desert
"colorscheme herald
"colorscheme thestars
"colorscheme murphy
"colorscheme vividchalk
"colorscheme BusyBee
colorscheme jellybeans
"colorscheme black_angus
"colorscheme molokai
"colorscheme solarized

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set encoding=utf-8
endif

set nocompatible " 不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题
"set foldmethod=indent "折行相关的配置
" 检测文件的类型
filetype on
filetype plugin on
filetype plugin indent on
set completeopt=longest,menu
syntax on
set noswf                " 去掉烦人的交换文件
set autoindent           " 自动缩进
set smartindent          " 智能对齐方式
set tabstop=4            " 一个tab是4个字符
set expandtab
set softtabstop=4        " 按一次tab前进4个字符
set cindent shiftwidth=4 " 缩进的字符个数
set autoindent shiftwidth=4
set number               " 显示行号
set ruler                " 打开光标的行列位置显示功能
set cursorline           " 行高亮
set hlsearch             " 高亮搜索的关键字
set ignorecase           " 搜索忽略大小写
set history=100          " 设置命令历史行数
set novisualbell         " 不要闪烁
" 显示TAB健
"set list
"set listchars=tab:>-,trail:-

set nocp     " 去掉有关vi一致性模式，避免以前版本的一些bug和局限
set wildmenu " 增强模式中的命令行自动完成操作
"highlight Comment ctermfg=yellow guifg=yellow " 修改注释的颜色

"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"set cursorline cursorcolumn

"() {} []自动不全 {
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
" }() {} []自动不全


function AddPHPFuncList()
    set dictionary-=~/.vim/php_funclist.txt dictionary+=~/.vim/php_funclist.txt
    set complete-=k complete+=k
endfunction

function AddPHPTag()
    call append(0, "<?php")
    call append(1, "?>")
endfunction


"file doc comment
map <F3> ms:call AddFileDocComment()<cr>'s
function AddFileDocComment()
    "call append(3," * Create date:".strftime("%Y-%m-%d %H:%M"))
    "call append(4," * Modified date:".strftime("%Y-%m-%d%H:%M"))
    call append(1,"/**")
    call append(2," * MyFile File Doc Comment")
    call append(3," *")
    call append(4," * PHP Version 5")
    call append(5," *")
    call append(6," * @category Class")
    call append(7," * @package  MyPackage")
    call append(8," * @author   zhaoyingnan <zhaoyingnan@lashou-inc.com>")
    call append(9," * @license  http://www.example.com/ x Licence")
    call append(10," * @link     http://www.example.com/")
    call append(11," */")
endfunction

"class doc comment
map <F4> ms:call AddClassDocComment()<cr>'s
function AddClassDocComment()
    call append(12,"")
    call append(13,"/**")
    call append(14," * MyFile File Doc Comment")
    call append(15," *")
    call append(16," * PHP Version 7")
    call append(17," *")
    call append(18," * @category Class")
    call append(19," * @package  MyPackage")
    call append(20," * @author   zhaoyingnan <zhaoyingnan@lashou-inc.com>")
    call append(21," * @license  http://www.example.com/ x Licence")
    call append(22," * @link     http://www.example.com/")
    call append(23," */")
endfunction

"function doc comment
map <F5> ms:call AddNotes()<cr>'s
function AddNotes()
    let line = line('.')+13
    call append(line(".")-1, "    /**")
    call append(line(".")-1, "     * My Function Doc Comment")
    call append(line(".")-1, "     *")
    call append(line(".")-1, "     * @access public")
    call append(line(".")-1, "     * @author zhaoyingnan ".strftime("%Y-%m-%d %H:%M"))
    call append(line(".")-1, "     *")
    call append(line(".")-1, "     * @param int    $iParam")
    call append(line(".")-1, "     * @param string $sParam")
    call append(line(".")-1, "     * @param array  $arParam")
    call append(line(".")-1, "     * @param bool   $bParam")
    call append(line(".")-1, "     * @param object $objParam")
    call append(line(".")-1, "     *")
    call append(line(".")-1, "     * @return mix")
    call append(line(".")-1, "     * @note")
    call append(line(".")-1, "     **/")
    "exec "normal ".line."gg"
    "normal gg=G
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
    "normal gg=G
endfunction

"PHP函数库
au FileType php call AddPHPFuncList()
"为PHP文件添加php标签
"au FileType php call AddPHPTag()
"为PHP文件自动添加 FILE DOC COMMENT
"au FileType php call AddFileDocComment()
"为PHP文件自动添加 CLASS DOC COMMENT
"au FileType php call AddClassDocComment()
"删除PHP文件的最后一行
"au FileType php exec "normal Gdd"


" YouCompleteMe
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_collect_identifiers_from_tag_files = 1


"=========================
" python配置start
"=========================
let g:jedi#auto_initialization = 1  " 自动加载
"=========================
" python配置end
"=========================

" tags 设置
nmap <leader>t <ESC>:!ctags -f ~/tags -R `pwd` --languages=php --langmap=php:+.php -h +.php --extra=+q --exclude=*.js --exclude=*.html --tag-relative<CR>
set tags=~/tags

" indentLines 的开启和关闭切换的快捷键
map <leader>i :IndentLinesToggle<cr>
