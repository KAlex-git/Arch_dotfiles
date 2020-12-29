let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md', 'auto_diary_index': 1}]
" ,v вызывает vimwiki
nmap <leader>v :VimwikiIndex
nnoremap <leader>h :h vimwiki<cr>

" Ensure files are read as what I want:
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}



"-- работает в номальном режиме
"nmap <space> :echo "foo"<cr>
