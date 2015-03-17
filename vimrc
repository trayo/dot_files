set rtp+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on


"" ==========  My shit  ==========
set nobackup                                              " no backup files
set nowritebackup                                         " only in case you don't want a backup file while editing
set noswapfile                                            " no swap files
set scrolloff=4                                           " adds top/bottom buffer between cursor and window
set cursorline                                            " colours the line the cursor is on
set number                                                " line numbers

"" ========== Mustache helper ===========
let g:mustache_abbreviations = 1


"" ======= Always Rainbow Parens ========
nnoremap <Leader>9 :Rainbow<CR>
command Rainbow :call ToggleRainbow()
function ToggleRainbow()
  RainbowParenthesesToggle
  RainbowParenthesesLoadRound
  RainbowParenthesesLoadSquare
  RainbowParenthesesLoadBraces
  RainbowParenthesesLoadChevrons
endfunction


" in visual mode, "." will for each line, go into normal mode and execute the "."
vnoremap . :norm.<CR>

nmap <Leader>3 gcc
nmap <Leader>c oconsole.log();<c-o>h
nmap <Leader>e :NERDTreeToggle<CR>
" no highlight
nmap <Leader>g :noh<CR>
" pry insertion
nmap <Leader>p orequire 'pry' ; binding.pry<ESC>:w<CR>


vmap <Leader>3 gc

nnoremap <Leader>bb :!bundle install<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>t :w<CR>:!bin/rspec %<CR>
nnoremap <Leader>w :w!<CR>
" make left pane fullscreen
nnoremap <Leader>] <c-w>l<c-w><BAR>
" make right pane fullscreen
nnoremap <Leader>[ <c-w>h<c-w><BAR>
nnoremap <Leader>= <c-w>=


" paste without being stupid, that works
nnoremap <Leader>v :r !pbpaste<CR>
" copy without being stupid, that works
vnoremap <Leader>c :w !pbcopy<CR><CR>


" Trollin remaps
nnoremap <Up> :!say -v "pipe organ" "haters gonna hate hate hate hate hate"<CR><CR>
nnoremap <Left> :!say "updog"<CR><CR>
nnoremap <Right> :!say "alex sucks"<CR><CR>
nnoremap <Down> :!say "hater"<CR><CR>


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


" sets vim splits to default right and bottom
set splitbelow
set splitright


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


"" ==========  These come from Mislav (http://mislav.uniqpath.com/2011/12/vim-revisited/)  ==========
set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation


"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode


"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching


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
" call Pl#Theme#RemoveSegment('lineinfo')           " Line number and column length


"" ========== NERDTree ==========
" autocmd vimenter * NERDTree     " Make NERDTree open when vim opens

" close vim if NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"" ========== ctrlp ==========
set wildignore+=*tmp/*,*coverage/*,*bower_components/*,*node_modules/*


"" ========== Default Tree Type ==========
let g:netrw_liststyle= 3


"" ========== vim-textobj-rubyblock ==========
runtime macros/matchit.vim " a dependency


" ========== Pathogen plugins ==========

" ZoomWin                     https://github.com/vim-scripts/ZoomWin.git
" nerdtree                    https://github.com/scrooloose/nerdtree.git
" supertab                    https://github.com/ervandew/supertab.git
" unite.vim                   https://github.com/Shougo/unite.vim.git
" vim-coffee-script           https://github.com/kchmck/vim-coffee-script.git
" vim-commentary              https://github.com/tpope/vim-commentary.git
" vim-cucumber                https://github.com/tpope/vim-cucumber.git
" vim-elixir                  https://github.com/elixir-lang/vim-elixir.git
" vim-endwise                 https://github.com/tpope/vim-endwise.git
" vim-fish                    https://github.com/dag/vim-fish.git
" vim-fugitive                https://github.com/tpope/vim-fugitive.git
" vim-haml                    https://github.com/tpope/vim-haml.git
" hdevtools                   https://github.com/bitc/hdevtools.git
" vim-javascript              https://github.com/pangloss/vim-javascript.git
" vim-markdown                https://github.com/tpope/vim-markdown.git
" vim-powerline               https://github.com/Lokaltog/vim-powerline.git
" vim-repeat                  https://github.com/tpope/vim-repeat.git
" vim-rspec                   https://github.com/skwp/vim-rspec.git
" vim-ruby                    https://github.com/vim-ruby/vim-ruby.git
" vim-surround                https://github.com/tpope/vim-surround.git
" vim-textobj-rubyblock       https://github.com/nelstrom/vim-textobj-rubyblock.git
" vim-textobj-user            https://github.com/kana/vim-textobj-user.git
" vim-ctrlp                   https://github.com/kien/ctrlp.vim
