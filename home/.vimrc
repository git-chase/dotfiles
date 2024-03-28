"
" Plugins

call plug#begin()

" Provides IDE like abilities for C#.
" After installing, open a .cs file in a solution and :OmniSharpInstall.
Plug 'OmniSharp/omnisharp-vim'

" Linting and LSP.
Plug 'dense-analysis/ale'

" Fuzzy finder.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Auto-completion.
" Before installing, sudo apt install nodejs.
" Before installing, sudo apt install npm.
" After installing, :CocInstall coc-omnisharp
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File system explorer.
" Plug 'preservim/nerdtree'

" Color scheme.
Plug 'gruvbox-community/gruvbox'

" Sensible defaults.
Plug 'tpope/vim-sensible'

" Markdown functionality.
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Statusline.
Plug 'itchyny/lightline.vim'

" Language packs.
Plug 'sheerun/vim-polyglot'

" Tokyo Night theme
Plug 'ghifarit53/tokyonight-vim' 

"Plug 'vimwiki/vimwiki'

call plug#end()

"
" ALE

" Limit ALE to only use OmniSharp (recommended, but not necessary).
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

"
" Gruvbox

"set background=dark
"colorscheme gruvbox

"
"Tokyo Night
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

"
" Lightline

set noshowmode " Hide the "-- INSERT --" line.

"
" vimwiki

"let g:vimwiki_list = [{'path': '~/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]

"
" CoC

autocmd FileType markdown let b:coc_suggest_disable = 1

"
" OmniSharp

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

"
" Misc

set tabstop=4 softtabstop=4 " Tabs are four columns long.
set shiftwidth=4 " Indentions are four columns long.
set expandtab " Replace tabs with spaces.
set smartindent " Indent based on syntax.
set breakindent " Wrapped lines will be indented to match beginning of line
set linebreak " Wrap lines intelligently (don't break words in half, don't start lines on whitespace)

set number " Show line numbers.
set incsearch " Search as term is being typed.
set noerrorbells " Turn off bells.
set belloff=all " Turn off bells.
set hidden " Allow switch buffers without saving.

" Prevent ESC delay (like when switching from insert mode to normal mode).
set ttimeout " Time out for key codes.
set ttimeoutlen=20 " Wait up to 20ms after ESC for special key.

" Add vertical line at column 120.
set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

nnoremap <space> <nop>
let mapleader = " " " Set leader key.
nnoremap <leader>f :Files<cr>
inoremap jk <esc>

nnoremap <leader>tp :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>

"
" Markdown specific

autocmd BufRead,BufNewFile *.md setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

set autoread
au CursorHold * checktime

