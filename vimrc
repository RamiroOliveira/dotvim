set nocompatible
set encoding=utf-8

" To disable a plugin, add it's bundle name to the following list
" let g:pathogen_disabled = []
let g:pathogen_blacklist = []
" call add(g:pathogen_disabled, 'syntastic', 'completor.vim')

execute pathogen#infect("bundle/{}", "~/.vimplugins/{}")
syntax on

"indentation
filetype plugin indent on
map <F7> mzgg=G`z

"Colorscheme
" let PaperColor_Theme_Options = {
"   \   'language': {
"   \     'python': {
"   \       'highlight_builtins' : 1
"   \     },
"   \     'cpp': {
"   \       'highlight_standard_library': 1
"   \     },
"   \     'c': {
"   \       'highlight_builtins' : 1
"   \     }
"   \   }
"   \ }"Colorscheme
set number
colorscheme PaperColor
set laststatus=2
set t_Co=256
set noshowmode
set mouse=a

" Save as Ctrl-s
nnoremap <C-s> :w<CR>  

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


"NERD Tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>


if has('gui_running')
  set guifont=Ubuntu\ Mono\ 16
endif



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
nnoremap <F9> :TogglePudbBreakPoint<CR>
inoremap <F9> <ESC>:TogglePudbBreakPoint<CR>a



"" Sample command W
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"" GIT blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

"" Tagbar
nmap <F8> :TagbarToggle<CR>

"" Json
let g:tagbar_type_json = {
    \ 'ctagstype' : 'json',
    \ 'kinds' : [
      \ 'o:objects',
      \ 'a:arrays',
      \ 'n:numbers',
      \ 's:strings',
      \ 'b:booleans',
      \ 'z:nulls'
    \ ],
  \ 'sro' : '.',
    \ 'scope2kind': {
    \ 'object': 'o',
      \ 'array': 'a',
      \ 'number': 'n',
      \ 'string': 's',
      \ 'boolean': 'b',
      \ 'null': 'z'
    \ },
    \ 'kind2scope': {
    \ 'o': 'object',
      \ 'a': 'array',
      \ 'n': 'number',
      \ 's': 'string',
      \ 'b': 'boolean',
      \ 'z': 'null'
    \ },
    \ 'sort' : 0
    \ }

""Makefile
let g:tagbar_type_make = {
            \ 'kinds':[
                \ 'm:macros',
                \ 't:targets'
            \ ]
	    \}


"" Rust


" let g:rustfmt_autosave = 1
noremap <C-f> :RustFmt<CR>
let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/usr/local/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
  \ }

""Robot
let g:tagbar_type_robot= {
            \ 'ctagstype' : 'robot',
            \ 'kinds'     : [
            \'t:testcases',
            \'k:keywords',
            \'v:variables'
  \]
  \}

"
"" YouCompleteMe options
"
set completeopt+=longest,popup

let g:Show_diagnostics_ui = 1 "default 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_auto_hover = 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_confirm_extra_conf = 1
let g:ycm_echo_current_diagnostic = 'virtual-text'
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_semantic_highlighting=1
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_global_ycm_extra_conf = '/home/roliveir/.ycm_extra_conf.py'
let g:ycm_goto_buffer_command = 'new-tab' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_max_diagnostics_to_display = 30
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
let g:ycm_path_to_python_interpreter = '' "default ''
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:ycm_server_log_level = 'info' "default info
let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_show_detailed_diag_in_popup=1
let g:ycm_show_diagnostics_ui = 1
nmap <leader>D <plug>(YCMHover)


" nnoremap <C-LeftMouse> <LeftMouse>:YcmCompleter GoTo<CR>
nnoremap <C-LeftMouse> <LeftMouse>:YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-G> :YcmGenerateConfig <CR>

function! s:CustomizeYcmQuickFixWindow()
  " Move the window to the top of the screen.
  wincmd K
  " Set the window height to 5.
  5wincmd _
endfunction

autocmd User YcmQuickFixOpened call s:CustomizeYcmQuickFixWindow()

"Color Coded
"
let g:color_coded_enabled = 1
nnoremap <C-C> :CCGenerateConfig <CR>
