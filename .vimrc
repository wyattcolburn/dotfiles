" VIM Configuration Profile

" Use the PowerLine plugin. Change Python directory if needed.
set rtp+=$HOME/.local/lib/python3.8/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Always show the command as it is being typed.
set showcmd

"my vimrc

syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent 
set smartindent
set number
set mouse=a
let mapleader = " "

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')


" LSP and completion plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'scrooloose/nerdtree'
" Initialize plugin system
call plug#end()

function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
endfunction

augroup lsp_install
	au!
	autocmd user lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" Key mappings for CoC.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc
let g:floaterm_keymap_new = '<Leader>ft'
let g:floaterm_keymap_toggle = '<Leader>t'

"Copy and Paste Stuff
vnoremap <leader>y "+y
map <C-p> "+p

"Nerd tree stuff
nmap <Leader>nt :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree

"Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

map <Leader>vs :vsplit<CR>
map <Leader>hs :hide<CR>
"Navigation for splits
map <C-h> <C-w>h
map <C-l> <C-w>l
