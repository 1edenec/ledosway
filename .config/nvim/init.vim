"let mapleader =","

"rulang fix
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" создать папку для плагинов
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
	source ~/.config/nvim/plugins.vim
call plug#end()

" PLUGINS CONFIG
source ~/.config/nvim/pluginsConfig.vim

	set		go=a
	set		mouse=a
	set		nohlsearch
	set		clipboard+=unnamedplus
	set		guifont="Hack Nerd Font Mono:h11"
	set		guifontwide="Hack Nerd Font Mono:h12"
	filetype plugin on

" Enable autocompletion:
	set wildmode=longest,list,full
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" сколько строк внизу и вверху экрана показывать при скроллинге
	set scrolloff=5
" Включить подсветку синтаксиса
	syntax on
" Поиск в процессе набора
	set incsearch
" подсвечивание результатов поиска
	set hlsearch
" умная зависимость от регистра. Детали `:h smartcase`
	set ignorecase
	set smartcase
" Кодировка текста по умолчанию utf8
	set termencoding=utf8
" Показывать положение курсора всё время.
	set ruler
" Показывать незавершённые команды в статусбаре
	set showcmd
" Фолдинг по отсупам
	set foldenable
	set foldlevel=100
	set foldmethod=indent
" Скрывать указатель мыши, когда печатаем
	set mousehide
" Включить автоотступы
	set autoindent
" Не переносить строки
	"set nowrap

"numbers
	set relativenumber
	set nu
	highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Размер табуляции по умолчанию
	set shiftwidth=4
	set softtabstop=4
	set tabstop=4
" Включаем "умные" отступы, например, авто отступ после `{`
	set smartindent
" Отображение парных символов
	set showmatch
" Навигация с учетом русских символов, учитывается командами следующее/предыдущее слово и т.п.
	set iskeyword=@,48-57,_,192-255
" Удаление символов бэкспэйсом в Windows
	set backspace=indent,eol,start
" Подсвечивать линию текста, на которой находится курсор
	set cursorline
"highlight CursorLine guibg=black ctermbg=red
	highlight CursorLine term=none cterm=none ctermbg=black
" Увеличение размера истории
	set history=1000
" Дополнительная информация в строке состояния
	set wildmenu
" Настройка отображения специальных символов
	"set list listchars=tab:→\ ,trail:·

"Visual mode mappings
	:vmap sb "zdi<b><C-R>z</b><Esc> : wrap <b></b> around visually selected text
	:vmap st "zdi<?= <C-R>z ?><Esc> : wrablack ?> around visually selected text

"НАСТРОЙКИ ГОРЯЧИХ КЛАВИШ
" F2 - сохранить файл
	nmap <F2> :w<cr>
	vmap <F2> <esc>:w<cr>i
	imap <F2> <esc>:w<cr>i

" F3 - рекурсивный поиск по файлам (плагин grep.vim)
	nnoremap <silent> <F3> :Rgrep<cr>

" Shift-F<F3> - добавление найденного к прошлым результатам поиска
	nnoremap <silent> <S-F<F3>> :RgrepAdd<cr>

" Ctrl-F<F3> - поиск в открытых буферах
	nnoremap <silent> <C-F<F3>> :GrepBuffer<cr>

" F5 - просмотр списка буферов
	nmap <F5> <Esc>:buffers<cr>
	vmap <F5> <esc>:buffers<cr>
	imap <F5> <esc><esc>:buffers<cr>a

" при включенном плагине можно использовать его
	nmap <S-F5> :BufExplorer<CR>

" F6 - предыдущий буфер
	map <F6> :bp<cr>
	vmap <F6> <esc>:bp<cr>i
	imap <F6> <esc>:bp<cr>i

" F7 - следующий буфер
	map <F7> :bn<cr>
	vmap <F7> <esc>:bn<cr>i
	imap <F7> <esc>:bn<cr>i

" F9 - сохранение файла и запуск компиляции (make)
	map <F9> :w<cr>:make<cr>
	vmap <F9> <esc>:w<cr>:make<cr>i
	imap <F9> <esc>:w<cr>:make<cr>i

" F10 - включить-выключить браузер структуры документа (TagList)
	map <F10> :TlistToggle<cr>
	vmap <F10> <esc>:TlistToggle<cr>
	imap <F10> <esc>:TlistToggle<cr>

" F11 - включить-выключить нумерацию строк
	imap <F11> <Esc>:set<Space>nu!<CR>a
	nmap <F11> :set<Space>nu!<CR>

	" F12 - обозреватель файлов (:Ex для стандартного обозревателя,
" плагин NERDTree - дерево каталогов)
	map <F12> :NERDTreeToggle<cr>
	vmap <F12> <esc>:NERDTreeToggle<cr>i
	imap <F12> <esc>:NERDTreeToggle<cr>i

" Переключение табов (вкладок) (rxvt-style)
	map <S-left> :tabprevious<cr>
	nmap <S-left> :tabprevious<cr>
	imap <S-left> <ESC>:tabprevious<cr>i
	map <S-right> :tabnext<cr>
	nmap <S-right> :tabnext<cr>
	imap <S-right> <ESC>:tabnext<cr>i
	nmap <C-t> :tabnew<cr>
	imap <C-t> <ESC>:tabnew<cr>
	nmap <S-down> :tabnew<cr>
	imap <S-down> <ESC>:tabnew<cr>
	nmap <C-S-q> :tabclose<cr>
	imap <C-S-q> <ESC>:tabclose<cr>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Remove all trailing whitespace by pressing C-S
	nnoremap <C-S> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
	autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Clear highlighting on escape in normal mode
	nnoremap <esc> :noh<return><esc>
	nnoremap <esc>^[ <esc>^[

" Smart tab autocomplete Shit+tab
function! SuperCleverTab()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
	else
		return "\<C-p>"
	endif
endfunction
inoremap <S-Tab> <C-R>=SuperCleverTab()<cr>

" Move a line of text using CTRL+[jk]
	nmap <C-j> mz:m+<cr>`z
	nmap <C-k> mz:m-2<cr>`z
	vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
	vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Автоматически перечитывать конфигурацию VIM после сохранения
	autocmd! bufwritepost $MYVIMRC source $MYVIMRC
" When shortcut files are updated, renew bash and ranger configs with new material:
	"autocmd BufWritePost files,directories !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	"autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update binds when sxhkdrc is updated.
	"autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd


