set exrc
set relativenumber
set number
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=15
set signcolumn=yes

call plug#begin('~/.nvim/plugged')
Plug 'tanvirtin/monokai.nvim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jacoborus/tender.vim'
Plug 'junegunn/fzf.vim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'APZelos/blamer.nvim'
call plug#end()

syntax on
colorscheme monokai
highlight Normal guibg=none ctermbg=none
highlight LineNr guibg=none ctermbg=none
highlight Folded guibg=none ctermbg=none
highlight NonText guibg=none ctermbg=none
highlight SpecialKey guibg=none ctermbg=none
highlight VertSplit guibg=none ctermbg=none
highlight SignColumn guibg=none ctermbg=none
highlight EndOfBuffer guibg=none ctermbg=none

let mapleader = " "

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
imap <C-t> <></><Esc>5hdiwp3lpT>i

fun! TrimWhiteSpace()
let l:save = winsaveview()
keeppatterns %s/\s\+$//e
call winrestview(l:save)
endfun

augroup RADISSIMO
autocmd!
autocmd BufWritePre * :call TrimWhiteSpace()
set noswapfile
set nobackup
set undodir=~/.vim/undodir
augroup END

let g:netrw_keepdir=0

nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :w<CR>
nnoremap <leader>q :q<CR>
inoremap jk <esc>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Explore<CR>
nnoremap <leader>gb :BlamerToggle<CR>
cnoremap edit location :e %:h/{location}
