let s:dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
execute 'source ' . s:dir . '/plugins.vimrc'
execute 'source ' . s:dir . '/opts.vimrc'
execute 'source ' . s:dir . '/keys.vimrc'
execute 'source ' . s:dir . '/misc.vimrc'
execute 'source ' . s:dir . '/local.vimrc'
if !exists('g:vscode')
    execute 'source ' . s:dir . '/coc.vimrc'
    execute 'source ' . s:dir . '/colors.vimrc'
    execute 'source ' . s:dir . '/tree-sitter.lua'
end
