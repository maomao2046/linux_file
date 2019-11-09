" vim 基本设置
set nocompatible " 插件需要设置
filetype off " 插件需要
set number " 打开行号设置
set encoding=utf-8
set ruler " 光标信息
set hlsearch " 高亮显示搜索
set incsearch " 边搜索边高亮

set ts=4 " tab 占4个字符宽度 
set autoindent " 复制上一行的缩进
" set expandtab tab为4个空格

syntax enable " 语法高亮
syntax on

set t_Co=256
set background=dark

"光标行列高亮
set cuc
set cul

" 插件配置
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'

Bundle 'scrooloose/nerdcommenter'
Bundle 'airblade/vim-gitgutter'

Bundle 'Valloric/YouCompleteMe'
Bundle 'editorconfig/editorconfig-vim'

call vundle#end()
filetype plugin indent on

" nerdtree 文件列表插件配置
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 自动打开 nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" 使用 vim 而不是 vim .
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 打开任意文件启动 nerdtree 我不需要
" autocmd vimenter * NERDTree

" ctrlp.vim 文件搜索插件配置
" 快捷键配置
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" 设置工作目录读取方式
let g:ctrlp_working_path_mode = 'ra'
" 忽略搜索文件
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {  
						\ 'dir':  '\v[\/](\.git|\.hg|\.svn|target|node_modules)$',  
						\ 'file': '\v\.(exe|so|dll|class)$',  
						\ 'link': 'some_bad_symbolic_links',  
						\ }


" ctags c语言支持配置
set tags=tags; " ; 不可省略，表示诺当前目录不存在tags，则在父目录寻找。
" map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-F12> :!ctags -R * <CR><CR>

" vim-airline 配置
" 启用显示缓冲区
let g:airline#extensions#tabline#enabled = 1

" nerdocmmenter 注释插件配置
let g:NERDSpaceDelims = 1 " 默认情况下，在注释分割符后添加空格
let g:NERDCompactSexyComs = 1 " 使用紧凑语法进行美化的多行s注释
let g:NERDDefaultAlign = 'left' " 让对齐向注释分割符向左而不是跟随代码缩进
let g:NERDAltDelims_java = 1 " 默认情况，将语言设置为使用其备用分割符
let g:NERDCustomDelimiters = { 'c': { 'left': '/**', 'right': '*/'}} " 添加自定义格式
let g:NERDCommentEmptyLines = 1 " 允许注释和反转空行(在注释区域时很有用)
let g:NERDTrimTrailingWhitespace = 1 " 在取消s注释时启用尾部空格的修剪
let g:NERDToggleCheckAllLines = 1 " 启用检查是否以注释

" YouCompleteMe 插件配置
"let g:ycm_min_num_of_chars_for_completion = 1 " 在输入第一个字符触发代码补全(可选配置)
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
"let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
let g:ycm_confirm_extra_conf=0

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
						\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
						\ 'cs,lua,javascript': ['re!\w{2}'],
						\ }
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'



"latex插件
Plugin 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" tags 插件
Plugin 'ludovicchabant/vim-gutentags'

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
		silent! call mkdir(s:vim_tags, 'p')
endif
"ale插件
Plugin 'dense-analysis/ale'
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
"let g:ale_linters = {
						"\   'c++': ['clang'],
						"\   'c': ['clang'],
						"\   'python': ['flake8', 'mypy','pylint'],
"\}
let g:ale_linters = {'c': ['clang'], 'c++': ['clang'], 'python': ['flake8', 'mypy', 'pylint']} 
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
""打开文件时不进行检查
let g:ale_lint_on_enter = 0





"始终开启标志列
le_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>编译运行
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-J> <Plug>(ale_next_wrap)

Plugin 'skywind3000/asyncrun.vim'

" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>



""Syntastic
"filetype off 
" Vundle Config Manager 
"set rtp+=~/.vim/bundle/Vundle.vim 
""call vundle#begin("~/.vim/bundle") 
Plugin 'scrooloose/syntastic' 
""call vundle#end() 
filetype on 
filetype plugin on 
filetype plugin indent on





"配色方案 /usr/share/vim/vim74/colors
"colorscheme solarized
"set background=dark
"colorscheme flattened_dark
colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1

Plugin 'altercation/vim-colors-solarized'
" julia 高亮
Plugin 'JuliaEditorSupport/julia-vim'
autocmd BufRead,BufNewFile *.jl :set filetype=julia

" colorscheme solarized
