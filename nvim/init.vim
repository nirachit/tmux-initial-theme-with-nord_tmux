scriptencoding utf-8
" To install nvim on ubuntu:
" sudo apt-get install software-properties-common
" sudo add-apt-repository ppa:neovim-ppa/unstable
" sudo apt-get update
" sudo apt-get install neovim
" sudo apt-get install python-dev python-pip python3-dev python3-pip
" sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
" sudo update-alternatives --config vi
" sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
" sudo update-alternatives --config vim
" sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
" sudo update-alternatives --config editor
"
" Then when running neovim the first time, run ":PlugInstall"

" Python paths
" pip2 install --user neovim
" pip3 install --user neovim

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

call plug#begin('~/.config/nvim/plugged')
" vim plug airline
" Plug 'https://github.com/vim-airline/vim-airline.git'

" Line up a certain character in each line
Plug 'https://github.com/junegunn/vim-easy-align.git'

" A git UI plugin
Plug 'https://github.com/tpope/vim-fugitive.git'

" Pop-up file manager
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'

" NERDTree {

  " NERDTree icon for vim
  " NERDTree syntax Highlight
  Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight.git'
  let g:NERDTreeFileExtensionHighlightFullName = 1
  let g:NERDTreeExactMatchHighlightFullName = 1
  let g:NERDTreePatternMatchHighlightFullName = 1

  let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
  let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

  " Map F2 to NERDTreeToggle
  map <F2> :NERDTreeToggle<CR>
  map <C-d> :NERDTreeFocus<CR>

  set encoding=UTF-8
  let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "*",
      \ "Staged"    : "+",
      \ "Untracked" : "-",
      \ "Renamed"   : "/",
      \ "Unmerged"  : "=",
      \ "Deleted"   : "x",
      \ "Dirty"     : "*",
      \ "Clean"     : "`",
      \ "Unknown"   : "?"
      \ }

  let g:NERDTreeIgnore = ['\.pyc$', '\.o$', '\.lib$', '\.a$', '\.dll$', '\.so$', '\.so\.', '\.dylib$', '\.exe$', '\.out$', '\.app$', '\.stackdump$']
" }

" Colour scheme
"Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/frankier/neovim-colors-solarized-truecolor-only.git'

" Add quotes, html tags, etc. around something
Plug 'https://github.com/tpope/vim-surround.git'

" Commenting/uncommenting stuff
Plug 'https://github.com/tpope/vim-commentary.git'

" Consistent editing styles (indent, etc)
Plug 'https://github.com/editorconfig/editorconfig-vim.git'

" Lets you refactor multiple things with ctrl-n
Plug 'terryma/vim-multiple-cursors'

" Open a file to a specific line with 'vim file:line'
Plug 'bogado/file-line'


" Fast fuzzy searching {

  Plug 'junegunn/fzf', { 'dir': '~/.config/fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  nnoremap <C-p> :FZF <CR>
  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
    \}
" }

" whitespace {

  " Deal with trailing whitespace 
  Plug 'ntpeters/vim-better-whitespace'
  map <leader>s :StripWhitespace<CR>
" }

" Indent {

  " Highlight indent levels
  Plug 'nathanaelkane/vim-indent-guides'
  map <C-I> :IndentGuidesToggle<cr>
" }

" Let the '.' command work with other plugins
Plug 'tpope/vim-repeat'

" Colour scheme
Plug 'chriskempson/base16-vim'

" Asynchronous support
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Deoplete {

  " Asynchronous auto-complete
  " See: https://github.com/Shougo/deoplete.nvim/blob/master/doc%2Fdeoplete.txt
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi'
  let g:deoplete#enable_at_startup = 1
  set completeopt+=preview,
  highlight PmenuSel guifg=white guibg=#44cb48
  highlight Pmenu guifg=white guibg=#4b6fff
" }

" Airline {

  " Fancy status bar
  " I *think* this causes serious slowdown, so I'm disabling for now
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'

  "" Buffer nav
  noremap <leader>[ :bp<CR>
  noremap <leader>] :bn<CR>

  "" Close buffer
  noremap <leader>- :bd<CR>
" }

" Syntax checking
"Plug 'scrooloose/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_rust_checkers = ['cargo']

" Asynchronous Lint Engine
" $ rustup component add rls-preview rust-analysis rust-src
" $ gem install rubocop
Plug 'w0rp/ale'
let g:ale_completion_enabled = 1


" Lint
"Plug 'ynkdir/vim-vimlparser'
"Plug 'syngan/vim-vimlint'

" Gist
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

" Jump to a specific character
Plug 'easymotion/vim-easymotion'
" vim-terminal {

  " Better :terminal commands
  Plug 'mklabs/split-term.vim'
  set splitright
  set splitbelow
  let g:disable_key_mappings = 1
  let g:split_term_vertical = 1
" }

" Ruby {

  " Fix lag in Ruby
  Plug 'vim-ruby/vim-ruby'
  let ruby_no_expensive=1
  let g:ruby_no_expensive=1
" }

" Syntax highlighting
Plug 'mustache/vim-mustache-handlebars'
Plug 'dag/vim-fish'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'sheerun/vim-polyglot'
let g:mustache_abbreviations = 1

Plug 'ryanoasis/vim-devicons'
call plug#end()

" Colours
set termguicolors
set background=dark

" groups of letters with dashes as words
set iskeyword +=-
set binary

" Disable highlight
nnoremap <leader><space> :noh<CR>

" Re-wrap text
nnoremap <leader>j       gqap
nnoremap <leader>w       :set wrap linebreak nolist<CR>
nnoremap <leader>h       :TOhtml<CR>

nnoremap <leader>m       :e ++ff=dos %<CR>

" Set up proper wrapping
set wrap
set linebreak

" Spelling
set spell

" Map <leader>r to NarrowRegion
map <leader>r :NarrowRegion<CR>

" Set backspace to not go beyond the new insert, but to go over autoindent and
" end of lines
" set backspace=eol,indent

" Instead of failing because a file isn't saved, prompt to save the file
set confirm

" Blink instead of beep
set visualbell

" Tabstops
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Smart search
set ignorecase
set smartcase
set number
" Show lines above and below the cursor when scrolling
set scrolloff=4

" Don't automatically comment the next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufNewFile,BufRead *.js.erb set ft=javascript.eruby
autocmd BufNewFile,BufRead *.html.erb set ft=html.eruby
autocmd BufNewFile,BufRead *.html.haml set ft=haml
autocmd BufNewFile,BufRead *.ctp set ft=php.html
autocmd BufNewFile,BufRead *.md set ft=markdown
autocmd BufNewFile,BufRead *.hbs set ft=handlebars.html
autocmd BufNewFile,BufRead *.rss setfiletype xml
autocmd BufNewFile,BufRead .envrc set ft=zsh
autocmd BufNewFile,BufRead .envrc-sample set ft=zsh

" Auto-complete for :commands in vim
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

" Show cursor-position information
set ruler

" Don't add multiple spaces on a join
set nojoinspaces

" Don't scroll all the way left on pgup/pgdn
set nostartofline

" Improved regex
set magic

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
nnoremap <silent> <leader>q gwip

" Make the clipboard work
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

" Disable the mouse
set mouse=c

" Return to the same spot in the file that we were at
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Re-map ctrl-h/j/k/l to move around in normal mode
" nnoremap M-j <C-w>h
" nnoremap M-i <C-w>j
" nnoremap M-k <C-w>k
" nnoremap M-l <C-w>l

" Re-map ctrl-h/j/k/l to move around in terminal mode
" tnoremap M-j <C-\><C-n><C-w>h
" tnoremap M-i <C-\><C-n><C-w>j
" tnoremap M-k <C-\><C-n><C-w>k
" tnoremap M-l <C-\><C-n><C-w>l

" Make ctrl-w escape insert mode
tnoremap <C-w> <C-\><C-n><C-w>
inoremap <C-w> <esc><C-w>

" Let <enter> enter insert mode (helpful for terminals)
nnoremap <return> i

" treat long lines as break lines (useful when moving around in them)
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
nnoremap <up> g<up>
nnoremap <down> g<down>
