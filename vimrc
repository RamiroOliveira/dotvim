set nocompatible
set encoding=utf-8

" To disable a plugin, add it's bundle name to the following list
" let g:pathogen_disabled = []
" call add(g:pathogen_disabled, 'vim-syntax-extra')

execute pathogen#infect("bundle/{}", "/media/vim/{}")
syntax on
filetype plugin indent on

"Colorscheme
let PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }"Colorscheme
set number
colorscheme PaperColor
set laststatus=2
set t_Co=256
set noshowmode
set mouse=a

" Kernel dev
" 80 characters line
set colorcolumn=81
"execute "set colorcolumn=" . join(range(81,335), ',')
highlight ColorColumn ctermbg=Black ctermfg=Red
" Highlight trailing spaces
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" ESC commands for putty
map <ESC>[D <C-Left>
map <ESC>[C <C-Right>
map! <ESC>[D <C-Left>
map! <ESC>[C <C-Right>

"Toggle set list
:map <F3> <nop>
:map! <F3> <nop>
noremap <F3> :set list!<CR>

" Comments
"Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Tags
set tags=tags;
noremap <Leader>t :!ctags-proj.sh<CR>

" Tab Navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

"Clang
:noremap <Leader>f :ClangFormat<CR>

"YCM
" let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
" Apply YCM FixIt
map <F9> :YcmCompleter FixIt<CR>
" Run YCM generator
:noremap <Leader>y :YcmGenerateConfig<CR>

"Settings for taglist.vim
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=0
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1
nmap <LocalLeader>tt :Tlist<cr>

"NERD Tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" Python
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
