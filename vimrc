set nocompatible              " be iMproved, required
syntax on
set nowrap
set encoding=utf8

set exrc
set secure

"""" START Vundle Configuration
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
Plugin 'gmarik/Vundle.vim'

" Utility
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'Shougo/neocomplete.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'ervandew/supertab'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Generic Programming Support 
" Plugin 'jakedouglas/exuberant-ctags'
" Plugin 'Townk/vim-autoclose'
" Plugin 'rip-rip/clang_complete'
Plugin 'neomake/neomake'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'

" Theme / Interface
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
" Plugin 'ryanoasis/nerd-fonts'
Plugin 'tmhedberg/SimpylFold'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Plugin 'FuzzyFinder'
" Plugin 'SkidanovAlex/CtrlK'

 " Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

 
" git repos on your local machine (i.e. when working on your own plugin)
 "Plugin 'file:///home/gmarik/path/to/plugin'

 " The sparkup vim script is in a subdirectory of this repo called vim.
 " Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}


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

 " set number
set ruler

" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab
set smarttab


set laststatus=2
" Enable highlighting of the current line
set cursorline

set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

" path to directory where library can be found
" let g:clang_library_path='/usr/lib/llvm-3.8/lib'
" or path directly to the library file
" let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang-3.8.so.1'
" let g:ctrlk_clang_library_path="/usr/lib/llvm-3.8/lib/libclang-3.8.so.1"
" nmap <F3> :call GetCtrlKState()<CR>
" nmap <C-k> :call CtrlKNavigateSymbols()<CR>
" nmap <F2> :call CtrlKGoToDefinition()<CR>
" nmap <F12> :call CtrlKGetReferences()<CR>

" nmap <F4> :call CtrlKGoToDefinitionWithSplit('j')<CR>
" nmap <F5> :call CtrlKGoToDefinitionWithSplit('k')<CR>

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
let g:airline_theme='hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_enable_elixir_checker = 1
" let g:syntastic_elixir_checkers = ["elixir"]

let g:SimpylFold_docstring_preview=1

" YouCompleteMe Setup
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" enable all Python syntax highlighting features
let python_highlight_all = 1

" setup make program and directory
set makeprg=make\ -C\ build\ -j9

" Neomake settings
autocmd! BufWritePost * Neomake
let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']

au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufRead,BufNewFile *.launch set filetype=xml

au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

let &path.="include,src/include,/usr/include/AL,/opt/ros/kinetic/include/AL,"

" --- toggle autocomplete behavior and word delimiters ---
"
function! KeywordsAll()
    setl iskeyword=@,48-57,192-255,\@,\$,%,-,_
endfunc
"
function! KeywordsBasic()
    setl iskeyword=@,48-57,192-255
endfunc
"

" --- COMMON STUFF / HELPERS ---
"
"  " Toggle show tabs and trailing spaces
" nnoremap <leader>c :set nolist!<CR>
"
"  " Clear the search highlight
nnoremap <silent> \ :silent nohlsearch<CR>
"
"  " text wrap: Hard wrap paragraph text (similar to TextMate Ctrl+Q)
" nnoremap <leader>tw gqip
" nnoremap <leader>nw :set nowrap<CR>
"
"  " Reformat code
" nnoremap <leader>rf gg=G
"
"  " I use retab too much and it's hard to type
" nnoremap <leader>rt :retab!<CR>
"
"  " Pull word under cursor into LHS of a substitute (find and replace)
"  nnoremap <leader>rr :silent call KeywordsAll()<CR>
"  :%s#\<<C-r>=expand("<cword>")<CR>\>#
"
" " fast Ack
" nnoremap <leader>a :tab split<CR>:Ack<Space>
" nnoremap <leader>aw :silent call KeywordsAll()<CR> :tab
"
" " Toggle spelling hints
nnoremap <silent> <leader>ts :set spell!<CR>
"
"
" " Move between splits (windows)
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
"
" " Move windows around (only works on same row)
noremap <C-S-Right> <C-w>r
noremap <C-S-Left> <C-w>R
"
" " Open current buffer in a new split
noremap <leader>s :vsplit<cr>
noremap <leader>i :split<cr>

" " resize splits (http://vim.wikia.com/wiki/Resize_splits_more_quickly)
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Enable folding with the spacebar
let g:SimpylFold_docstring_preview=1
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

nnoremap <F6> :make!<cr>

" Fzf Configuration
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Neocomplete Settings
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

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


"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
" """""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

" Mapping selecting Mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})


