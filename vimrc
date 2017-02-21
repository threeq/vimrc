
set nocompatible              " required
filetype off                  " required

" vim-plug 插件管理
call plug#begin('~/.vim/plugged')

" looking
    Plug 'Yggdroot/indentLine'
    Plug 'scrooloose/syntastic'
    Plug 'myusuf3/numbers.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
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

" completion/coding
    Plug 'ervandew/supertab'
    Plug 'jiangmiao/auto-pairs' "自动括号匹配
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'junegunn/vim-easy-align'
" snippets
    Plug 'honza/vim-snippets'
    Plug 'Shougo/neocomplete'
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
	Plug 'Shougo/echodoc.vim'
" python
	Plug 'vim-scripts/indentpython.vim'
" Initialize plugin system
call plug#end()

set cmdheight=2

" 基本配置
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileformat=unix
set fileformats=unix,dos,mac

filetype plugin indent on

syn on "语法支持
set laststatus=2 "始终显示状态栏
set tabstop=4 "一个制表符的长度
set softtabstop=4 "一个制表符的长度（可以大于tabstop）
set shiftwidth=4 "一个缩进的长度
set expandtab "使用空格替代制表符
set smarttab "智能制表符
set autoindent "自动缩进
set smartindent "只能缩进

set foldenable
set foldmethod=indent "folding by indent
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
set foldmethod=syntax "代码折叠
set nowrap "关闭自动折行
set synmaxcol=256
" 配色
colorscheme gruvbox  "use the theme gruvbox
set background=dark "light "use the light version of gruvbox
" change the color of chars over the width of 80 into blue (uncomment to enable this)
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set backspace=indent,eol,start

" 快捷键设置（Shortcuts）
	noremap <silent> <Left> :bp<CR>
	noremap <silent> <Right> :bn<CR>

	let mapleader = ","

	" <space> => fold/unfold current text tips: zR => unfold all; zM => fold all
	nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

	" use t{h,j,k,l} to switch between different windows
	noremap tk <c-w>k
	noremap tj <c-w>j
	noremap th <c-w>h
	noremap tl <c-w>l

	"mac clipboard{
		set clipboard=unnamed
	"}

	"文件和目录{
		" <F4> => popup the file tree navigation)
		nmap <F4> :NERDTreeToggle<CR>
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

		" <F8> => toggle the srcExpl (for source code exploring)
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

"autocomplete,snippet{

    let g:SuperTabDefaultCompletionType = '<C-x><C-o>'

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
 " Disable AutoComplPop.
 let g:acp_enableAtStartup = 0
 " Use neocomplete.
 let g:neocomplete#enable_at_startup = 1
 " Use smartcase.
 let g:neocomplete#enable_smart_case = 1
 " Set minimum syntax keyword length.
 let g:neocomplete#sources#syntax#min_keyword_length = 3
 let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

 " Define dictionary.
 let g:neocomplete#sources#dictionary#dictionaries = {
     \ 'default' : '',
     \ 'vimshell' : $HOME.'/.vimshell_hist',
     \ 'scheme' : $HOME.'/.gosh_completions'
         \ }

 " Define keyword.
 if !exists('g:neocomplete#keyword_patterns')
     let g:neocomplete#keyword_patterns = {}
 endif
 let g:neocomplete#keyword_patterns['default'] = '\h\w*'

 " Plugin key-mappings.
 inoremap <expr><C-g>     neocomplete#undo_completion()
 inoremap <expr><C-l>     neocomplete#complete_common_string()

 " Recommended key-mappings.
 " <CR>: close popup and save indent.
 inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
 function! s:my_cr_function()
   "return neocomplete#close_popup() . "\<CR>"
   " For no inserting <CR> key.
   return pumvisible() ? neocomplete#close_popup() : "\<CR>"
 endfunction
 " <TAB>: completion.
 inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
 " <C-h>, <BS>: close popup and delete backword char.
 inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
 inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
 inoremap <expr><C-y>  neocomplete#close_popup()
 inoremap <expr><C-e>  neocomplete#cancel_popup()
 " Close popup by <Space>.
 "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

 " For cursor moving in insert mode(Not recommended)
 "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
 "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
 "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
 "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
 " Or set this.
 "let g:neocomplete#enable_cursor_hold_i = 1
 " Or set this.
 "let g:neocomplete#enable_insert_char_pre = 1

 " AutoComplPop like behavior.
 "let g:neocomplete#enable_auto_select = 1

 " Shell like behavior(not recommended).
 "set completeopt+=longest
 "let g:neocomplete#enable_auto_select = 1
 "let g:neocomplete#disable_auto_complete = 1
 inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

 " Enable omni completion.
 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
 autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
 autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

 " Enable heavy omni completion.
 if !exists('g:neocomplete#sources#omni#input_patterns')
   let g:neocomplete#sources#omni#input_patterns = {}
 endif
 let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
 "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
 "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

 " For perlomni.vim setting.
 " https://github.com/c9s/perlomni.vim
 let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.go = '\h\w*\.\?'

" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'
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

"IdentLine{
    let g:indentLine_color_term = 239
"}
"EasyAlign{
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
"}
"airline{

    set nocompatible
    set t_Co=256

    let g:gitgutter_realtime = 1
    let g:gitgutter_eager = 1

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    let g:airline#extensions#branch#enabled=1

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'

    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline#extensions#tabline#buffer_idx_mode = 1
"}

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
autocmd FileType markdown,md call s:EnableMarkdown()
"}
"
"java{
function s:EnableJava()
endfunction
    autocmd Filetype java,jsp set omnifunc=javacomplete#Complete
    autocmd Filetype java,jsp set completefunc=javacomplete#CompleteParamsInf
    autocmd Filetype java,jsp inoremap &lt;buffer> . .&lt;C-X>&lt;C-O>&lt;C-P>&lt;DOWN>
autocmd FileType java call s:EnableJava()
"}
"go{
function s:EnableGo()

	let g:go_snippet_engine = "neosnippet"
	" Disable the neosnippet preview candidate window
	" When enabled, there can be too much visual noise
    "  especially when splits are used.
    set completeopt-=preview
	let g:go_fmt_command = "goimports"
	let g:go_highlight_functions = 1  
	let g:go_highlight_methods = 1  
	let g:go_highlight_structs = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_build_constraints = 1
endfunction
autocmd FileType go set omnifunc=go#complete#Complete
autocmd FileType go set completefunc=go#complete#Complete
autocmd Filetype go inoremap &lt;buffer> . .&lt;C-X>&lt;C-O>&lt;C-P>&lt;DOWN>
autocmd FileType go call s:EnableGo()
"}
