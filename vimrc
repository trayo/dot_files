set rtp+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on

"" ==========  Pathogen, vim path manager (https://github.com/tpope/vim-pathogen#readme)  ==========
call pathogen#infect()

"" ==========  Basic setup stuff   ==========
set nobackup                                              " no backup files
set nowritebackup                                         " only in case you don't want a backup file while editing
set noswapfile                                            " no swap files
set scrolloff=2                                           " adds top/bottom buffer between cursor and window
set cursorline                                            " colours the line the cursor is on
set number                                                " line numbers
set clipboard=unnamed                                     " allows y and p to clipboard vim > 7.4
set complete-=i                                           " ignores included files in autocomplete
set splitbelow                                            " sets vim splits to default right and bottom
set splitright
set hlsearch                                              " highlight matches
set incsearch                                             " incremental searching
set nowrap                                                " don't wrap lines
set tabstop=2 shiftwidth=2                                " a tab is two spaces (or set this to 4)
set expandtab                                             " use spaces, not tabs (optional)
set backspace=indent,eol,start                            " backspace through everything in insert mode
set wildmode=longest:list                                 " better command line completion
set ignorecase                                            " ingore casing in vim ex mode

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


" ========= leader snippets =========
nmap <Leader>e :NERDTreeToggle<CR>
nmap <Leader>r :redraw!<CR>

" write/quit mappings
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>w :w!<CR>
command W :w
command Q :q

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
  normal! mqv_w
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
" cnoremap <M-b> <S-Left>
" cnoremap <M-f> <S-Right>


" ======= command editing =======
cnoremap <M-p> <Up>
cnoremap <M-n> <Down>
cnoremap <C-k> <C-f>d$<C-c><End>
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


" ==========  These come from Mislav (http://mislav.uniqpath.com/2011/12/vim-revisited/)  ==========
set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation


" ==========  Powerline, toolbar (https://github.com/Lokaltog/vim-powerline/) ==========
let g:Powerline_symbols = 'compatible'
let g:Powerline_stl_path_style = 'relative'
set laststatus=2   " Always show the statusline
set t_Co=256       " Explicitly tell vim that the terminal supports 256 colors


" got this list from here: https://github.com/Lokaltog/vim-powerline/blob/c4b72c5be57b165bb6a89d0b8a974fe62c0091d0/autoload/Powerline/Themes/default.vim
call Pl#Theme#RemoveSegment('fugitive:branch')
call Pl#Theme#RemoveSegment('syntastic:errors')
call Pl#Theme#RemoveSegment('fileformat')
call Pl#Theme#RemoveSegment('fileencoding')
call Pl#Theme#RemoveSegment('filetype')


" ========== nerdtree ==========
" ignore files or folders in nerdtree
let NERDTreeIgnore=['\coverage']

" close vim if NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


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


" ========== pathogen plugins ==========

" ctrlp                       https://github.com/kien/ctrlp.vim
" nerdtree                    https://github.com/scrooloose/nerdtree.git
" rainbow parenthesis         https://github.com/eapache/rainbow_parentheses.vim
" vim-commentary              https://github.com/tpope/vim-commentary.git
" vim-javascript              https://github.com/pangloss/vim-javascript.git
" vim-jsx                     https://github.com/mxw/vim-jsx
" vim-powerline               https://github.com/Lokaltog/vim-powerline.git
" vim-react-snippets          https://github.com/justinj/vim-react-snippets
" vim-ruby                    https://github.com/vim-ruby/vim-ruby.git
" vim-ruby-collapse           https://github.com/trayo/vim-ruby-collapse
" vim-slim                    https://github.com/slim-template/vim-slim
" vim-snipmate                https://github.com/garbas/vim-snipmate
  " tlib                      https://github.com/tomtom/tlib_vim.git
  " addon-mw-utils            https://github.com/MarcWeber/vim-addon-mw-utils.git
  " vim-snippets              https://github.com/honza/vim-snippets.git
" vim-test                    https://github.com/janko-m/vim-test

