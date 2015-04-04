set rtp+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on


"" ==========  Basic setup stuff   ==========
set nobackup                                              " no backup files
set nowritebackup                                         " only in case you don't want a backup file while editing
set noswapfile                                            " no swap files
set scrolloff=4                                           " adds top/bottom buffer between cursor and window
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


highlight OverLength ctermbg=240 ctermfg=white
call matchadd('OverLength', '\%81v', 100)


"" ========= Shortcut commands =========
" in visual mode, "." will for each line, go into normal mode and execute the "."
vnoremap . :norm.<CR>

" easy leader commenting
nmap <Leader>3 gcc
vmap <Leader>3 gc

nmap <Leader>c oconsole.log();<c-o>h
nmap <Leader>e :NERDTreeToggle<CR>
" no highlight
nmap <Leader>g :noh<CR>
" pry insertion
nmap <Leader>p orequire 'pry' ; binding.pry<ESC>:w<CR>


nnoremap <Leader>bb :w!<CR>:!bundle install<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>s :w!<CR>:!bin/rspec %<CR>
" nnoremap <Leader>t :w!<CR>:!ruby %<CR>
nnoremap <Leader>w :noh<CR>:w!<CR>


" easier pane focus
" make left pane fullscreen
nnoremap <Leader>] <c-w>l<c-w><BAR>0
" make right pane fullscreen
nnoremap <Leader>[ <c-w>h<c-w><BAR>0
nnoremap <Leader>= <c-w>=


" custom commands
command Routes :!clear && bin/rake routes
command GITX !gitx


"" ======= run tests =======
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#ruby#minitest#executable = 'ruby'


" === No longer needed with vim 7.4 ===
" paste without being stupid, that works
" nnoremap <Leader>v :r !pbpaste<CR>
" copy without being stupid, that works
" vnoremap <Leader>c :w !pbcopy<CR><CR>


" Disable Ex mode
map Q <Nop>
" Disable K looking stuff up
map K <Nop>


" move lines up and down
" uses ctrl-j and ctrl-k
" nnoremap <C-j> :m .+1<CR>==
" nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


" Command navigation
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <Esc>b <S-Left> " commenting out b/c makes it pause
cnoremap <Esc>f <S-Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>


" Command editing
cnoremap <M-p> <Up>
cnoremap <M-n> <Down>
cnoremap <C-k> <C-f>d$<C-c><End>
cnoremap <C-y> <C-r><C-o>"
cnoremap <C-d> <Right><C-h>


"" strip trailing whitespace
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


" replaces %/ with current directory, and %% with current file
cmap %/ <C-R>=expand("%:p:h")."/"<CR>
cmap %% <C-R>=expand("%")<CR>


"" filetypes
au  BufRead,BufNewFile *.elm setfiletype haskell


"" ======= always rainbow parens ========
augroup RainbowParens
  autocmd!
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd BufEnter * RainbowParenthesesLoadRound
  autocmd BufEnter * RainbowParenthesesLoadSquare
  autocmd BufEnter * RainbowParenthesesLoadBraces
augroup END


"" ==========  These come from Mislav (http://mislav.uniqpath.com/2011/12/vim-revisited/)  ==========
set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation


"" ==========  Pathogen, vim path manager (https://github.com/tpope/vim-pathogen#readme)  ==========
call pathogen#infect()


"" ==========  Powerline, toolbar (https://github.com/Lokaltog/vim-powerline/) ==========
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


"" ========== NERDTree ==========
" Make NERDTree open when vim opens
" autocmd vimenter * NERDTree

" close vim if NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"" ========== ignore certain folders with ctrlp ==========
set wildignore+=*tmp/*,*coverage/*,*bower_components/*,*node_modules/*,*.rvm*

" the silver searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


"" ========== Default Tree Type ==========
let g:netrw_liststyle= 3


"" ========== vim-textobj-rubyblock ==========
runtime macros/matchit.vim " a dependency


"" ========== Mustache helper ===========
let g:mustache_abbreviations = 1


" ========== Pathogen plugins ==========

" ZoomWin                     https://github.com/vim-scripts/ZoomWin.git
" nerdtree                    https://github.com/scrooloose/nerdtree.git
" supertab                    https://github.com/ervandew/supertab.git
" unite.vim                   https://github.com/Shougo/unite.vim.git
" vim-coffee-script           https://github.com/kchmck/vim-coffee-script.git
" vim-commentary              https://github.com/tpope/vim-commentary.git
" vim-endwise                 https://github.com/tpope/vim-endwise.git
" vim-fish                    https://github.com/dag/vim-fish.git
" vim-fugitive                https://github.com/tpope/vim-fugitive.git
" hdevtools                   https://github.com/bitc/hdevtools.git
" vim-javascript              https://github.com/pangloss/vim-javascript.git
" vim-powerline               https://github.com/Lokaltog/vim-powerline.git
" vim-repeat                  https://github.com/tpope/vim-repeat.git
" vim-rspec                   https://github.com/skwp/vim-rspec.git
" vim-ruby                    https://github.com/vim-ruby/vim-ruby.git
" vim-surround                https://github.com/tpope/vim-surround.git
" vim-textobj-rubyblock       https://github.com/nelstrom/vim-textobj-rubyblock.git
" vim-textobj-user            https://github.com/kana/vim-textobj-user.git
" vim-ctrlp                   https://github.com/kien/ctrlp.vim
