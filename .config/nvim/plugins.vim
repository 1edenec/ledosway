" Statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" StartPage
Plug 'mhinz/vim-startify'

" line numbers
"Plug 'myusuf3/numbers.vim'

" easy commentary
" select lines with visual selection and press gc
Plug 'tpope/vim-commentary'

" filebrowser
Plug 'scrooloose/nerdtree'

" colors
Plug 'lilydjwg/colorizer'

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }


Plug 'kovetskiy/sxhkd-vim'

" go IDE

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"Plug 'ycm-core/YouCompleteMe'
