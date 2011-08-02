"如果需要引入其它配置文件可以用命令
"source filepath
"显示行号
"Set mapleader
let mapleader = ","
nmap <leader>uuc :call UpdateCFG()<CR>
nmap <leader>ee :call EditCFG()<CR>

set nu
"取消显示行号
"set nonu
filetype plugin indent on
set completeopt=longest,menu

"文件编码识别
set fileencodings=utf-8,gbk,ucs-bom,cp936

"小括号、大括号、中括号、单双引号等自动补齐
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""折叠相关配置"""""""
"手工定义折叠
"set fdm=manual 
"根据缩进折叠
set fdm=indent
"用表达式来定义折叠
"set fdm=expr
"用语法高亮来定义折叠
"set fdm=syntax
"对没有更改的文本进行折叠
"set fdm=diff
"对文中的标志折叠
"set fdm=indent
"""""折叠相关命令"""""""
"zo将光标所在处折叠Open
"zc                Close
"zi open&close 相互转化
"zn 打开全文折叠
"zN close全文折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"配色方案
"colorscheme shine
"colorscheme af
colorscheme evening 
"colorscheme gemcolors 
"colorscheme night 
"colorscheme twilight 
"colorscheme railscasts 

"语法开启
syntax on

"Tab设置为4个字符
set tabstop=4   "设置tabs显示为4个空格的宽度(默认为8个)
set softtabstop=4 
set expandtab   " Turn Tab keypresses into spaces. Sounds like this is happening to you.
                         "    You can still insert real Tabs as [Ctrl]-V [Tab].
"set noexpandtab      " Leave Tab keys as real tabs (ASCII 9 character).
set shiftwidth=4     " When auto-indenting, indent by this much.
                         "   (Use spaces/tabs per 'expandtab'.)

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d :",
        \ &tabstop, &shiftwidth, &textwidth)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>


"状态栏显示设置
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [%l,%v][%p%%]\ [LEN=%L]

"命令栏高度设置
set cmdheight=1 "aslo can use ch
"GUI设置
"隐藏底部滚动条
set guioptions-=b
"隐藏右边滚动条
set guioptions-=R
set guioptions-=r
"隐藏左边滚动条
set guioptions-=l
set guioptions-=L
"隐藏菜单栏
set guioptions-=m
"隐藏工具栏
set guioptions-=T

"session open,save
"session open,save
imap <F6> <esc>:SessionOpen<space>
nmap <F6> :SessionOpen<space>
"for gui
map <C-s> :SessionSave<CR>
"for cli
map <C-F6> :SessionSave<CR>

nmap <leader>ss :w<CR>
nmap <leader>qq :wq<CR>

"系统粘贴复制
nmap  <leader>pp "+p 
nmap  <leader>pm "*p 
nmap  <leader>pn "-p 
vnoremap <leader>yy "+y 
nmap <leader>ggy ggVG
nmap <leader>gy VG


"跳转代码行
imap <silent> <C-a> <esc>/^\s*\w<CR>zt
nmap <silent> <C-a> /^\s*\w<CR>zt

" NERDTree插件的快捷键
imap <silent> <F7> <esc>:NERDTreeToggle<CR>
nmap <silent> <F7> :NERDTreeToggle<CR>
" BufExplorer 快捷键 {{{
imap <silent> <F8> <esc>:BufExplorer<CR>
nmap <silent> <F8> :BufExplorer<CR>
" }}}

"tag-list插件窗口显示开关
imap <silent> <F12> <esc>:TlistToggle<CR>
nmap <silent> <F12> :TlistToggle<CR>
"tag更新快捷键
imap <silent> <C-F12> <esc>:TlistClose<CR>:TlistUpdate<CR>:TlistOpen<CR>
nmap <silent> <C-F12> :TlistClose<CR>:TlistUpdate<CR>:TlistOpen<CR>


"删除空行，删除行尾空字符
nmap <leader>dl :g/^\s*$/d<CR>
nmap <leader>ds :1,$s/\s*$//g<CR>

"""""""""""""""""""""""""
"函数补齐
"Remap the tab key to select action with InsertTabWrapper
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>

""php语法检查
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Check PHP Syntax using makeprg
"""""""""""""""""""""""""""""""""""""""""""""""""""""
 
function! PhpCheckSyntax()
    " Check php syntax
    setlocal makeprg=\"/usr/local/php5/bin/php\"\ -l\ -n\ -d\ html_errors=off
 
    " Set shellpipe
    setlocal shellpipe=>
 
    " Use error format for parsing PHP error output
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    make %
endfunction

" Perform :PhpCheckSyntax()
map <F5> :call PhpCheckSyntax()<CR>
imap <F5> <ESC>:call PhpCheckSyntax()<CR>
autocmd BufWritePost *.php,*.phps :call PhpCheckSyntax()

"退出
nmap <c-q> <F7>:qa<cr>


"行号显示 快捷键
map <F4> :se invnu<CR> 
"定义切换插入模式粘贴切换快捷键
set pastetoggle=<C-F9>
set mouse=a

"Quickfix窗口显示 
nmap <F2> :cw<CR>
nmap <C-;> :ccl<CR>

"函数原型跳转
nmap <F3> :tselect<cr>


"窗口切换快捷键设置
map <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-l> <C-W>l<C-W>_
map <C-i> <C-W>h<C-W>_

"au VimLeave * ksession! ~/myvim/session/%:t.session
"au VimLeave * wviminfo! ~/myvim/session/%:t.viminfo

"真的很smart, 搜索时全小写相当于不区分大小写，只要有一个大写字母出现，则区分大小写
"simple idea, great achievement!
set ignorecase smartcase


autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascrīpt set omnifunc=javascrīptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""函数部分

"自动闭合括号函数 
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

"Tab缩进与补齐函数 
"Auto completion using the TAB key
"This function determines, wether we are on
"the start of the line text(then tab indents)
"or if we want to try auto completion
function! InsertTabWrapper()
    let col=col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<TAB>"
    else
"此处运用了assistant的提示 功能
        return "\<C-x>\<C-u>"
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""应用部分
""在函数中移动光标
"""""[[		转到上一个位于第一列的{
"""""]]		转到下一个位于第一列的{
"""""gd		转到光标所指局部变量的定义
"""""*		转到当前光标所在单词下一次出现的地方
"""""#		转到当前光标所在单词上一次出现的地方
"""""%		转到当前括号(类型依具体情况)闭合处


""tags应用
""""C-]		跳转当前标签定义处
""""C-T		返回跳转的地方
""""tselect	显示匹配的列表
""""tfirst      到第一个匹配
""""tlast       到最后一个匹配
""""tnext       到下一个匹配


""搜索应用
""""建议搜索前sp命令,产生一个新窗口.避免进入查找到的文件后,查不到原文件
"""":vimgrep /spaceDiy/ static/js/**	在static/js目录下递归查找pattern指定的内容
":cw		显示查询到的Quickfix列表	
":set list  显示特殊字符
"zz: 将当前行置于屏幕中间
"zt: 将当前行置于屏幕顶端
"zb：底端啦~
"还有一条就是移动光标所在行的位置，就是说，比如我光标在第10行，我想光标不动，但是所在行向上移，ctrl-e啦，然后向下的话，ctrl-y~

"	ci'、ci"、ci(、ci[、ci{、ci< - 分别更改这些配对标点符号中的文本内容
"	di'、di"、di(或dib、di[、di{或diB、di< - 分别删除这些配对标点符号中的文本内容
"	yi'、yi"、yi(、yi[、yi{、yi< - 分别复制这些配对标点符号中的文本内容
"	vi'、vi"、vi(、vi[、vi{、vi< - 分别选中这些配对标点符号中的文本内容
"	另外如果把上面的i改成a可以连配对标点一起操作。
"
"shell命令
" cat -vT desktop/a.php   shell命令查看文本文件不可打印字符、Tab等
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"for windows gvim73 utf8乱码
"windows 去除注释即可
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set encoding=utf-8
"set fileencodings=utf-8,chinese,latin-1
"if has("win32")
    "set fileencoding=chinese
"else
    "set fileencoding=utf-8
"endif
""解决菜单乱码
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
""解决consle输出乱码

"language messages zh_CN.utf-8
"for windows gvim73 utf8乱码 END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

