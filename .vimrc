" ~/.vimrc (configuration file for vim only)

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
set incsearch

" ------------------------------------------------------------------------------
" => Colors and Fonts
" ------------------------------------------------------------------------------
" Enable syntax highlighting
syntax enable

" use the right colors
"colorscheme desert
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Try the following if your GUI uses a dark background.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

" ------------------------------------------------------------------------------
" => Text, tab and indent related
" ------------------------------------------------------------------------------

" Use spaces instead of tabs
"autocmd FileType css set noexpandtab
autocmd BufRead,BufNewFile *.c,*.css,.gitconfig,*.h,*.html,*.java,*.py,*.tex,*.xml,*.xsl set expandtab

" 1 tab == 4 spaces
set shiftwidth=4 tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

" auto indent
filetype off
filetype plugin indent on

" Highlight Trailing Space
highlight TrailingWhitespace ctermbg=darkgreen guibg=darkgreen
match TrailingWhitespace /\s\+$/
au TabEnter * :match TrailingWhitespace /\s\+$/

" remove trailing whitespaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" remove windows line endings ^M
nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\r$//e<Bar>:let @/=_s<Bar>:nohl<CR>


" ------------------------------------------------------------------------------
" => Status line
" ------------------------------------------------------------------------------
" Always show the status line
set laststatus=2
hi StatusLine ctermfg=15 ctermbg=4 cterm=bold

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ Line:\ %l\ \ Col:\ %c


" ------------------------------------------------------------------------------
" Toggle auto-indenting for code paste
" ------------------------------------------------------------------------------
set pastetoggle=<F2>

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
" ~/.vimrc ends here
