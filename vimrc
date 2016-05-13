set rtp+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on
syntax enable


"" ========== vundle ==========
source  ~/.vim/vundle/plugins.vim


"" ==========  setup stuff   ==========
set nobackup                                 " no backup files
set nowritebackup                            " only in case you don't want a backup file while editing
set noswapfile                               " no swap files
set scrolloff=2                              " adds top/bottom buffer between cursor and window
set cursorline                               " colours the line the cursor is on
set number                                   " line numbers
set clipboard=unnamed                        " allows y and p to clipboard vim > 7.4
set complete-=i                              " ignores included files in autocomplete
set splitbelow                               " sets vim splits to default right and bottom
set splitright
set hlsearch                                 " highlight matches
set incsearch                                " incremental searching
set nowrap                                   " don't wrap lines
set tabstop=2 shiftwidth=2                   " a tab is two spaces (or set this to 4)
set expandtab                                " use spaces, not tabs (optional)
set backspace=indent,eol,start               " backspace through everything in insert mode
set wildmode=longest:list                    " better command line completion
set ignorecase                               " use case ignore by default
set laststatus=2                             " Always show the statusline
set t_Co=256                                 " Explicitly tell vim that the terminal supports 256 colors
set nocompatible                             " choose no compatibility with legacy vi
set encoding=utf-8
set showcmd                                  " display incomplete commands


" ========= misc =========
" disable auto indent on : and - for yml files
autocmd FileType yaml setl indentkeys-=<:>

" highlights characters on the 80th line
highlight OverLength ctermbg=240 ctermfg=white
call matchadd('OverLength', '\%81v.', 100)

" change highlight text colors to black
highlight Visual ctermfg=7 ctermbg=8

" in visual mode, "." will for each line, go into normal mode and execute the "."
vnoremap . :norm.<CR>a

" spacebar sends no highlight
nnoremap <Space> :noh<CR>

command Routes !clear && bin/rake routes
command GITX !clear && gitx

" make ctrl+e and ctrl+y scroll 2 lines
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Disable ex mode and man pages
nnoremap Q <Nop>
nnoremap K <Nop>
vnoremap K <Nop>

" write/quit mappings
command W :w!
command Q :q!

" use ctrl+g to open command edit window
set cedit=<C-g>

" ========= leader snippets =========
nmap <Leader>e :NERDTreeToggle<CR>
nmap <Leader>r :redraw!<CR>

" replace spaces with underscore, for minitest test names
vnoremap <Leader>u :s/\%V /_/g<cr>


" ========= easier pane navigation =========
" make left pane fullscreen
nnoremap <Leader>] <c-w>l<c-w><BAR>0
" make right pane fullscreen
nnoremap <Leader>[ <c-w>h<c-w><BAR>0
" make panes equal size
nnoremap <Leader>= <c-w>=


" ========= pasting with auto indent =========
" (commenting out because it messes with ctrl+o in insert mode)
" nnoremap p mqp=`]`q
" nnoremap P mqP=`]`q


" ======== functions ========
" replace spaces with underscore, for minitest test names
command U :call Underscore()
command Underscore :call Underscore()
function! Underscore()
  normal! mq$v_w
  :s/\%V /_/g
  :exe "normal! \<esc>`q"
endfunction


" ======= move lines up and down =======
" uses ctrl-j and ctrl-k
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


" ======= command navigation =======
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-y> <C-r><C-o>"
cnoremap <C-d> <Right><C-h>


" ======= string trailing whitespace =======
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


" ======= easy directory substitution =======
" replaces %/ with current directory, and %% with current file
cmap %/ <C-R>=expand("%:p:h")."/"<CR>
cmap %% <C-R>=expand("%")<CR>


" ======= golang ========
" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1


" ======= syntastic ========
let g:syntastic_go_checkers = ['go', 'gofmt']
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" ======= always rainbow parens ========
let g:rainbow_conf = {
\   'ctermfgs': ['blue', 'red', 'cyan', 'magenta', 'yellow', 'white'],
\}
let g:rainbow_active = 1


" ========== nerdtree ==========
" ignore files or folders in nerdtree
let NERDTreeIgnore=['\coverage']

" close vim if NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ========== ignore certain folders with ctrlp ==========
set wildignore+=*tmp/*,*coverage/*,*bower_components/*,*node_modules/*,*.rvm*


" ======= use the silver searcher for searching =======
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" ======= airline =======
let g:airline_powerline_fonts = 1
