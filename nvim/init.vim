set nocompatible                        " Desabilitar a compatibilidade com vi, que pode causar problemas inesperados.
filetype on                             " Habilitar a detecção do tipo de arquivo. O Vim será capaz de tentar detectar automaticamente o tipo de arquivo.
filetype plugin on                      " Habilitar plug-ins e carregar o plug-in correspondente ao tipo de arquivo detectado. 
filetype indent on                      " Carregar um arquivo de indentação correspondente ao tipo de arquivo detectado.
syntax enable                           " Ativar o ralce de sintax
set number                              " Adiciona numeração ao lado esquerdo de cada linha.
set relativenumber                      " Adiciona numeração real e quantas linhas tem para cima e para baixo da mesma
set linebreak                           " Quebra a linha sem quebrar a palavra
set cursorline                          " Destaca a linha do cursor horizontalmente, diretamente abaixo dele.
set cursorcolumn                        " Destaca a linha do cursor verticalmente, diretamente abaixo dele.
set shiftwidth=2                        " Define o recuo como 4 espaços.
set tabstop=2                           " Define ao tamanho da tabulação como 4 espaços.
set expandtab                           " Utiliza espaço ao invés de tabulações.
set nobackup                            " Não salva arquivos de backup.
set scrolloff=10                        " Não permite que o cursor role abaixo ou acima de um numero N de linhas ao rolar.
set nowrap                              " Não quebrar linhas. Permitir que as linhas longas se estendam até onde a linha vai.
set incsearch                           " Destaca os caracteres correspondentes á medida que você os digita durante uma busca.
set ignorecase                          " Ignora letras maiúsculas durante a busca.
set smartcase                           " Sobrescreve a opção ignorecase se estiver buscando por letras maiúsculas.
                                        " Isso permitirá que você procure especificamente por letras maiúsculas.
set showcmd                             " Mostra o comando sendo executado.
set showmode                            " Mostra o modo em que você está.
set showmatch                           " Mostra as palavras correspondentes durante uma pesquisa.
set hlsearch                            " Utiliza destaque durante uma pesquisa.
set history=1000                        " Define os comandos a serem salvos no histórico, sendo 20 o número padrão
set wildmenu                            " Habilita o menu de preenchimento automático ao pressionar TAB.
set wildmode=longest, list              " Faz com que o wildmenu se comporte de ,modo semelhante ao autocompletar do Bash.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
                                        " Há certos arquivos que nunca gostaríamos de editar com o Vim.
                                        " O Wildmenu ignorará arquivos com essas extensões.
set gdefault                            " Sempre substitui todas as palavras, não só a primeira
set smartindent                         " Auto-indenta
set guioptions-=T                       " Deixa a GUI sem a toolbar
set autochdir                           " Vai pro diretório do arquivo aberto
set pumheight=15                        " Máximo de palavras no popup de autocomplete
set completeopt=menu,preview            " Como mostrar as possibilidade de inserção
set spelllang=pt                        " Escolhe o dicionário

set background=dark
set mouse=a

filetype plugin indent on

" Permite selecionar com SHIFT + SETA como no Windows
set selectmode=mouse,key
set mousemodel=popup
set keymodel=startsel,stopsel
set selection=exclusive

" zo para abrir uma única dobra sob o cursor.
" zc para fechar a dobra sob o cursor.
" zR para abrir todos as dobras.
" zM para fechar todas as dobras.


" PLUG-INS ---------------------------------------------------------------- {{{
" Aqui ficam os códigos dos plug-ins

call plug#begin('~/.config/nvim/plugged')

    Plug 'scrooloose/nerdtree'
    Plug 'vim-scripts/loremipsum'
    Plug 'vim-scripts/HTML-AutoCloseTag'
    Plug 'vim-scripts/txt.vim'
    Plug 'vim-scripts/taglist.vim'
    Plug 'tomtom/tcomment_vim'
    Plug 'msanders/snipmate.vim'
    Plug 'davidhalter/jedi-vim'
    Plug 'digitaltoad/vim-jade'
    Plug 'mustache/vim-mustache-handlebars'

call plug#end()

" }}}


" MAPEAMENTO --------------------------------------------------------------- {{{
" Aqui ficam os códigos de mapeamento.

" nnoremap – Permite mapear as teclas no modo normal.
" inoremap – Permite mapear as teclas no modo de inserção.
" vnoremap – Permite mapear as teclas no modo visual.

" Move entrelinhas visíveis, e não somente físicas, quando em WRAP
inoremap <expr><UP> pumvisible() ? "<UP>" : "<C-O>gk"
inoremap <expr><DOWN> pumvisible() ? "<DOWN>" : "<C-O>gj"

" Atalhos
vnoremap <C-C> "+y
vnoremap <C-X> "+x
vnoremap <C-V> "+p
inoremap <C-V> <C-O>:set nosi<CR><C-R>+<C-O>:set si<CR>
noremap <C-Z> <C-O>u
inoremap <C-Z> <C-O>u
inoremap <C-Y> <C-O><C-R> 
inoremap <C-S> <C-O>:update<CR>
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
inoremap <C-J> <C-O><S-J>
inoremap <C-O> <C-O>:confirm e .<CR>
inoremap <C-Q> <C-O>:confirm quit<CR>
inoremap <C-F> <C-O>/
inoremap <C-G> <C-O>/<CR>
inoremap <C-A-F> <C-O>:!grep -Hnir "" *<LEFT><LEFT><LEFT>
inoremap <C-H> <C-O>:%s///gg<LEFT><LEFT><LEFT><LEFT>
inoremap <C-S-F> <C-O>gg<C-O>gH<C-O>G<C-O>=
vnoremap <C-S-F> <C-Q>=
inoremap <A-S-UP> <C-O><C-Q>
inoremap <A-S-DOWN> <C-O><C-Q>
inoremap <A-S-LEFT> <C-O><C-Q>
inoremap <A-S-RIGHT> <C-O><C-Q>
inoremap <C-SPACE> <C-X><C-O>

" Copia a linha e apaga a linha
inoremap <C-C> <C-O><S-V>"+y
inoremap <C-X> <C-O><S-V>"+x
inoremap <C-D> <C-O><S-V>d

" Abas
inoremap <C-T> <C-O>:tabnew<CR>
inoremap <C-TAB> <C-O>:tabnext<CR>
inoremap <C-S-TAB> <C-O>:tabprevious<CR>
inoremap <C-F4> <C-O>:x!<CR>

" Divide janela
inoremap <C-W><C-S> <C-O>:split<CR>
inoremap <C-W><C-N> <C-O>:vnew<CR>
inoremap <C-W><C-V> <C-O>:vsplit<CR>
inoremap <C-W><C-Q> <C-O>:confirm quit<CR>
inoremap <C-W><C-W> <C-O>:winc w<CR>
noremap <TAB> >
noremap <S-TAB> <
inoremap { {}<LEFT>
inoremap [ []<LEFT>

" Atalhos de função
inoremap <F1> <C-O>:help 
inoremap <F7> <C-O>:set spell<CR><C-O>z=

" Atalhos NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" Isso vai ativar o código de dobramento.
" Usa o método de marcadores para realizar o dobramento.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Aqui ficam mais alguns códigos de Vimscript.

" }}}


" LINHA DE STATUS ----------------------------------------------------------- {{{
" Aqui ficam os códigos da linha de status.



" }}}
