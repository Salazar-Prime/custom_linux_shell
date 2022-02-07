map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
imap <F5> <Esc>:w<CR>:!clear;python %<CR>
nmap <F5> <Esc>:w<CR>:!clear;python %<CR>

" Turn on synta highilghting 
syntax on

" Setting visibility
set showcmd                                  " Showing what you are typing as command
set number                                   " Setting line numbers
set cursorline                               " Underlining the current line
"set cursorcolumn                             " Highlight the current column
set hlsearch                                 " Highlight things that we find with the search

" Setting tabs and indentation
set expandtab                                " Modify TAB key to use `softtabstop`
" set noexpandtab                            " Use hard tabs instead of softtabs. Turn it ON manually for files which use hard tabs.
set autoindent                               " Enabling autoindent (copy indentation from previous line)
set softtabstop=2                            " Spaces for TAB or BS keys. By default it has same value as `tabstop` (8 char) which should never be changed
"set shiftwidth=2                             " Affects the behavior or `<<` and `>>`


" ## Vundle Settings --------------------------------------------------------
" Install `Vundle` by following instructions on https://github.com/VundleVim/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'                " let Vundle manage Vundle, required
Plugin 'tpope/vim-fugitive'                  " git wrapper
Plugin 'preservim/nerdtree'                  " nerdtree plugin
Plugin 'psf/black'                           " Python code formatter: Black
Plugin 'vim-airline/vim-airline'             " status/tabline
Plugin 'tpope/vim-commentary'                " cimment in vim
Plugin 'rhysd/open-pdf.vim'                  " open pdf from vim
Plugin 'airblade/vim-gitgutter'              " git gutter

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

" ## End of Vundle Settings --------------------------------------------------------

" ## Settings for Installed Plugins -----------------------------------------

" airline Settings
set laststatus=2                             " for airline

" vim-airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_powerline_fonts = 1

" Open-Pdf Settings
" " open with tab
let g:pdf_open_cmd = 'tabnew | view'
