echo ">^.^<"
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Если вы используете обычную qwerty, то поменяте mac на win
set keymap=russian-jcukenmac
"Язык ввода при старте Вима - Английский
set iminsert=0
"Аналогично настраивается режим поиска
set imsearch=0


"""""""""""""""""""""""""""""""""""""""
"							 _
"							(_)
"			  _   _  _ _   _
"			 \ \ / /| |  V  |
"			  \ V / | | |v|	|
"			   \_/  | |_| |_|
"  _  __    _    _
" | |/ /   / \  | | _____  __
" | ' /   / _ \ | |/ _ \ \/ /
" | . \  / ___ \| |  __/>  <
" |_|\_\/_/   \_\_|\___/_/\_\
"
"
"
"""""""""""""""""""""""""""""""""""""""""
let mapleader =","

" Some basics:
set clipboard+=unnamedplus
nnoremap c "_c
set nocompatible
filetype plugin on

syntax on
set mouse=a
set ignorecase
set smartcase
set number relativenumber numberwidth=5

" encoding
set encoding=utf-8                                  " set charset translation encoding
set termencoding=utf-8                              " set terminal encoding
set fileencoding=utf-8                              " set save encoding
set fileencodings=utf8,koi8r,cp1251,cp866,ucs-2le   " список предполагаемых кодировок, в порядке предпочтения


set bg=light
set go=a
set nohlsearch

" Tab Settings
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_bootstrap_langs = "python,ruby,html,javascript"
let vim_bootstrap_editor = "nvim"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""------------- * --------------"""
""" Поиск слова под курсором возможен благодаря '*'

"""------------- замена текста --------------"""
""" чтобы видеть происходение, необходимо включить параметр ':set hlsearch'
""" далее: 's/bla-bla-bla/tu-tu-tu
""" или  : 's/bla-bla-bla/tu-tu-tu/g (g) - global - сейчас только по оси Х
""" или  : '%s/bla-bla-bla/tu-tu-tu/g (g) - global - сейчас не только по оси Х, но и по оси Y
""" больше можно узнать в 'vsh - ~/.config/install_system/vim/Documention/Vim-2017.pdf' на странице 283


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" open ~/.Ultisnippets
nnoremap <F8> :tabe ~/.config/nvim//UltiSnips/<CR>:tabm 0<CR>

let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips']
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsExpandTrigger = ";"

"""""""""""""""""""""""""""""""""""""""""""""""""""
"" TODO  YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""
	let g:ycm_server_python_interpreter='python3.9'
	let g:ycm_autoclose_preview_window_after_completion = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""
"" TODO Nerd tree
""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
""" open ....
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" vimling:
	nm <leader>d :call ToggleDeadKeys()<CR>
	imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader>i :call ToggleIPA()<CR>
	imap <leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader>q :call ToggleProse()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""
"" TODO Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>
  nnoremap _ :%s/\s/_/g<CR>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	map <leader>w :!opout <c-r>% &<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %
"	autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!


" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritepre * %s/\n\+\%$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost bm-files,bm-dirs !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufRead,BufNewFile xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
	autocmd BufWritePost sxhkdrc silent !pkill -usr1 -x sxhkd && notify-send 'sxhkd' 'Reloaded config'
	autocmd BufWritePost configPolybar silent !pgrep -u $UID -x polybar  && $(~/.config/polybar/launchpolybar.sh|$SHELL) && notify-send 'pylybar bottom' 'Reloaded config'
" Recompile ls_extended config edit.
	autocmd BufWritePost ~/.config/install_system/AUR_PKG/ls_extended/src/icons.c !cd ~/.config/install_system/AUR_PKG/ls_extended/; sh ./build.sh


" Recompile dwmblocks on config edit.
	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Function for toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>
"" ---------------------------------------------------------

"" --------------------------------------------------------------------

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <F6> :setlocal spell! spelllang=en_us<CR>
	map <F7> :set spelllang=ru<CR>

""" dict
	function! TranslateWord()
	   let s:dict    = "$HOME/.local/bin/i3cmds/dict/mueller-base.sh"
	   let s:phrase  = expand("<cword>")
	   let s:tmpfile = tempname()
	   silent execute "!" . s:dict . " " . s:phrase . " > " . s:tmpfile
	   execute "botright sp " . s:tmpfile
	endfunction
	map <F9> :call TranslateWord()<CR>
	map <F10> :q<CR>
	map <q> :q<CR>

"" --------------------------------------------------------------------

imap df <Esc>l

nnoremap "" viw<esc>a"<esc>hbi"<esc>lel
nnoremap '' viw<esc>a'<esc>hbi'<esc>lel

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
	vnoremap <C-c> "+y
	map <C-p> "+P


"" open ~/.vimrc
nnoremap <F4> :tabe ~/.config/nvim/init.vim<CR>:tabm 0<CR>

"" save ~/.vimrc and apply changes
nnoremap <F5> :w<CR>:so ~/.config/nvim/init.vim<CR>

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
"command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

""
"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>


"" Copy/Paste/Cut
"if has('unnamedplus')
  "set clipboard=unnamed,unnamedplus
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "MARKDOWN
"     autocmd Filetype markdown,rmd,md inoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l<Space>
"      	"" correction of the document for the correct entry of Russian letters
" 	autocmd Filetype markdown,rmd,md inoremap ,r ---<Enter>mainfont: Arial<Enter>---<Enter><Enter><++>
"
" 	autocmd Filetype markdown,rmd,md inoremap ,c <Enter>\textcolor{red}{<++>}<Enter>
" 	autocmd Filetype markdown,rmd,md map <leader>w yiWi[<esc>Ea](<esc>pa)
" 	"" unsorted	list
" 	autocmd Filetype markdown,rmd,md inoremap ,u -<Space><Esc>F*hi
" 	"" Horizontal Rules
" 	autocmd Filetype markdown,rmd,md inoremap ,n ---<++><Enter>
" 	"" title
" 	autocmd Filetype markdown,rmd,md inoremap ,t ---<Enter>title:<Enter>-<Space><++><Enter>author:<Enter>-<Space><++><Enter>linkcolor: blue<Enter>---<Enter><++>
" 	"" bold text
" 	autocmd Filetype markdown,rmd,md inoremap ,b ****<++><Esc>F*hi
"
" 	autocmd Filetype markdown,rmd,md inoremap ,s ~~~~<++><Esc>F~hi
" 	"" italic text
" 	autocmd Filetype markdown,rmd,md inoremap ,i **<++><Esc>F*i
"
" 	autocmd Filetype markdown,rmd,md inoremap ,h ====<Space><++><Esc>F=hi
" 	"" add images
" 	autocmd Filetype markdown,rmd,md inoremap ,e ![](<++>)<++><Esc>F[a
" 	"" Links
" 	autocmd Filetype markdown,rmd,md inoremap ,a [](<++>)<++><Esc>F[a
" 	autocmd Filetype markdown,rmd,md inoremap ,1 #<Space><++><Space><Space>#<Enter><++><Esc>kA
" 	autocmd Filetype markdown,rmd,md inoremap ,2 ##<Space><++><Enter><++><Esc>kA
" 	autocmd Filetype markdown,rmd,md inoremap ,3 ###<Space><++><Enter><++><Esc>kA
" 	autocmd Filetype markdown,rmd,md inoremap ,l --------<Enter>
" 	""autocmd Filetype rmd,md inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
" 	autocmd Filetype rmd,md inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
" 	autocmd Filetype rmd,md inoremap ,o ```<cr>```<cr><cr><esc>2kO
"

""".xml
	autocmd FileType xml inoremap ,e <item><Enter><title> </title><Enter><guid<space>isPermaLink="false"><++></guid><Enter><pubDate><Esc>:put<Space>=strftime('%a, %d %b %Y %H:%M:%S %z')<Enter>kJA</pubDate><Enter><link><++></link><Enter><description><![CDATA[<++>]]></description><Enter></item><Esc>?<title><enter>cit
	autocmd FileType xml inoremap ,a <a href="<++>"><++></a><++><Esc>F"ci"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" tabs movement Tabs
"nnoremap <TAB> :tabn<CR>
nnoremap <S-TAB> :tabp<CR>
nnoremap <silent> <S-t> :tabnew<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ---------------------------

" Function for toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" settings
"" save position cursor a exit
	augroup resCur
	  autocmd!
	  autocmd BufReadPost * call setpos(".", getpos("'\""))
	augroup END

"""""""""""""""""""""""""""""""""""""""""""""""
"" TODO tabularize
"""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=','
  if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" TODO Source
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('g:vscode')
	"source ~/.config/nvim/basic-setting.vim
	source ~/.config/nvim/plugconfig/vimwiki.vim
	source ~/.config/nvim/plugconfig/easy-motion.vim
	source ~/.config/nvim/plugconfig/plugins.vim
	source ~/.config/nvim/plugconfig/emmet.vim
	"source ~/.config/nvim/plugconfig/table-mode.vim
	source ~/.config/nvim/plugconfig/goyo.vim
	"source ~/.config/nvim/plugconfig/git-gutter.vim
	"source ~/.config/nvim/plugconfig/vim-airline.vim
	"source ~/.config/nvim/plugconfig/vim-hexokinase.vim
	source ~/.config/nvim/plugconfig/vim-fzf.vim
	"source ~/.config/nvim/plugconfig/fern.vim
	source ~/.config/nvim/plugconfig/vim-closetag.vim
	source ~/.config/nvim/plugconfig/coc.vim
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" TODO Syntax Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile abookrc,sh.snippets set filetype=sh
au BufRead,BufNewFile tex.snippets set filetype=tex
au BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
au BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
au BufRead,BufNewFile *.tex set filetype=tex
au BufRead,BufNewFile xmobarrc0,xmobarrc1,xmobarrc2 set filetype=haskell
"au BufRead,BufNewFile *.py colorscheme molokai
au BufRead,BufNewFile tutor.edu,*.txt colorscheme my_colors
au BufRead,BufNewFile rss_example colorscheme my_colors
au BufRead,BufNewFile rss_example set foldmethod=manual

"" syntax python
Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1
let g:python_highlight_func_calls = 1
let g:python_highlight_builtins = 1

Plug 'tomasiser/vim-code-dark'
set termguicolors
colorscheme codedark

"" save position
set viminfo='1000,f1



"=============НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ КОДА (фолдинг)=============
" == Сворачивание ==
" zc                        свернуть блок
" zo                        развернуть блок
" zM                        закрыть все блоки
" zR                        открыть все блоки
" za                        инвертирование
" zf                        см :set foldmethod=manual
" :set foldenable           включить свoрачивание
" :set foldmethod=syntax    сворачивание на основе синтаксиса
" :set foldmethod=indent    сворачивание на основе отступов
" :set foldmethod=manual    выделяем участок с помощью v и говорим zf#j
		"v/V и zf - выделение блока и создание свертки
		"После закрытия vim все свертки забываться, для сохранения сверток в открытом файле используется команда :mkview, для загрузки - loadview
" :set foldmethod=marker    сворачивание на основе маркеров в тексте
" :set foldmarker=bigin,end задаем маркеры начала и конца блока

" set foldenable									" отклключить фолдинг по умолчанию
" set foldmethod=indent						"
" set foldlevel=1									" Первый уровень вложенности открыт, остальные закрыты
" set foldopen=all								" автоматическое открытие сверток при заходе в них

"Для того чтобы vim помнил fold-ы снова при открытии файла нужно добависть в вам файл конфига vimrc следующие строки
autocmd BufWinLeave *.rss mkview
autocmd bufwinenter *.rss silent loadview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Valloric/YouCompleteMe'
	let g:ycm_server_python_interpreter='python3.9'
	let g:ycm_autoclose_preview_window_after_completion = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
