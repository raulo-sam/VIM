let mapleader="ç"
:nnoremap <space>e :CocCommand explorer<CR>
:nnoremap <space>f :Files<CR>
:map <C-s> :w <CR>
:nmap <C-w> :q <CR>
:nmap <C-w> :q!<CR>
:nmap <C-w> :q!<CR>
" Find files using Telescope command-line sugar.
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fg :Telescope live_grep<cr>
nnoremap <leader>fb :Telescope buffers<cr>
nnoremap <leader>fh :Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<cr>
