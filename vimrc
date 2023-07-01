set nocompatible              " be iMproved, required
syntax on
set nowrap
set encoding=utf8

" Allow execute commang in local vimrc
" set exrc
" mitigates risks of exrc
" set secure

let mapleader = '/'

"""" START Vundle Configuration
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Utility
Plugin 'scrooloose/nerdtree'
" Plugin 'majutsushi/tagbar'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'ervandew/supertab'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Generic Programming Support 
" Plugin 'jakedouglas/exuberant-ctags'
" Plugin 'Townk/vim-autoclose'
" Plugin 'neomake/neomake'
" Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
" " Plugin 'nvie/vim-flake8'
" " Plugin 'aklt/plantuml-syntax'
"
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
" Plugin 'git://git.wincent.com/command-t.git'

   
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Plugin 'mattn/emmet-vim'
Plugin 'rdnetto/YCM-Generator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or  just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" set number
" set ruler

" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab
set smarttab

" Always show status line with filename 
" set laststatus=2
" Enable highlighting of the current line
set cursorline

set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

" Vim-Airline Configuration
let g:airline_theme='minimalist'

let g:airline#extensions#tabline#enabled = 1

" Syntastic Configuration
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:SimpylFold_docstring_preview=1

""""""""""" YCM CONFIGURATION
" YouCompleteMe Setup
"
" Mapping to close the completion menu (default <C-y>)
let g:ycm_key_list_stop_completion = ['<C-x>']

" Set filetypes where YCM will be turned on
let g:ycm_filetype_whitelist = { 'cpp':1, 'h':2, 'hpp':3, 'c':4, 'cxx':5 }

" Close preview window after completing the insertion
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

"let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf=0
"let g:ycm_use_clangd=1
"let g:ycm_clangd_args=['-background-index']
"let g:ycm_collect_identifiers_from_tag_files = 1
"set completeopt=longest,menu
"let g:ycm_key_detailed_diagnostics = '<leader>d'
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

""""""""""""""""""""""""""""""""""

" enable all Python syntax highlighting features
let python_highlight_all = 1

" setup make program and directory
" set makeprg=make\ -C\ build\ -j9

" Neomake settings
" autocmd! BufWritePost * Neomake
" let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']

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

let &path.="include,src/include,/usr/include/AL,"

" --- toggle autocomplete behavior and word delimiters ---
"
function! KeywordsAll()
    setl iskeyword=@,48-57,192-255,\@,\$,%,-,_
endfunc

function! KeywordsBasic()
    setl iskeyword=@,48-57,192-255
endfunc

" --- COMMON STUFF / HELPERS ---
" Toggle show tabs and trailing spaces
" nnoremap <leader>c :set nolist!<CR>

" Clear the search highlight
nnoremap <silent> \ :silent nohlsearch<CR>

" " text wrap: Hard wrap paragraph text (similar to TextMate Ctrl+Q)
" nnoremap <leader>tw gqip
" nnoremap <leader>nw :set nowrap<CR>

" Reformat code
" nnoremap <leader>rf gg=G

" I use retab too much and it's hard to type
" nnoremap <leader>rt :retab!<CR>

" Pull word under cursor into LHS of a substitute (find and replace)
"  nnoremap <leader>rr :silent call KeywordsAll()<CR>
"  :%s#\<<C-r>=expand("<cword>")<CR>\>#

" fast Ack
" nnoremap <leader>a :tab split<CR>:Ack<Space>
" nnoremap <leader>aw :silent call KeywordsAll()<CR> :tab

" Toggle spelling hints
nnoremap <silent> <leader>ts :set spell!<CR>

" Open current buffer in a new split
noremap <leader>s :vsplit<cr>
noremap <leader>i :split<cr>

" resize splits (http://vim.wikia.com/wiki/Resize_splits_more_quickly)
" nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Enable folding with the spacebar
let g:SimpylFold_docstring_preview=1
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" nnoremap <F6> :make!<cr>

""""""""""""""""""""""""""""""""""""" Fzf Configuration 
map ; :Files<CR>

" This is the default extra key bindings
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }


" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = ['right,50%', 'ctrl-\']

" In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }

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

"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
"""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
let g:webdevicons_enable_nerdtree = 1

" map <C-m> :TagbarToggle<CR>


" Mapping selecting Mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

""""""""""""""""""""""""""""""""""
" JSON
""""""""""""""""""""""""""""""""""

nnoremap <F3> :%!python -m json.tool<CR>
