syntax on
filetype plugin indent on
set nocompatible
set number
set path+=**
set encoding=utf-8

set nobackup
set nowritebackup

"vim-Plug Plugins
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'fladson/vim-kitty'
Plug 'honza/vim-snippets'
Plug 'cdelledonne/vim-cmake'

call plug#end()

"Coc settings 
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"coc-extensions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-eslint', 
  \ 'coc-cmake',
  \ 'coc-git',
  \ 'coc-sh',
  \ 'coc-clang-format-style-options',
  \ 'coc-rls',
  \ 'coc-rust-analyzer'
  \ ]

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" === CMake Coc settings === 
let g:cmake_link_compile_commands = 1
let g:cmake_generate_options = ["-DCMAKE_C_COMPILER=clang", "-DCMAKE_CXX_COMPILER=clang++"]
"=== Vim Settings === 
let g:load_doxygen_syntax=1
let g:airline_theme="ayu_mirage"
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
"vim Shortcuts
map <f1> <Esc>:w<Enter>
map <f2> <Esc>:wq<Enter>
map <f3> <Esc>:q!<Enter>

"Addons
map <f4> <Esc>:PlugInstall<Enter>
map <f5> <Esc>:NERDTreeToggle<Enter>

"CMake commands
map <f6> <Esc>:CMakeGenerate<Enter>
map <f7> <Esc>:CMakeBuild --parallel 12<Enter>
map <f8> <Esc>:CMakeClose<Enter>   
map <f9> <Esc>:CMakeClean<Enter>
map <f10> <Esc>:make<Enter>
