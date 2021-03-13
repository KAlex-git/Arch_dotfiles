"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "MARKDOWN
  autocmd Filetype markdown,rmd,md inoremap <Tab><Tab> <Esc>/<++><Enter>"_c4l<Space>
      	"" correction of the document for the correct entry of Russian letters
 	autocmd Filetype markdown,rmd,md inoremap ,r ---<Enter>mainfont: Arial<Enter>---<Enter><Enter><++>

 	autocmd Filetype markdown,rmd,md inoremap ,c <Enter>\textcolor{red}{<++>}<Enter>
 	autocmd Filetype markdown,rmd,md map <leader>w yiWi[<esc>Ea](<esc>pa)
 	"" unsorted	list
 	autocmd Filetype markdown,rmd,md inoremap ,u -<Space><Esc>F*hi
 	"" Horizontal Rules
 	autocmd Filetype markdown,rmd,md inoremap ,n ---<++><Enter>
 	"" title
 	autocmd Filetype markdown,rmd,md inoremap ,t ---<Enter>title:<Enter>-<Space><++><Enter>author:<Enter>-<Space><++><Enter>linkcolor: blue<Enter>---<Enter><++>
 	"" bold text
 	autocmd Filetype markdown,rmd,md inoremap ,b ****<++><Esc>F*hi

 	autocmd Filetype markdown,rmd,md inoremap ,s ~~~~<++><Esc>F~hi
 	"" italic text
 	autocmd Filetype markdown,rmd,md inoremap ,i **<++><Esc>F*i

 	autocmd Filetype markdown,rmd,md inoremap ,h ====<Space><++><Esc>F=hi
 	"" add images
 	autocmd Filetype markdown,rmd,md inoremap ,e ![](<++>)<++><Esc>F[a
 	"" Links
 	autocmd Filetype markdown,rmd,md inoremap ,a [](<++>)<++><Esc>F[a
 	autocmd Filetype markdown,rmd,md inoremap ,1 #<Space><++><Space><Space>#<Enter><++><Esc>kA
 	autocmd Filetype markdown,rmd,md inoremap ,2 ##<Space><++><Enter><++><Esc>kA
 	autocmd Filetype markdown,rmd,md inoremap ,3 ###<Space><++><Enter><++><Esc>kA
 	autocmd Filetype markdown,rmd,md inoremap ,l --------<Enter>
 	""autocmd Filetype rmd,md inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
 	autocmd Filetype rmd,md inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
 	autocmd Filetype rmd,md inoremap ,o ```<cr>```<cr><cr><esc>2kO
