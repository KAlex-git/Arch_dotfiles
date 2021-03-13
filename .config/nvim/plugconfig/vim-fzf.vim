" ============================================================================
" FZF {{{
" ============================================================================
command! -bang ProjectFiles call fzf#vim#files('~/projects', <bang>0)
" <,+f> open ProjectFiles
nmap <leader>f :ProjectFiles<cr>

command! -bang FM call fzf#run(fzf#wrap({'source': 'cat ~/.config/bookmenu/configs | sed "s/^.*://" | sed "s#~#${HOME}#"', 'sink': 'e'}, <bang>0))
	nnoremap <C-D> :FM<cr>

command! -bang PlugFiles call fzf#vim#files('~/.config/nvim/plugconfig', <bang>0)
	nnoremap <C-l> :PlugFiles<cr>


let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', '#ff00'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
