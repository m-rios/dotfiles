"" Source vimrc automatically
" autocmd! bufwritepost ~/.config/nvim/init.vim source %

" jump to newer position in jumplist (<C-I>/<Tab> is used by coc for
" completion)
nnoremap <C-N> g,

" Split to the right and bottom
set splitright
set splitbelow

" Set focused window to 70%
" autocmd WinEnter * execute &columns * 8 / 10 . 'wincmd |' 
" :au FocusLost * silent! wa

" Line number at cursor line and relative numbering for the rest of the lines
set number
" set relativenumber " Affects performance when scrolling
set cursorline " Affects performance when scrolling
set colorcolumn=120 " Vertical line

"change default indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
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
" let g:netrw_banner = 0
" let g:netrw_winsize = 25
" let g:netrw_liststyle = 3

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
Plug 'airblade/vim-gitgutter' " Show git modifications in the gutter
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'preservim/nerdtree'
Plug 'kkoomen/vim-doge' " DOcumentation GEnerator (docstring plugin)
Plug '907th/vim-auto-save'
call plug#end()

" polyglot uses latexbox, which conflicts with vimlatex
"let g:polyglot_disabled = ['latex']

let g:auto_save = 1  " enable AutoSave on Vim startup

" Find files not in .gitignore
nnoremap <Leader>gf :GFiles <CR>
" nnoremap <C-S-F> :Files <CR>
nnoremap <Leader>gb :Buffers <CR>
nnoremap <C-F> :Ag <CR>

" Open NERDTree at the current file location
nnoremap <F2> :NERDTreeToggle %<CR>
colorscheme nord
" set termguicolors

" Vim notes directory
"let g:notes_directory = ['~/Documents/notes']


so ~/.config/nvim/coc.vim

autocmd bufnewfile,bufread *.jsx set filetype=javascript.jsx


" This should be the last line
set secure " From this point onwards disable unsecure commands (for project specific configurations)
