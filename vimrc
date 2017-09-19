set nocompatible
set encoding=utf-8
execute pathogen#infect("bundle/{}", "/media/vim/{}")
syntax on
filetype plugin indent on

"set mouse
set mouse=a

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
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
" Apply YCM FixIt
map <F9> :YcmCompleter FixIt<CR>

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

"Airline
set laststatus=2
set t_Co=256
set noshowmode

if has("gui_running")
  if has("gui_gtk2") || has("gui_gtk3")
      set guifont=Courier\ New\ 14
        elseif has("gui_photon")
    set guifont=Courier\ New:s14
      elseif has("gui_kde")
          set guifont=Courier\ New/14/-1/5/50/0/0/0/1/0
    elseif has("x11")
        set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
      set guifont=Courier_New:h14:cDEFAULT
        endif
endif
