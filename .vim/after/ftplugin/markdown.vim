setlocal iskeyword=@,48-57,_,-,192-255
setlocal spell
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'sql']

" Some abbreviations to change certain strings to HTML entities
iab (c) &#169;
iab (r) &#174;
iab (tm) &#8482;
iab -- &#8211;
iab --- &#8212;
iab :) &#128522;
iab :D &#128512;
iab :P &#128539;
