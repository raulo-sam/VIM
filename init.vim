if !exists('g:vscode')
endif

":::instalacion de plugins:::
call plug#begin('~/.config/nvim/plugged') 	"directorio donde se van a instalar los plugins
source ~/.config/nvim/plugins.vim
"Plug 'glepnir/dashboard-nvim'
call plug#end() 			

"general-settings 
source ~/.config/nvim/general-settings.vim
"settings Plugins
source ~/.config/nvim/plugin-config/vim-easymotion.vim
source ~/.config/nvim/plugin-config/vim-coc-settings.vim
source ~/.config/nvim/plugin-config/vim-airline.vim
source ~/.config/nvim/mapping.vim
" general mappings

" let mapleader=" "


"configuracion de emmet-vim
let g:user_emmet_leader_key=',' 	"mapeando la tecla lider por una coma, con esto se completa los tag con doble coma.




"configuracion de nerdtree
"mapeando el abrir y cerrar de nerdtree con nerdtreetoggle vemos los archivos en el arbol y podemos cerrarlo a la vez, map es la C mayuscula representa el
"control y -n la tecla n lo que indica que realizará la siguiente funcion de excribir el comando NERDTreeToggle y CR significa ENTER.
map <C-n> :NERDTreeToggle<CR>

"Esto le dice a Vim que mantenga una copia de seguridad de un archivo cuando
"l#o sobreescribe. Pero no en el sistema VMS, ya que éste mantiene versiones
"anteriores por su cuenta. El backup tendrá el mismo nombre con un «~»
"delante.  Véase |07.4| >
	if has("vms")
	  set nobackup
	else
	  set backup
      endif

"Mantiene 50 órdenes y 50 patrones de búsqueda en el historial. Use otro
":número si quiere almacenar más o menos líneas.  >
	set history=50

	
	"configuracion por defecto de coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.

if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Show commands.  nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr> Find symbol of current document.  nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr> Search workspace symbols.  nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr> Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

nmap  <leader>w :w<CR>
nmap  <leader>W :wq<CR>
nmap  <leader>q :q<CR>
nmap  <leader>Q :q!<CR>

