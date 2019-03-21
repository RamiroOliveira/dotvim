set nocompatible
set encoding=utf-8

" To disable a plugin, add it's bundle name to the following list
" let g:pathogen_disabled = []
" call add(g:pathogen_disabled, 'vim-syntax-extra')

execute pathogen#infect("bundle/{}", "~/.vimplugins/{}")
syntax on

"indentation
filetype plugin indent on
map <F7> mzgg=G`z

let g:completor_python_binary = '/usr/bin/python3'
let g:completor_clang_binary = '/usr/bin/clang'

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
nnoremap <silent> <leader>l :LinuxCodingStyle<cr>
let g:linuxsty_patterns = [ "/usr/src/", "/linux" ]

" ESC commands for putty
map <ESC>[D <C-Left>
map <ESC>[C <C-Right>
map! <ESC>[D <C-Left>
map! <ESC>[C <C-Right>

"Toggle set list
:map <F3> <nop>
:map! <F3> <nop>
noremap <F3> :set list!<CR>
set listchars+=space:·

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
set tags=./tags;
noremap <Leader>t :!ctags-proj.sh<CR>

" Tab Navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

"Clang
:noremap <Leader>f :ClangFormat<CR>

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

if has('gui_running')
  set guifont=Ubuntu\ Mono\ 16
endif


"C++

" Highlighting of class scope is disabled by default. To enable set
let g:cpp_class_scope_highlight = 1

" Highlighting of member variables is disabled by default. To enable set
let g:cpp_member_variable_highlight = 1

" Highlighting of class names in declarations is disabled by default. To enable set
let g:cpp_class_decl_highlight = 1

" There are two ways to highlight template functions. Either
" let g:cpp_experimental_simple_template_highlight = 1
" which works in most cases, but can be a little slow on large files. Alternatively set
let g:cpp_experimental_template_highlight = 1
" which is a faster implementation but has some corner cases where it doesn't work.


" Highlighting of library concepts is enabled by
let g:cpp_concepts_highlight = 1

" Highlighting of user defined functions can be disabled by
let g:cpp_no_function_highlight = 1

"Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["c","h","cpp"] }


" Automatically open, but do not go to (if there are errors) the quickfix /
" " location list window, or close it when is has become empty.
" "
" " Note: Must allow nesting of autocmds to enable any customizations for
" quickfix
" " buffers.
" " Note: Normally, :cwindow jumps to the quickfix window if the command opens
" it
" " (but not if it's already open). However, as part of the autocmd, this
" doesn't
" " seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


" Python Stuff
"Enable folding
 
set foldmethod=indent
set foldlevel=99

"Python BP
nnoremap <F8> :TogglePudbBreakPoint<CR>
inoremap <F8> <ESC>:TogglePudbBreakPoint<CR>a
