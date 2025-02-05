autocmd VimEnter * execute "normal i"
autocmd BufEnter *.hack :syntax sync fromstart
autocmd BufEnter *.todo.md :syntax match GruvboxRed /^\s*x.*/ | syntax match GruvboxGreenBold /^\s*\<[A-Z]\+\>/ | syntax match GruvboxYellow /^\s*\*.*/ | syntax match GruvboxOrange /^\s*\-.*/
autocmd TermOpen * startinsert
autocmd TermClose * call nvim_input('<CR>')

" keep zf folds after quitting and reopening file
" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave ?* mkview
"   autocmd BufWinEnter ?* silent! loadview
" augroup END

filetype plugin indent on

" set tab spacing to 2
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype css setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype html setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype cpp setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype c setlocal ts=2 sw=2 sts=0 expandtab

" set tab spacing to 4
autocmd Filetype java setlocal ts=4 sw=4 sts=0 expandtab

syntax on
set belloff=esc,error,wildmode
set tabstop=4
set softtabstop=4
set whichwrap+=<,>,h,l
set shiftwidth=4
set clipboard=unnamed
set mouse=a
set completeopt=menuone,longest
set backspace=indent,eol,start
set foldmethod=manual
set expandtab
set smartindent
set autoindent
set nowrap
set smartcase
set noswapfile
set showmode
set incsearch
set nohlsearch
set ignorecase
set cursorline
set autochdir
set number
" set scrolloff=3
" set showcmd

set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

let &t_SI.="\e[6 q" " INSERT mode
let &t_EI.="\e[2 q" " NORMAL mode
let &t_SR.="\e[4 q" " REPLACE mode
" 1 -> blinking block
" 2 -> solid block 
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'kshenoy/vim-signature'
Plug 'junegunn/goyo.vim'
Plug 'hhvm/vim-hack'
Plug 'aserebryakov/vim-todo-lists'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-airline/vim-airline'
Plug 'luochen1990/rainbow'
call plug#end()

colorscheme gruvbox
set background=dark

" netrw stuff
let g:netrw_banner = 0
let g:netrw_winsize = 75
let g:netrw_keepdir = 0
let g:netrw_altv = 1
let g:netrw_list_hide = 'Icon'

" goyo stuff
let g:goyo_width = 100
let g:goyo_height = 85

" vim-todo-lists plugin stuff
let g:VimTodoListsUndoneItem = '☐'
let g:VimTodoListsDoneItem = '✓'
let g:VimTodoListsMoveItems = 0
let g:VimTodoListsCustomKeyMapper = 'VimTodoListsCustomMappings'

" use ripgrep as default for fzf search
let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'

" use tab and s-tab to iterate through coc snippets
" this block must be above the block below 'coc popup list...' because the tab
" mappings get messed up otherwise
inoremap <expr> <TAB> coc#jumpable() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" always enabling rainbow parentheses
let g:rainbow_active = 1

"coc popup list selection stuff
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<TAB>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"coc autocomplete search highlight colorscheme
hi CocSearch ctermfg=109

" leader key
let mapleader = " "

" auto closing brackets
inoremap {<CR> {<CR>}<Esc>O

" auto surround highlighted text
" places cursor on closing character
vnoremap ( <ESC>`>a)<ESC>`<i(<ESC>`>2l
vnoremap ) <ESC>`>a)<ESC>`<i(<ESC>`>2l
vnoremap { <ESC>`>a}<ESC>`<i{<ESC>`>2l
vnoremap } <ESC>`>a}<ESC>`<i{<ESC>`>2l
vnoremap [ <ESC>`>a]<ESC>`<i[<ESC>`>2l
vnoremap ] <ESC>`>a]<ESC>`<i[<ESC>`>2l
vnoremap < <ESC>`>a><ESC>`<i<<ESC>`>2l
vnoremap > <ESC>`>a><ESC>`<i<<ESC>`>2l
vnoremap " <ESC>`>a"<ESC>`<i"<ESC>`>2l
vnoremap ' <ESC>`>a'<ESC>`<i'<ESC>`>2l
vnoremap <SPACE><SPACE> <ESC>`>a<SPACE><ESC>`<i<SPACE><ESC>`>2l

" movement between screens
nnoremap <Leader>H :wincmd h<CR>
nnoremap <Leader>L :wincmd l<CR>
nnoremap <Leader>K :wincmd k<CR>
nnoremap <Leader>J :wincmd j<CR>

" moving screens
nnoremap <C-h> :wincmd H<CR>
nnoremap <C-l> :wincmd L<CR>
nnoremap <C-k> :wincmd K<CR>
nnoremap <C-j> :wincmd J<CR>

" creating new window
nnoremap <Leader>\| :wincmd v<CR>
nnoremap <Leader>_ :wincmd s<CR>

" mimics command + arrow keys
nnoremap <Leader>h ^
nnoremap <Leader>l $
nnoremap <Leader>k gg
nnoremap <Leader>j G
vnoremap <Leader>h ^
vnoremap <Leader>l $
vnoremap <Leader>k gg
vnoremap <Leader>j G

" resizing screens
nnoremap <Leader>= :wincmd =<CR>
nnoremap <Leader>> :wincmd ><CR>
nnoremap <Leader>< :wincmd <<CR>
nnoremap <Leader>+ :wincmd +<CR>
nnoremap <Leader>- :wincmd -<CR>

" tab stuff
nnoremap tt :tab split<CR>
nnoremap th :tabp<CR>
nnoremap tl :tabn<CR>

" opens netrw side window to left
nnoremap <Leader>n :Lex <Bar> 
        \ :vertical resize 30<CR>

" toggles terminal window at bottom pane
nnoremap <Leader>t :call ToggleTerminalWindowPane()<CR>

" open undo tree
nnoremap <Leader>u :UndotreeToggle<CR>

" moving lines of code
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==

" moving blocks of code
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" indenting code with tab
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" making Y match D and C
nnoremap Y y$

" modify whole doc
nnoremap <Leader>y mzggVGy`zdmzzz
nnoremap <Leader>p ggVGp

" command remappings for common mistyping
command W write
command Q quit
command Wq write | quit
command WQ write | quit

" press esc in terminal mode to enter 'normal mode'
tnoremap <esc><esc> <C-\><C-N>

" toggle wrap mode
nnoremap <Leader>w :call ToggleWrapMode()<CR>

" switch to previously opened file
nnoremap <Leader>` <C-^>

" fzf file finder
nnoremap <Leader>f :Files<CR>

" fzf buffer finder
nnoremap <Leader>b :Buffers<CR>

" using alt key will send escape character. Adding these lines will remove the esc
let &t_TI = ""
let &t_TE = ""

" map dymga raise special df keys to move backward and forward a buffer
nnoremap <A-b> :call SkipTerminalBuffers('bp')<CR>
nnoremap <A-f> :call SkipTerminalBuffers('bn')<CR>

" airline stuff
let g:airline#extensions#tabline#enabled = 1

" mapping to iterate through buffers while skipping terminal buffers
command Bn call SkipTerminalBuffers('bn')
command BN call SkipTerminalBuffers('bn')
command Bp call SkipTerminalBuffers('bp')
command BP call SkipTerminalBuffers('bp')

" CocAction code action stuff
nnoremap <Leader>. <Plug>(coc-fix-current)

" mapping :E to :Explore
command E Explore

" L and H to navigate buffers
nnoremap L :bn<CR>
nnoremap H :bp<CR>

" W to delete buffer
nnoremap W :bd<CR>

" save and clean todo file
command Ts call SaveAndCleanTodoFile()

" ***************************************************************************
" ******************************** FUNCTIONS ********************************
" ***************************************************************************

function! ToggleWrapMode()
    if mapcheck("j") == "" 
        exec "set wrap"
        exec "nnoremap j gj"
        exec "nnoremap k gk"
        exec "vnoremap j gj"
        exec "vnoremap k gk"
        exec "nnoremap <Leader>h g^"
        exec "nnoremap <Leader>l g$"
        exec "vnoremap <Leader>h g^"
        exec "vnoremap <Leader>l g$"
        exec "nnoremap A g$a"
        exec "nnoremap I g^i"
        exec "nnoremap dd g^vg$d"
        exec "nnoremap yy g^vg$y"
        exec "nnoremap V g^vg$"
        echo "WrapMode enabled"
    else
        exec "set nowrap"
        unmap j
        unmap k
        exec "nnoremap <Leader>h ^"
        exec "nnoremap <Leader>l $"
        exec "vnoremap <Leader>h ^"
        exec "vnoremap <Leader>l $"
        unmap A
        unmap I
        unmap dd
        unmap yy
        unmap V
        echo "WrapMode disabled"
    endif
endfunction

function! VimTodoListsCustomMappings()
  nnoremap <Leader><Leader> :VimTodoListsToggleItem<CR>
  vnoremap <Leader><Leader> :VimTodoListsToggleItem<CR>
  nnoremap j j
  nnoremap <Leader>o :VimTodoListsCreateNewItemBelow<CR>
  nnoremap <Leader>O :VimTodoListsCreateNewItemAbove<CR>
endfunction

function! DeleteCheckLines()
    silent! execute 'g/^\s*✓/d'
endfunction

function! SaveTodoFile()
    let l:date = strftime('%Y-%m-%d')
    let l:folder = '/Users/jerry/Desktop/misc/todolist logs'
    let l:newfile = l:folder . '/' . l:date . '.todo.md'
    execute 'write! ' . fnameescape(l:newfile)
endfunction

function! SaveAndCleanTodoFile()
    call SaveTodoFile()
    call DeleteCheckLines()
endfunction

function! ToggleTerminalWindowPane()
  if TerminalBufExists() == 1
    let terminalBufNum = GetTerminalBufNum()
    let windowNumDisplayingTerminalBufNum = bufwinnr(terminalBufNum)
    if windowNumDisplayingTerminalBufNum == -1
        botright split
        horizontal resize 10
        execute "buffer " . terminalBufNum
        startinsert
    else
      execute windowNumDisplayingTerminalBufNum . "wincmd w"
      hide
    endif
  else
    botright split
    horizontal resize 10
    terminal
  endif
endfunction

function! GetTerminalBufNum()
  for bufNum in range(1, bufnr('$'))
    if getbufvar(bufNum, '&buftype') == 'terminal'
      return bufNum
    endif
  endfor
endfunction

function! TerminalBufExists()
  let terminalBufNum = 0 
  for bufNum in range(1, bufnr('$'))
    if getbufvar(bufNum, '&buftype') == 'terminal'
      return 1
    endif
  endfor
  return 0
endfunction

function! SkipTerminalBuffers(direction)
  if a:direction == "bn"
    bn
  elseif a:direction == "bp"
    bp
  endif
  let targetBufNum = bufnr('%')
  while buflisted(targetBufNum) && getbufvar(targetBufNum, '&buftype') == 'terminal'
    if a:direction == "bn"
      bn
    elseif a:direction == "bp"
      bp
    endif
    let targetBufNum = bufnr('%')
  endwhile
endfunction
