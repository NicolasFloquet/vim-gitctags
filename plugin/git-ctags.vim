" ============================================================================
" File:        git-ctags.vim
" Maintainer:  Nicolas Floquet <nicolasfloquet at gmail dot com>
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================
"
" SECTION: Script init stuff {{{1
"============================================================

if exists("loaded_git_ctags")
    finish
endif

let loaded_git_ctags = 1


" SECTION: Internal methods {{{1
"============================================================

function! Chomp(string)
  return substitute(a:string, '\n\+$', '', '')
endfunction

function! GitCTagsGenerate()
  let gitPath = Chomp(system('git rev-parse --show-toplevel'))
  execute "silent !ctags -R -f " . gitPath . "/.git/tags " . gitPath
  redraw!
endfunction

function! GitCTagsLoad()
  let gitPath = Chomp(system('git rev-parse --show-toplevel'))
  let tagPath = "" . gitPath . "/.git/tags"
  let &tags=tagPath
endfunction


" SECTION: Auto commands {{{1
"============================================================

autocmd BufWritePre *.c :call GitCTagsGenerate()
autocmd BufWritePre *.h :call GitCTagsGenerate()
autocmd BufNewFile,BufRead *.c :call GitCTagsLoad()
autocmd BufNewFile,BufRead *.h :call GitCTagsLoad()

