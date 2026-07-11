call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'junegunn/goyo.vim'

call plug#end()

" Settings
set linebreak
set clipboard=unnamedplus
set noswapfile

" Keybindings
nnoremap j gj
nnoremap k gk
nnoremap <leader>w :w<cr>
nnoremap <leader>g :Goyo<cr>
nnoremap <leader>c :center<cr>
nnoremap <leader>p "+p<cr>
vnoremap <leader>y "+y<cr>

" Word count
function! WordCount() abort
  let l:wc = wordcount()
  let l:words = get(l:wc, 'words', 0)
  if has_key(l:wc, 'visual_words')
    return 'wc: ' . l:wc.visual_words . ' / ' . l:words 
  endif
  return 'wc: ' . l:words 
endfunction

set laststatus=2
set history=10000
set expandtab
set wildmenu
set undodir=/tmp/.vim-undo-dir
set undofile

" Status line
set statusline=
set statusline +=\ [%n]\ %*            "buffer number
set statusline +=\ %<%F%*            "full path
set statusline +=%m%*                "modified flag

set statusline+=%=%{WordCount()}
set statusline +=%=%5l%*             "current line
set statusline +=/%L%*               "total lines
set statusline +=%4v\ %*             "virtual column number
set statusline +=0x%04B\ %*          "character under cursor

" text files (fiction and poetry focused)
"
autocmd BufRead,BufNewFile   *.txt setlocal textwidth=64

