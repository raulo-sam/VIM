
"CONFIGURACIONES BASICAS 
set number 				"muestra los numeros de cada linea en la parte izquierda 
set relativenumber 			"la distribucion de los numeros en lineas de manera relativa
set mouse=a 				"permite la interaccion con el mouse
set noshowmode				"me deja de mostrar el modo en el que estamos 'normal, insert, visual, etc'
syntax enable 				"activa el coloreado de sintaxis en algunos tipos de archivos como html, c, c++
set encoding=utf-8 			"permite setear la codificación de archivos para aceptar caracteres especiales
set sw=4 				"la indentación genera 4 espacios
set nowrap				"el texto en una linea no baja a la siguiente, solo continua en la misma hasta el infinito.
"set noswapfile				"para evitar el mensaje que sale al abrir algunos archivos sobre swap.
set clipboard=unnamed			"para poder utilizar el portapapeles del sistema operativo 'esto permite poder copiar y pegar desde cualquier parte a nvim y viceversa.	
set showcmd   " raul ???
set showmatch    "raul mostrar parentesis que esta cerrando
set incsearch
set nowrap    "pasa a linea siguiene si desborda 
set autowrite "cuando cambias de pestaña guarda automaticamente w"
"configuracion del tema
set termguicolors 			"activa el true color en la terminal
colorscheme onedark 			"activar el tema onedark

:nnoremap <space>e :CocCommand explorer<CR>
