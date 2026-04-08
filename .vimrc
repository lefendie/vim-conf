set nocompatible
syntax on

filetype plugin on

set ttyfast

set number "set number on left
set tabstop=2 
set shiftwidth=2
set ruler "print the line and column of cursor
set incsearch
"set autochdir "set the working dir to edited file

set hlsearch "hightlight word research
set autoindent "autoindent
set cursorline "put a line for the cursor

set noexpandtab " Make sure that every file uses real tabs, not spaces
set shiftround  " Round indent to multiple of 'shiftwidth'
set smartindent " Do smart indenting when starting a new line
set autoindent  " Copy indent from current line, over to the new line
set showcmd		"display the current command
set splitright		"When splitting, put the new window right
set splitbelow		"When splitting, put the new window below

set listchars=eol:$,tab:->,space:~,multispace:~,trail:X,extends:>,precedes:<

set backspace=indent,eol,start

set colorcolumn=80
set shortmess+=c "Removes the status message of selection in word completion
set completeopt=menuone,longest

set showmode "Show actual vim mode

" Set the tab width
let s:tabwidth=2
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth

let mapleader = "-"

set termguicolors

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>o	o<Esc>
nnoremap <leader>O	O<Esc>

nnoremap wwh <C-w>h<Esc>

nnoremap wwl <C-w>l<Esc>
nnoremap wwh <C-w>h<Esc>
nnoremap wwk <C-w>k<Esc>
nnoremap wwj <C-w>j<Esc>
nnoremap hf zfi{

nnoremap <Space> :noh<cr>

"function! SetWhiteSpace()
"	let list = :set list?
"	if list == "list"
"		:set list&
"	else
"		:set list
"	endif
"
"endfunction

"nnoremap <C><Space> :call SetWhiteSpace<cr>

inoremap <C-B> <Esc>ha
inoremap <C-F> <Esc>la



nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>

map	<F6> :!./*

command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

"NERD TREE
nnoremap nt :NERDTreeToggle<Enter>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))                  
		silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs          
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
endif                                                                         



"PLUGIN MANAGER
call plug#begin('~/.vim/plugged')
  Plug 'AlessandroYorba/Alduin'                                               
  Plug 'scrooloose/nerdtree'                                                  
  Plug 'scrooloose/syntastic'                                                 
  Plug 'valloric/youcompleteme'                                               
  Plug 'yggdroot/indentline'                                                  
	"Plug 'ervandew/supertab'
	"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:alduin_Shout_Dragon_Aspect = 0
let g:alduin_Shout_Become_Ethereal = 1
let g:alduin_Shout_Fire_Breath = 0

augroup PersonalTouch
	autocmd!
	autocmd ColorScheme * highlight ColorColumn cterm=NONE guibg=#510510
										\ | highlight NonText cterm=NONE guifg=#615730
										\ | highlight SpecialKey cterm=NONE guifg=#615730
augroup END

colorscheme alduin 

let g:user42 = 'lefendie'
let g:mail42 = 'lefendie@student.42.fr'

autocmd FileType markdown let b:coc_suggest_disable = 1                       

set statusline+=%#warningmsg#                                                 
set statusline+=%{SyntasticStatuslineFlag()}                                  
set statusline+=%*                                                            
let g:syntastic_always_populate_loc_list = 1                                  
let g:syntastic_auto_loc_list = 1                                             
let g:syntastic_check_on_open = 1                                             
let g:syntastic_check_on_wq = 0                                               
let g:syntastic_cpp_check_header = 1                                          
let g:indentLine_setColors = 0                                                

"let g:SuperTabDefaultCompletionType = "<C-n>"

"YCM
let g:ycm_key_invoke_completion = '<Tab>'
let g:ycm_auto_trigger =1
let g:ycm_enable_semantic_highlighting=1

nnoremap -df :YcmCompleter GoToDefinition <Enter>
nnoremap -dc :YcmCompleter GoToDeclaration <Enter>
nnoremap -rf :YcmCompleter GotoReference <Enter>
nnoremap -ff :YcmCompleter FixIt <Enter>


