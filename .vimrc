call pathogen#infect()

let g:solarized_contrast="high"    "default value is normal

syntax on

filetype plugin indent on
set modeline
set modelines=5

" keep 3 lines above and below when scrolling
set scrolloff=3

" insert a dollar sign for 'c' operations
set cpoptions+=$

" marking wrapped lines
set showbreak =☠☠☠☠\ 
set cpoptions+=n

" Shortcut to rapidly toggle `set list`
      
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" setting up grep.vim plugin
" settings directories to exclude
let Grep_Skip_Dirs = 'RCS CVS SCCS .git log'
let Grep_Skip_Files = 'tags'
" do not grep-ing binary files
let Grep_Default_Options='-I'

" visual selection on tabbing
set wildmenu
set wildmode=longest:full,full
" don't select via left/right arrows
cnoremap <Left> <Space><BS><Left>
cnoremap <Right> <Space><BS><Right>

" setting line numbers
set number
map <silent> <F2> :NERDTreeToggle<CR>

" tabbing stuff
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

" non working macro editing todo tags
imap \q <Esc>$o#TODO<Esc>A<SPACE>
map \q <Esc>$o#TODO<Esc>A<SPACE>
imap \w <Esc>:grep --exclude=*~ TODO * <CR> :copen <CR>
map \w :grep --exclude=*~ TODO * <CR> :copen <CR>


" mapping usefull and badly typable commands
"map ö [
"map ä ]
map öö <C-[>
map ää <C-]>
map <k7> <C-[>
map <k8> <C-]>

" statusbar stuff
set laststatus=2

" workaround for help
map <F12> <F1>

" usefull mapping for git diff
map <F11> :qa<CR>

"taglist browser toggle
map <F3> :TlistToggle<CR>
" taglist opens on right hand side
let Tlist_Use_Right_Window=1

" default font setting
set guifont=Monospace\ 9

" ctags shortcut
" don't use this
map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>

" Set the status line the way i like it
set stl=%f\ %m\ %r%{fugitive#statusline()}\ %=Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" set correct ruby stuff
"au FileType ruby setl sw=2 sts=2 ts=2 et

" easier moving between windows
noremap <silent> ¿ :wincmd<SPACE>h<CR>
noremap <silent> <k4> :wincmd<SPACE>j<CR>
noremap <silent> <k5> :wincmd<SPACE>k<CR>
noremap <silent> <k6> :wincmd<SPACE>l<CR>
noremap <silent> <k1> :wincmd<SPACE>c<CR>
noremap <silent> <k2> :wincmd<SPACE>s<CR>
noremap <silent> <k3> :wincmd<SPACE>v<CR>
noremap <silent> <C-F9> :vertical resize -10<CR>
noremap <silent> <C-F12> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F10> :vertical resize +10<CR>

"if has("gui_running")
  colorscheme solarized
  "set columns=120
  "set lines=80
  set go-=T
  set go-=l
  set go-=r
  set go-=R
  set go-=L
  set go-=m

  " setting 256 colors
  set t_Co=256
  "set t_AB=<Esc>[48;5;%dm
  "set t_AF=<Esc>[38;5;%dm
  "set background=dark
  set background=light
"else
"  set background=light
"endif

" set scroll_factor for smooth scrolling (default: 500)
" let g:scroll_factor=500

" Smooth Scrolling
nnoremap <c-d> :call DelayedFunc("normal! gjzz",winheight(".")/2-1,5)<cr>
nnoremap <c-u> :call DelayedFunc("normal! gkzz",winheight(".")/2-1,5)<cr> 

func! DelayedFunc(cmd,...)
    " cmd , iter , delay
    let iter=10
    let delay=20
    if a:0 == 2
        let iter = a:1
        let delay = a:2
    endif
    let i = 0
    " first section
    let ot = iter/5*4
    let start = range(100,0,eval(-100/(ot-1)))
    " second section
    let tt = iter - ot
    let end = range(0,100,eval(100/(tt-1)))
    " list of speeds
    let speed = start + end
    if a:cmd != ""
        while i < iter
            execute a:cmd
            try
                exec "sleep " . eval(delay*speed[i]/100) . "m"
            catch *
            endtry
            let i = i + 1
            redraw
        endwhile
    endif
endfunc

" configure api_dock plugin
let g:ruby_doc_ruby_mapping='KK'
let g:ruby_doc_rspec_mapping='KH'
let g:ruby_doc_rails_mapping='KJ'

" configure highlighting of wildmenu
highlight WildMenu guifg=Yellow
highlight WildMenu guibg=Black

" trying to get rvm to work
"silent !rvm reload

" set highlighting of search results
set hlsearch
" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

" highlight the current line
set cursorline

" perform case insensitive searches by default
set ignorecase

" making completion a bit easier
"inoremap  
"inoremap  
"inoremap  
"inoremap  

