set nocompatible             " not compatible with the old-fashion vi mode
filetype off                 " required!

" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/dotfiles/vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/dotfiles/vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/dotfiles/vim/bundle/vundle
  let iCanHazVundle=0
endif

let hasMolokai=1
let molokai_readme=expand('~/dotfiles/vim/colors/molokai.vim')
if !filereadable(molokai_readme)
  echo 'Installing Molokai..'
  silent !git clone https://github.com/tomasr/molokai
  silent !mv molokai/colors/ ~/dotfiles/vim
  silent !rm -Rf molokai
  let hasMolokai=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'airblade/vim-gitgutter'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'sjl/gundo.vim'
Bundle 'fholgado/minibufexpl.vim'

" repos for javascripts
Bundle 'jelera/vim-javascript-syntax'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'
Bundle 'Valloric/YouCompleteMe'
Bundle 'marijnh/tern_for_vim'

" These are the tweaks I apply to YCM's config, you don't need them but they might help.
" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" function keys mapping
autocmd FileType python map <buffer> <F3> :call flake8#run()<CR>
map <F5> :TComment<cr>  " comment lines with cmd+/
vmap <F5> :TComment<cr>gv
nmap <F8> :TagbarToggle<CR> " --- tagbar
map <F9> :NERDTreeToggle<CR> " open sidebar with cmd+k

" folding
set foldenable 
set foldmethod=indent
set foldnestmax=2
nnoremap <space> za
vnoremap <space> zf

" key mapping
nmap - $
map <C-n> :tabnext<CR>
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>
" nmap <C-w> :tabclose<CR>
set tabpagemax=1000

" general
filetype plugin indent on    " enable filetype-specific plugins
set number                   " enable line numbers
set autoindent               " enable autoindent
set expandtab                " use space instead of tab
set tabstop=4                " insert 2 spaces for a tab
set shiftwidth=4             " the number of space characters inserted for indentation
syntax on                    " enable syntax highlighting
set autoread                 " auto read when file is changed from outside
set history=50               " keep 50 lines of command line history
set mouse=a                  " mouse support
if has("gui_running")        " GUI color and font settings
  set guifont=Monaco:h14
  set t_Co=256               " 256 color mode
end
if has("gui_macvim")         " macvim shift movement
  let macvim_hig_shift_movement = 1
endif
set cursorline               " highlight current line
set clipboard=unnamed        " yank to the system register (*) by default
set showmatch                " Cursor shows matching ) and }
set showmode                 " Show current mode
set backspace=2              " make backspace work like most other apps
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
set list listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
hi NonText ctermfg=8 guifg=gray
set t_Co=256
" colorscheme distinguished    " set colorscheme
" colorscheme molokai            " set colorscheme
"
" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" disable sound on errors
set noeb vb t_vb=

" Hide toolbar and scrollbars in MacVim
set guioptions-=T
set guioptions-=L
set guioptions-=r

" add spell checking and automatic wrapping at the
" recommended 72 columns to you commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" to move effeciently between splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" encoding settings
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" status line {
set laststatus=2

" --- PowerLine
let g:Powerline_symbols = 'fancy' " require fontpatcher

" --- vim-gitgutter
let g:gitgutter_enabled = 1
highlight clear SignColumn " For the same appearance as your line number column

" --- ctrlp
let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_show_hidden = 1
