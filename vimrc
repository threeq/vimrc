
" call pathogen#infect() "插件管理

" vim-plug 插件管理
call plug#begin('~/.vim/plugged')

" completion/coding
"  Plug 'Valloric/YouCompleteMe'
  Plug 'jiangmiao/auto-pairs' "自动括号匹配
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-surround'
  Plug 'junegunn/vim-easy-align'
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
" scala
  Plug 'ensime/ensime-vim'
  Plug 'derekwyatt/vim-scala'
" go
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
" markdown
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
"  Plug 'rhysd/nyaovim-markdown-preview'

" snippets
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'garbas/vim-snipmate'
  " Optional:
  "Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

" Unmanaged plugin (manually installed and updated)
" Plug '~/.vim/my-plugins'

" Initialize plugin system
call plug#end()

" 基本配置
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileformat=unix
set fileformats=unix,dos,mac

filetype on
filetype plugin on
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

" <F4> => popup the file tree navigation)
nmap <F4> :NERDTreeToggle<CR>
" <F8> => toggle the srcExpl (for source code exploring)
nmap <F8> :SrcExplToggle<CR>

" tb => open the tagbar
nmap tb :TlistClose<CR>:TagbarToggle<CR>
" ti => taglist
nmap ti :TagbarClose<CR>:Tlist<CR>
" \jd => GoTo the definition
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" 插件配置
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

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

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

"markdown{
    let g:vim_markdown_no_default_key_mappings=1
    let g:vim_markdown_math=1
    let g:vim_markdown_frontmatter=1
    map asdf <Plug>Markdown_MoveToParentHeader
"}
"tabular{
    "let g:tabular_loaded = 1
"}
