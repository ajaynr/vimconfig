runtime! archlinux.vim
" Sample .vimrc file by Martin Brochhaus
" Presented at PyCon APAC 2012
" Tweaked by Ajay N R

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
"" map <c-j> <c-w>j
"" map <c-k> <c-w>k
"" map <c-l> <c-w>l
"" map <c-h> <c-w>h

" Change <Leader> to ','
let mapleader = ","

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
"" vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
"" set t_Co=256
"" color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype on
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
"" set fo-=t   " don't automatically wrap text when typing
"" set colorcolumn=80
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Useful settings
set history=700
set undolevels=700




" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
"" set nobackup
"" set nowritebackup
set noswapfile


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()

"Insert new line in normal mode
nmap <S-CR> O<Esc>
nmap <CR> o<Esc>

"Set autoread to automatically read files from buffer
set autoread

"Remap Esc key
imap <M-Space> <Esc>
vnoremap <M-Space> <Esc>h

"Commands to close all tabs to right
function! Tabr(bang)
let cur=tabpagenr()
while cur < tabpagenr('$')
    exe 'tabclose' . abang . ' ' . (cur+1)
endwhile
endfunction
command! -bang Tabr call Tabr('<bang>')

"Commands to close all tabs to left
function! Tabl(bang)
while tabpagenr()>1
    exe 'tabclose' . a:bang . '1'
endwhile
endfunction
command! -bang Tabl call Tabl('<bang>')

set relativenumber
" Setting colors
"hi Normal ctermbg=DarkGray guibg=#000000
"hi LineNr ctermbg=16 guibg=#000000
"colo desert
let g:gruvbox_contrast_dark = 'hard'
autocmd vimenter * colorscheme gruvbox
set background=dark
