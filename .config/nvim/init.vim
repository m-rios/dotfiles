"" Source vimrc automatically
autocmd! bufwritepost ~/.config/nvim/init.vim source %

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <Leader>t <esc>:tabnew<CR>

" jump to newer position in jumplist (<C-I>/<Tab> is used by coc for
" completion)
nnoremap <C-N> g,

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" Split to the right and bottom
set splitright
set splitbelow

" Line number at cursor line and relative numbering for the rest of the lines
set number
set relativenumber
set cursorline

"change default indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Better indentation edition
vnoremap < <gv
vnoremap > >gv

" Improved search
set hlsearch " Keep search highlight once done with search
set incsearch " Highlight as you type search
set ignorecase " Ignore case if search string is lowercase
set smartcase " Don't ignore case if search string has uppercase
nnoremap <esc><esc> :noh<return> " Press esc twice to disable highlight

" Customized netrw
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_liststyle = 3

" enable project-specific features
set exrc

call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator' " C-{h,j,k,l} hotkeys for tmux and vim navigation
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot' " filetype language packs (syntax and indent)
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim' " Fuzzy search
"Plug 'dense-analysis/ale' " Linting
Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()

" polyglot uses latexbox, which conflicts with vimlatex
"let g:polyglot_disabled = ['latex']

nnoremap <Leader>gf :Files <CR>
nnoremap <Leader>gb :Buffers <CR>
nnoremap <C-F> :Ag <CR>

colorscheme nord
set termguicolors


" so ~/.config/nvim/coc.vim

autocmd bufnewfile,bufread *.jsx set filetype=javascript.jsx


" This should be the last line
set secure " From this point onwards disable unsecure commands (for project specific configurations)
