"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
"""""""""""""""""""""""""""""""""""""""""""""""""
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.config/nvim/plugged')

Plug 'trevordmiller/nova-vim'
Plug 'pangloss/vim-javascript' 
Plug 'majutsushi/tagbar'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'Shougo/neosnippet'
Plug 'fatih/vim-go'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'airblade/vim-gitgutter'
Plug 'gevans/vim-ginkgo'
Plug 'vim-scripts/dbext.vim'
Plug 'krisajenkins/vim-pipe'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

