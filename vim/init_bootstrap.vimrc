" since this is for first boot, just load plugins and that's it

execute 'source ' . fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/plugins.vimrc'
