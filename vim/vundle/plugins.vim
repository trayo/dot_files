set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'altercation/vim-colors-solarized'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'luochen1990/rainbow'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-commentary'
Plugin 'trayo/vim-ginkgo-snippets'
Plugin 'trayo/vim-gomega-snippets'
Plugin 'trayo/vim-go-snippets-extended'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-unimpaired'

call vundle#end()

filetype plugin indent on
