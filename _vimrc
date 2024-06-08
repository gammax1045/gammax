"开启语法高亮功能
syntax enable

"允许用指定语法高亮配色方案替换默认方案
syntax on

"解决汉字乱码
"set encoding=utf-8  
"set fileencodings=usc-bos,utf-8,cp936  
"set fileencoding=gb2312 
"set termencoding=utf-8     

"定义快捷键的前缀，即<Leader>
let mapleader=';'
inoremap jj <Esc>



"开启文件类型侦测
filetype on
"根据侦测到的不同类型加载对应的插件
filetype plugin on

"禁止光标闪烁
set gcr=a:block-blinkon0
"禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
"禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

"总是显示状态栏
set laststatus=2
"显示光标当前位置
set ruler
"开启行号显示
set number
"高亮显示当前行/列
set cursorline
set cursorcolumn
"高亮显示搜索结果
set hlsearch

"定义快捷键到行首和行尾
nmap lb 0
nmap le $
"设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
"设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p
"定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
"定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
"定义快捷键保存所有窗口内容并退出vim
nmap <Leader>WQ :wa<CR>:q<CR>
"不做任何保存，直接退出vim
nmap <Leader>Q :qa!<CR>
"依次遍历子窗口
nnoremap nw <C-W><C-W>
"跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
"跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
"跳转至上方的窗口
nnoremap <Leader>kw <C-W>k
"跳转至下方的窗口
nnoremap <Leader>jw <C-W>j
"定义快捷键在结对符之间跳转
"nmap <Leader>M %
"让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"开启实时搜索功能
set incsearch
"搜索时大小写不敏感
set ignorecase
"关闭兼容模式
set nocompatible
"vim自身命令行模式智能补全
set wildmenu

call plug#begin('$vim\plugged')
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'

"美化状态栏插件
 Plug 'Lokaltog/vim-powerline'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"输入法自动切换
Plug 'lyokha/vim-xkbswitch' 
"美化配色
"Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'
"程序缩进线
Plug 'yggdroot/indentline'


"python环境
Plug 'https://kkgithub.com/python-mode/python-mode',{'for':'python','branch':'develop'}

"latex配置
Plug 'lervag/vimtex'  

"latex片断
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'  

"寻找文件
Plug 'ctrlpvim/ctrlp.vim'

"在文件内任意移动
Plug 'easymotion/vim-easymotion'

" 屏幕最大化
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'
let g:shell_fullscreen_always_on_top = 0
 if has("gui_running")
 	set lines=999 columns=999
 else
 	if exists("+lines")
 		set lines=35
 	endif
 	if exists("+columns")
 		set columns=86
 	endif
 endif

" 注释插件
Plug 'tpope/vim-commentary'
" 显示buffer
Plug 'fholgado/minibufexpl.vim'
map bp :MBEbp<CR>
map bn :MBEbn<CR>
map bd :MBEbd
map <f10> :MBEToggle<CR>

call plug#end()

"输入法自动切换
let g:XkbSwitchEnabled = 1 

"配色方案
set background=dark
colorscheme solarized

"python环境
set pythonthreedll=python38.dll
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_indent = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_lint = 0 
let g:pymode_lint_checkers = ['pyflakes','pep8','mccabe','pylint']
let g:pymode_options_max_line_length = 120

"latex配置
let g:tex_flaver='latex'  
let g:vimtex_texcount_custom_arg='-ch -total'     
 "映射VimtexCountWords! 使\lw命令可统计中英文字符的个数  
au FileType tex map <buffer> <silent> <leader>lw :VimtexCountWords! <CR><CR>  
 
"这里是LaTex编译引擎的设置
 let g:vimtex_compiler_latexmk_engines = {    
                         \'_'                  : '-xelatex',    
                         \'pdflatex'           : '-pdf',          
                         \'dvipdfex'           : '-pdfdvi',  
                         \'lualatex'           : '-lualatex',    
                         \'xelatex'            : '-xelatex',   
                         \'context (pdftex)'   : '-pdf -pdflatex=texexec',  
                         \'context (luatex)'   : '-pdf -pdflatex=context',  
                         \'context (xetex)'    : '-pdf -pdflatex=''texexec --xtx''', 
                         \}
"这里是设置latexmk工具的可选参数
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-shell-escape',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
"let g:vimtex_latexmk_option='pdf -pdflatex="xelatex -synctex=1 \%S \%O" -verbose -file-line-error -interaction=nonstopmode'            
"不晓得什么原因，有时候SumartraPDF不能反向查找，就加了下一句，不知什么意思，之前没有
let g:Tex_ViewRule_pdf = 'SumatraPDF.exe -reuse-instance -inverse-search "gvim -c \":RemoteOpen +\%l \%f\""'
"阅读器配置 包含正反查找功能    
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
          \ = '-reuse-instance -forward-search @tex @line @pdf'
          \ . ' -inverse-search "' . exepath(v:progpath)
          \ . ' --servername ' . v:servername
          \ . ' --remote-send \"^<C-\^>^<C-n^>'
          \ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
          \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
          \ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

"编译过程中忽略警告信息
let g:vimtex_quickfix_open_on_warning=0

"latex片断
 let g:UltiSnipsExpandTrigger="<tab>"   
 let g:UltiSnipsJumpForwardTrigger="<c-b>"   
 let g:UltiSnipsJumpBackwardTrigger="<c-z>"      
                                                   
" If you want :UltiSnipsEdit to split your window.     
 let g:UltiSnipsEditSplit="vertical" 

"使用NERDTree插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
nmap <Leader>fb :NERDTreeFind<CR>
"设置NERDTree子窗口宽度
let NERDTreeWinSize=32
"设置NERDTree子窗口位置
let NERDTreeWinPos="right"
"显示隐藏文件
let NERDTreeShowHidden=1
"NERDTree子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
"删除文件时自动删除文件对应buffer
let NERDTreeAutoDeleteBuffer=1

"美化状态栏：设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

"设置ctrlp插件
let g:ctrlp_map='<c-p>'
"设置easymotion
 nmap ss <Plug>(easymotion-s2)

"autocmd GUIEnter * simalt ~x
