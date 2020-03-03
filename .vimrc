" General{{{
set nocompatible
set nobackup
set noswapfile
set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set smartcase
"set lazyredraw
"set colorscheme=darkblue
"set backspace=indent,eol,start whichwrap+=<,>,[,]
"" Vim 的默认寄存器和系统剪贴板共享
set clipboard=unnamed
" 设置 alt 键不映射到菜单栏
" set winaltkeys=no
set nu
" " }}}
"


"" Lang & Encoding {{{
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
"language messages zh_CN.UTF-8
" }}}


" Format {{{
set autoindent
"set smartindent
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
"set foldmethod=indent
set nobackup
syntax on
" }}}
"

" Keymap {{{
nmap ; :
vmap ; :

let mapleader=","

nmap <leader>s :source ~/.vimrc<cr>
nmap <leader>e :e ~/.vimrc<cr>

" tabs
map <leader>tt :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tp :tabp<cr>
map <leader>tn :tabn<cr>
" buffer
map <leader>bb :enew<cr>
map <leader>bd :bd<cr>
map <leader>bp :bp<cr>
map <leader>bn :bn<cr>

nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l


nmap <leader>j <C-W>j
nmap <leader>k <C-W>k
nmap <leader>h <C-W>h
nmap <leader>l <C-W>l

" casesconvert 
inoremap <C-u> <esc>mzgUiw`za

" map <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>


" resize buffer windows
map <C-left>  :vertical resize -5<cr>
map <C-right> :vertical resize +5<cr>
map <C-up>    :resize +5<cr>
map <C-down>  :resize -5<cr>

" inner terminal go to command mode
tnoremap <ESC> <C-\><C-n>
map <CR> <C-\><C-n>:bn<CR>


" for C/C++
autocmd FileType cpp inoremap ; <ESC>A;
autocmd FileType c inoremap ; <ESC>A;
" }}}


nmap <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:ter ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		CocCommand flutter.run
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc



let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'

set tags=tags; 
set autochdir
"
" Plugins
filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
"vundle Use Plugin
"call vundle#begin()
"Plugin 'gmarik/Vundle.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'kien/ctrlp.vim'
"Plugin 'severin-lemaignan/vim-minimap'
"Plugin 'koron/minimap-vim'
"vim-plug Use Plug
call plug#begin('~/.config/nvim/plugged')
"color theme
Plug 'soft-aesthetic/soft-era-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'liuchengxu/space-vim-theme'
" pretty dressing
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"rainbow bracket()
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs' 

Plug 'mhinz/vim-startify'
"quick search file
Plug 'junegunn/fzf.vim'
"python indent
Plug 'Yggdroot/indentLine'
"nerdtree and git
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'kien/ctrlp.vim'
"undo tree
Plug 'mbbill/undotree'
" fold
Plug 'Konfekt/FastFold'
"Plug 'majutsushi/tagbar',{'on':'TagbarAutoClose'}
Plug 'preservim/nerdcommenter'
" Taglist
Plug 'liuchengxu/vista.vim'
"only for neovim
if has('nvim')
  Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'voldikss/vim-floaterm'
else
  "python3 should be supported by vim
  "Plug 'Shougo/deoplete.nvim'
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'
  "python3 should be supported by vim
  "Plug 'Valloric/YouCompleteMe'
endif
"call vundle#end()
call plug#end()

filetype plugin indent on

"open startify
noremap <leader>st :startify<CR>

" tagbar
nmap <silent> <F6> :Vista!!<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"
"python indent
"let g:indentLine_setColors = 0
let g:indentLine_color_term = 238
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"
"
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : deoplete#complete()

let g:rainbow_active = 1
"autocmd vimenter * NERDTree
map <silent> <F2> :NERDTreeToggle<CR>
map <silent> <F3> :UndotreeToggle<CR>
"nerdtree end

" comment
map <silent> <F4> <plug>NERDCommenterToggle


" floaterm
let g:floaterm_keymap_toggle = '<F12>'

"Undotree
let g:undotree_DiffAutoOpen = 0

nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']
let g:markdown_folding = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1


"NERDTree-git
"let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <C-p> :FZF<CR>

syntax enable
"set background=light
"colorscheme solarized
"colorscheme seoul256-light
colorscheme snazzy

"let g:minimap_show='<leader>ms'
"let g:minimap_update='<leader>mu'
"let g:minimap_close='<leader>gc'
"let g:minimap_toggle='<leader>gt'

" make a soft link to share config file with vim
" ln ~/.vim .config/nvim
" ln -s ~/.vimrc .config/nvim/init.vim

" config only for neovim
if has('nvim')
  "colorscheme seoul256
  "set background=light
"        call plug#begin('~/.config/nvim/plugged')
"        Plug 'neoclide/coc.nvim', {'branch': 'release'}
"        call plug#end()
endif
