call plug#begin()
	" Specific language additions
	Plug 'bfrg/vim-cpp-modern'

	" Status bar 
	Plug 'itchyny/lightline.vim'

	" Colorscheme 
	Plug 'joshdick/onedark.vim'

	" File explorer 
	Plug 'preservim/nerdtree'

	" Fuzzy finder
	Plug 'kien/ctrlp.vim'
call plug#end()

" Colorscheme 
colorscheme onedark

" Settings  
set number relativenumber
set t_ut="" " Fix color problem 
set laststatus=2 " Status bar 

" Keybindings 
noremap <C-s> :w<CR>
noremap <C-q> :q<CR>
noremap <Space>wl :wincmd l<CR>
noremap <Space>wk :wincmd k<CR>
noremap <Space>wj :wincmd j<CR>
noremap <Space>wh :wincmd h<CR>
noremap <A-l> :bnext<CR>
noremap <A-h> :bprevious<CR>
noremap <Space>e :NERDTree<CR>
noremap <Space>f :CtrlP<CR>

