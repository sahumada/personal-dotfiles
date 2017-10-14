" ~/.vimrc (configuration file for vim only)

syntax enable                                              " enable syntax highlighting

set nocompatible
filetype off

highlight ColorColumn ctermbg=3 guibg=gray
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
highlight StatusLine ctermfg=15 ctermbg=4 cterm=bold
highlight TrailingWhitespace ctermbg=darkgreen guibg=darkgreen

set autoread                                               " set to auto read when a file is changed from the outside
set background=dark                                        " use the right colors
set backspace=indent,eol,start                             " sane backspace
set clipboard=unnamed
set colorcolumn=100
set encoding=utf8                                          " set utf8 as standard encoding and en_US as the standard language
set history=700                                            " sets how many lines of history VIM has to remember
set hlsearch incsearch ignorecase smartcase                " search
set langmenu=en_US.UTF-8
set laststatus=2                                           " always show the status line
set linebreak
set pastetoggle=<F2>                                       " toggle auto-indenting for code paste
set ruler                                                  " always show current position
set tabstop=4 textwidth=100 shiftwidth=4                   " 1 tab == 4 spaces
set smarttab                                               " be smart when using tabs ;)
set statusline=\ %r%{getcwd()}%h\/%f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l/%L][%v][%p%%]\ %)
set wildmenu                                               " turn on the WiLd menu
set wildignore=*.o,*~,*.pyc                                " ignore compiled files
"set ai " auto indent
"set si " smart indent
"set number " show line numbers
set nowrap " wrap lines

filetype off
filetype indent plugin on                                  " auto indent

nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR> " remove trailing whitespaces
nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\r$//e<Bar>:let @/=_s<Bar>:nohl<CR>   " remove windows line endings ^M

noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

vnoremap < <gv " better indentation - easy moving of code blocks
vnoremap > >gv " better indentation - easy moving of code blocks

" with a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

match TrailingWhitespace /\s\+$/

" commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '

" use spaces instead of tabs
autocmd BufRead,BufNewFile *.c,*.config,.coveragerc,*.css,*.h,*.html,*.inc,*.ini,*.java set expandtab
autocmd BufRead,BufNewFile *.json,*.php,*.pl,*.pm,*.py,*.sh,*.t,*.xml,COMMIT_EDITMSG set expandtab

autocmd FileType gitcommit setlocal spell spelllang=en_us textwidth=72 colorcolumn=72
autocmd BufRead,BufNewFile *.py setlocal spell spelllang=en_us
"autocmd FileType tex setlocal spell spelllang=en_us
"autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=es

autocmd BufRead,BufNewFile *.qs setfiletype javascript     " associate *.qs with javascript filetype

autocmd TabEnter * :match TrailingWhitespace /\s\+$/
" ~/.vimrc ends here
