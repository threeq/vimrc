
set nocompatible              " required
filetype off                  " required

" vim-plug 插件管理
call plug#begin('~/.vim/plugged')
    " looking
        Plug 'Yggdroot/indentLine'
        Plug 'myusuf3/numbers.vim'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'airblade/vim-gitgutter'
        Plug 'tpope/vim-fugitive'
        Plug 'mhinz/vim-signify'
        Plug 'morhetz/gruvbox'
        Plug 'altercation/vim-colors-solarized'
    " utils
        Plug 'asins/vimcdoc'
        Plug 'Mark--Karkat'
        Plug 'repeat.vim'
        Plug 'ccvext.vim'
    " navigation
        Plug 'scrooloose/nerdtree'
        Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'ctrlpvim/ctrlp.vim'
        Plug 'wesleyche/SrcExpl'
        Plug 'majutsushi/tagbar'
        Plug 'taglist.vim'
        Plug 'rizzatti/dash.vim'
    " basic editor
        Plug 'airblade/vim-rooter'
        Plug 'kshenoy/vim-signature' " 书签显示
        Plug 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
        Plug 'vim-scripts/VisIncr'
        Plug 'terryma/vim-multiple-cursors'
        Plug 'terryma/vim-expand-region'
        Plug 'junegunn/vim-easy-align'
    " 语法检测
        "Plug 'w0rp/ale'
        Plug 'scrooloose/syntastic'
    " c/c++
        Plug 'c.vim'
    " java
        Plug 'artur-shaik/vim-javacomplete2'
    " html/css/javascript
        Plug 'mattn/emmet-vim'
    " go
        Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
        Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
    " markdown
        Plug 'godlygeek/tabular'
        Plug 'plasticboy/vim-markdown'
        Plug 'elzr/vim-json'
    " completion/snippets
        Plug 'ervandew/supertab'
        Plug 'jiangmiao/auto-pairs' "自动括号匹配
        Plug 'scrooloose/nerdcommenter'
        Plug 'tpope/vim-surround'
        Plug 'Valloric/YouCompleteMe', {'do': '~/.vim/plugged/YouCompleteMe/install.py --clang-completer --gocode-completer --tern-completer'}
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
    " python
        Plug 'vim-scripts/indentpython.vim'
        Plug 'klen/python-mode'
        Plug 'davidhalter/jedi-vim', { 'do': 'pip install jedi' }
    " plantuml
        Plug 'scrooloose/vim-slumlord'
        Plug 'aklt/plantuml-syntax'
call plug#end()

set cmdheight=1

" 基本配置{    
    " 文件编码
    set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
    set termencoding=utf-8
    set encoding=utf-8
    set fileformat=unix
    set fileformats=unix,dos,mac
    
    filetype plugin indent on
    
    syn on "语法支持
    set laststatus=2 "始终显示状态栏

    " 代码缩进
    set tabstop=4 "一个制表符的长度
    set softtabstop=4 "一个制表符的长度（可以大于tabstop）
    set shiftwidth=4 "一个缩进的长度
    set expandtab "使用空格替代制表符
    set smarttab "智能制表符
    set autoindent "自动缩进
    set smartindent "只能缩进
    " 代码折叠
    " set foldenable
    set nofoldenable
    set foldmethod=indent "代码折叠
    set ignorecase        "ignore the case when search texts
    set smartcase         "if searching text contains uppercase case will not be ignored
    
    set number "显示行号
    set ruler "显示位置指示器
    set cursorline       "hilight the line that the cursor exists in
    set cursorcolumn     "hilight the column that the cursor exists in
    set backupdir=/tmp "设置备份文件目录
    set directory=/tmp "设置临时文件目录
    set hls "检索时高亮显示匹配项
    set helplang=cn "帮助系统设置为中文
    set nowrap "关闭自动折行
    set synmaxcol=256
    " 配色
    colorscheme gruvbox  "use the theme gruvbox
    set background=dark "light "use the light version of gruvbox
    " change the color of chars over the width of 80 into blue (uncomment to enable this)
    "au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    
    set backspace=indent,eol,start
    " 让配置变更立即生效
    " autocmd BufWritePost $MYVIMRC source $MYVIMRC
    " 实时搜索
    set incsearch
    set hlsearch


    "set autoread "文件在Vim之外修改过，自动重新读入"
    "set autowrite "设置自动保存内容"
    let autosave=5
    "set autochdir 
    ""当前目录随着被编辑文件的改变而改变"
    "通过9跳转到行末尾,0默认跳转到行首"
    map 9 $ 
    "Ctrl-A 选中所有内容"
    map <silent>  <C-A>  gg v G 
" }

" 快捷键设置（Shortcuts）{
    set hidden
    let mapleader = "\<Space>"
    nnoremap <Leader>o :CtrlP<CR>
    nnoremap <Leader>w :w<CR>
    nmap <Leader><Leader> i

    vmap <Leader>y "+y
    vmap <Leader>d "+d
    nmap <Leader>p "+p
    nmap <Leader>P "+P
    vmap <Leader>p "+p
    vmap <Leader>P "+P
    "mac clipboard{
    "   set clipboard=unnamed
        vmap <Leader>y :w !pbcopy<CR><CR>
        nmap <Leader>y :.w !pbcopy<CR><CR>
        vmap <Leader>p :r !pbpaste<CR><CR>
        nmap <Leader>p :r !pbpaste<CR><CR>
    "}

    nnoremap <silent> <Left> :bp<CR>
    nnoremap <silent> <Right> :bn<CR>
    nnoremap <Leader>f :bp<CR>
    nnoremap <Leader>b :bn<CR>

    " 查看buffers
    nnoremap <Leader>l :ls<CR>

    " 区域扩展
    vmap v <Plug>(expand_region_expand)
    vmap <C-v> <Plug>(expand_region_shrink)

    " <space> => fold/unfold current text tips: zR => unfold all; zM => fold all
    nnoremap <Leader><space> @=('za')<CR>

    " use t{h,j,k,l} to switch between different windows
    nnoremap <Leader>k <c-w>k
    nnoremap <Leader>j <c-w>j
    nnoremap <Leader>h <c-w>h
    nnoremap <Leader>l <c-w>l
    nnoremap <Leader>w <c-w>w

    " vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    "    :<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
    "omap s :normal vs<CR>
    "============="
    ""9. 查找和替换文本"
    "============="
    nmap ;s :%s/\<<C-R>=expand("<cword>")<CR>\>/
    nmap ;g :vimgrep <C-R>=expand("<cword>")<CR>

    "文件和目录{
        let g:rooter_disable_map = 1
        " <f4> => popup the file tree navigation)
        nmap <F4> :NERDTreeToggle<CR>
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

        " <f8> => toggle the srcExpl (for source code exploring)
        nmap <F8> :SrcExplToggle<CR>
        let g:SrcExpl_pluginList = [ 
                \ "__Tag_List__", 
                \ "_NERD_tree_" 
        \ ] 

        " tb => open the tagbar
        nmap tb :TlistClose<CR>:TagbarToggle<CR>
        " ti => taglist
        nmap ti :TagbarClose<CR>:Tlist<CR>
    "}
"}

" 插件配置

" 书签插件 vim-signature {
"
" }

"autocomplete,snippet {
    let g:SuperTabContextDefaultCompletionType = '<c-n>'
    let g:SuperTabDefaultCompletionType = '<C-n>'
"    let g:superTabDefaultCompletionType = '<C-x><C-o>'
    
    "Note: this option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable autoComplPop.
    let g:acp_enableAtStartup = 0

    " Enable omni completion.
    "autocmd filetype css setlocal omnifunc=csscomplete#CompleteCSS
    "autocmd filetype html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    "autocmd filetype javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    "autocmd filetype python setlocal omnifunc=pythoncomplete#Complete " jedi#completions
    "autocmd filetype xml setlocal omnifunc=xmlcomplete#CompleteTags
    "autocmd filetype go setlocal omnifunc=

    let g:ycm_use_ultisnips_completer = 1
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_complete_in_comments = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 0
    let g:ycm_cache_omnifunc = 0
    let g:ycm_complete_in_strings = 1
    let g:ycm_add_preview_to_completeopt = 1
    let g:ycm_disable_for_files_larger_than_kb = 50000
    let g:ycm_seed_identifiers_with_syntax=1
    let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

    autocmd InsertLeave * if pumvisible() == 0|pclose|endif

    nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

    inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '<CR>'
    inoremap <expr> <Down>     pumvisible() ? '\<C-n>' : '\<Down>'
    inoremap <expr> <Up>       pumvisible() ? '\<C-p>' : '\<Up>'
    inoremap <expr> <PageDown> pumvisible() ? '\<PageDown>\<C-p>\<C-n>' : '\<PageDown>'
    inoremap <expr> <PageUp>   pumvisible() ? '\<PageUp>\<C-p>\<C-n>' : '\<PageUp>'

    let g:UltiSnipsExpandTrigger = "<c-k>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

    " 比较喜欢用tab来选择补全...
    function! MyTabFunction ()
        let line = getline('.')
        let substr = strpart(line, -1, col('.')+1)
        let substr = matchstr(substr, "[^ \t]*$")
        if strlen(substr) == 0
            return "\<tab>"
        endif
        return pumvisible() ? "\<c-n>" : "\<tab>"
    endfunction
    inoremap <tab> <c-r>=MyTabFunction()<cr>

"}

"tagbar{
    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }
"}

"对齐线 Identline{
    let g:indentLine_color_term = 239
"}
"快速对齐 Easyalign{
    xmap ga <plug>(EasyAlign)
    nmap ga <plug>(EasyAlign)
"}
"airline{
    set t_co=256
    let g:gitgutter_realtime = 1
    let g:gitgutter_eager = 1
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_powerline_fonts = 1
    let g:airline_skip_empty_sections = 1
    let g:airline#extensions#branch#enabled=1
    let g:airline#extensions#tmuxline#enabled = 1
    let g:Powerline_sybols = 'unicode'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    " unicode symbols
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.notexists = '∄'
    let g:airline_symbols.whitespace = 'Ξ'

    let g:airline#extensions#tabline#show_tab_nr = 1
    let g:airline#extensions#tabline#tab_nr_type= 2
    let g:airline#extensions#tabline#show_tab_type = 1
    let g:airline#extensions#tabline#buffers_label = 'BUFFERS'
    let g:airline#extensions#tabline#tabs_label = 'TABS'
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#fnamecollapse = 1
    let g:airline#extensions#tabline#fnametruncate = 0
"}

"w0rp/ale {
"    let &runtimepath.=',~/.vim/plugged/ale'
"    let g:ale_sign_column_always = 1
"    let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
"    let g:ale_sign_error = '>>'
"    let g:ale_sign_warning = '--'
" }

"syntastic{
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
"}

"tabular{
    "let g:tabular_loaded = 1
"}

"markdown{
    function s:EnableMarkdown()
        let g:vim_markdown_no_default_key_mappings=1
        let g:vim_markdown_math=1
        let g:vim_markdown_frontmatter=1
        let g:vim_markdown_json_frontmatter = 1
        map asdf <Plug>Markdown_MoveToParentHeader
    endfunction
    autocmd filetype markdown,md call s:EnableMarkdown()
"}
"git{
    map <silent> <leader>1 :diffget 1<CR> :diffupdate<CR>
    map <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
    map <silent> <leader>3 :diffget 3<CR> :diffupdate<CR>
    map <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>
"}
"python{
    "autopep8设置"
    let g:autopep8_disable_show_diff=1
    let g:pymode_rope = 0
    let g:pymode_rope_lookup_project = 0
    " Documentation
    let g:pymode_doc = 1
    let g:pymode_doc_key = 'K'
    
    " Linting
    let g:pymode_lint = 1
    let g:pymode_lint_checker = "pyflakes,pep8"
    
    " Auto check on save
    let g:pymode_lint_write = 1
    
    " Support virtualenv
    let g:pymode_virtualenv = 1
    
    " Enable breakpoints plugin
    let g:pymode_breakpoint = 1
    let g:pymode_breakpoint_bind = '<leader>b'
    
    " syntax highlighting
    let g:pymode_syntax = 1
    let g:pymode_syntax_all = 1
    let g:pymode_syntax_indent_errors = g:pymode_syntax_all
    let g:pymode_syntax_space_errors = g:pymode_syntax_all
    
    " Don't autofold code
    let g:pymode_folding = 0
    
    
    "let g:pymode_python = 'python'
"}
"java{
    function s:EnableJava()
        nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
        imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
    endfunction
    autocmd Filetype java,jsp set omnifunc=javacomplete#Complete
    "autocmd Filetype java,jsp set completefunc=javacomplete#CompleteParamsInf
    "autocmd Filetype java,jsp inoremap &lt;buffer> . .&lt;C-X>&lt;C-O>&lt;C-P>&lt;DOWN>
    autocmd FileType java call s:EnableJava()
"}
"go{
    function s:EnableGo()
        "let g:go_snippet_engine = "neosnippet"
        " disable the neosnippet preview candidate window
        " when enabled, there can be too much visual noise
        "  especially when splits are used.
        set completeopt-=preview
        let g:go_fmt_command = "goimports"
        let g:go_highlight_functions = 1  
        let g:go_highlight_methods = 1  
        let g:go_highlight_structs = 1
        let g:go_highlight_operators = 1
        let g:go_highlight_build_constraints = 1
    endfunction
    "autocmd filetype go set omnifunc=go#complete#complete
    "autocmd filetype go set completefunc=go#complete#complete
    "autocmd filetype go inoremap &lt;buffer> . .&lt;c-x>&lt;c-o>&lt;c-p>&lt;down>
    autocmd filetype go call s:EnableGo()
"}
