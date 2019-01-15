"" Source vimrc automatically
autocmd! bufwritepost ~/.config/nvim/init.vim source %


" easier moving between tabs
map <Leader>h <esc>:tabprevious<CR>
map <Leader>l <esc>:tabnext<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Split to the right
set splitright


" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


"" This is the source of spell being broken
"" Configuration specific to .tex files 
augroup latex_ft
  au!
  autocmd BufNewFile,BufRead *.tex   set wrap linebreak nolist
  set spelllang=en
  set spell
  let g:Tex_MultipleCompileFormats = 'pdf'
augroup END

set nospell
autocmd BufEnter *.tex set spell
autocmd BufLeave *.tex set nospell

tnoremap <Esc> <C-\><C-n>
" Press ESC twice to stop highlighting after search
nnoremap <esc><esc> :noh<return>


"" Use Ctrl + hjkl to move around the windows
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h
"" vim-latex remaps <C-j> to something else. This trick executes after the
"" plugins are loaded so it doesn't get overriden
augroup vimrc
    au!
    au VimEnter * unmap <C-j>
    au VimEnter * noremap <C-j> <C-w>j
augroup END


" Better indentation
vnoremap < <gv
vnoremap > >gv


" cmd + / to comment
"xnoremap <C-/> gc

call plug#begin('~/.config/nvim/plugged')

"Plug 'stevearc/vim-arduino'
"Plug 'tpope/vim-sensible'
"Plug 'tpope/commentary' " There must be an issue with key bindings for this
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim'
Plug 'kien/ctrlp.vim' " Fuzzy search
"Plug 'Vigemus/nvimux'
Plug 'vim-latex/vim-latex'

call plug#end()

" ============================================================================
" Python IDE Setup
" ============================================================================


" For python-folding script
set nofoldenable

" vim-powerline
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
