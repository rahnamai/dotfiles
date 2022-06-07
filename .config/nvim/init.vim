source /home/rahnamai/.local/share/nvim/site/pack/plugins/start/gruvbox-material/colors/gruvbox-material.vim

" lightline status line
let g:lightline = {
    \ 'colorscheme': 'apprentice',
    \ }

" We don't need to see things like -- INSERT -- anymore
set noshowmode

set nocompatible              " be iMproved, required
filetype off                  " required

" General Settings
set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set t_Co=256                    " Set if term supports 256 colors.
set number relativenumber       " Display line numbers
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
let g:mapleader = "\<Space>"    " Set leader and local leader to Space
let g:maplocalleader = "\<Space>"
syntax enable
let g:rehash256 = 1

" Text, tab and indent related
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.

" Mouse Scrolling
set mouse=nicr
set mouse=a

" Fix Sizing Bug With Alacritty Terminal
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
 
" Other Stuff
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=SauceCodePro\ Nerd\ Font:h15
"set guifont=Mononoki\ Nerd\ Font:h15
"set guifont=JetBrains\ Mono:h15

"let g:neovide_transparency=0.95

" Keybindings
map <Leader>t :tabnew<CR> " Open Tab 

"Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Vifm bindings
map <Leader>v :Vifm<CR>
"map <Leader>vs :VsplitVifm<CR>
"map <Leader>sp :SplitVifm<CR>
"map <Leader>dv :DiffVifm<CR>
"map <Leader>tv :TabVifm<CR>

" Hexokinase (colour preview)
set termguicolors
let g:Hexokinase_highlighters = ['backgroundfull']

" rainbow (used for better distinction via colors)
"set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1

" nvim-compe for auto completion
set completeopt=menuone,noselect

" nvim-compe config
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true

" nvim-compe tab completion 
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ compe#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" nvim-compe mappings
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
