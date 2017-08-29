" ~/.vimrc (configuration file for vim only)

syntax enable                                              " Enable syntax highlighting

highlight ColorColumn ctermbg=3
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
highlight StatusLine ctermfg=15 ctermbg=4 cterm=bold
highlight TrailingWhitespace ctermbg=darkgreen guibg=darkgreen

set background=dark                                        " use the right colors
set backspace=indent,eol,start                             " sane backspace
set colorcolumn=100
set encoding=utf8                                          " Set utf8 as standard encoding and en_US as the standard language
set hlsearch incsearch ignorecase smartcase                " search
set linebreak
set laststatus=2                                           " always show the status line
set pastetoggle=<F2>                                       " toggle auto-indenting for code paste
set tabstop=4 textwidth=100 shiftwidth=4                   " 1 tab == 4 spaces
set statusline=\ %r%{getcwd()}%h\/%f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l/%L][%v][%p%%]\ %)

filetype off
filetype plugin indent on                                  " auto indent

nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR> " remove trailing whitespaces
nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\r$//e<Bar>:let @/=_s<Bar>:nohl<CR>   " remove windows line endings ^M

noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

match TrailingWhitespace /\s\+$/
autocmd TabEnter * :match TrailingWhitespace /\s\+$/

" Use spaces instead of tabs
autocmd BufRead,BufNewFile *.c,*.css,.gitconfig,*.h,*.html set expandtab
autocmd BufRead,BufNewFile *.java,*.py,*.tex,*.xml,*.xsl set expandtab

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
" ~/.vimrc ends here
