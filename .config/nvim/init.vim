syntax on
set tabstop=4
set shiftwidth=4
set expandtab
"set spelllang=en
"set spell
set number

" Configuration specific to .tex files 
augroup latex_ft
  au!
  autocmd BufNewFile,BufRead *.tex   set wrap linebreak nolist
  set spelllang=en
  set spell
  let g:Tex_MultipleCompileFormats = 'pdf'
augroup END

tnoremap <Esc> <C-\><C-n>
" Press ESC twice to stop highlighting after search
nnoremap <esc><esc> :noh<return>

" Move around wrapped lines using cmd+usual movement keys [NOT WORKING]
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

call plug#begin('~/.config/nvim/plugged')

" Plug 'stevearc/vim-arduino'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Vigemus/nvimux'
Plug 'KSP-KOS/EditorTools', {'rtp': 'VIM/vim-kerboscript'}
Plug 'vim-latex/vim-latex'

call plug#end()
