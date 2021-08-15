"""""""""""
" AIRLINE "
"""""""""""
" Finally, you can add the convenience variable which will
" automatically populate the dictionary with the powerline symbols.
let g:airline_powerline_fonts = 1

let g:airline_theme='deused'
" Automatically displays all buffers when there's only one tab open.
"let g:airline#extensions#tabline#enabled = 1

" In addition, you can also choose which path formatter airline uses.
" This affects how file paths are displayed in each individual tab
" as well as the current buffer indicator in the upper right.
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
" Separators can be configured independently for the tabline,
" so here is how you can define shape of tabs:

"let g:airline_left_sep=""
"let g:airline_right_sep=""


""""""""""""
" STARTIFY "
""""""""""""

" How to disable random quotes header?
let g:startify_custom_header = []

" function to add bookmarks dynamicly

function! s:sy_add_bookmark(bookmark)
  if !exists('g:startify_bookmarks')
    let g:startify_bookmarks = []
  endif
  let g:startify_bookmarks += [ a:bookmark ]
endfunction

command! -nargs=1 StartifyAddBookmark call <sid>sy_add_bookmark(<q-args>)

" list order
let g:startify_lists = [
			\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
			\ { 'type': 'files',     'header': ['   MRU']            },
			\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
			\ { 'type': 'sessions',  'header': ['   Sessions']       },
			\ { 'type': 'commands',  'header': ['   Commands']       },
			\ ]


let g:startify_bookmarks = [ '~/.config/bspwm/bspwmrc', '~/.config/picom/picom.conf','~/.config/kitty/kitty.conf','~/.config/zsh/.zshrc','~/.config/Xresources','~/.config/colors/' ]

