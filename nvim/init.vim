" zo para abrir uma única dobra sob o cursor.
" zc para fechar a dobra sob o cursor.
" zR para abrir todos as dobras.
" zM para fechar todas as dobras.
 

" PLUG-INS {{{
" Aqui ficam os códigos dos plug-ins

call plug#begin('~/.config/nvim/plugged')
  Plug 'morhetz/gruvbox'
  Plug 'dracula/vim', { 'as': 'dracula'}
  Plug 'scrooloose/nerdtree'
  Plug 'vim-scripts/loremipsum'
  Plug 'vim-scripts/HTML-AutoCloseTag'
  Plug 'vim-scripts/txt.vim'
  Plug 'vim-scripts/taglist.vim'
  Plug 'tomtom/tcomment_vim'
  Plug 'msanders/snipmate.vim'
  Plug 'davidhalter/jedi-vim'
  Plug 'digitaltoad/vim-jade'
  Plug 'udalov/kotlin-vim'
  Plug 'mustache/vim-mustache-handlebars'
call plug#end()

" }}}

" SETS SESSION {{{
" Aqui ficam os sets de sessão

set nocompatible                        " Desabilitar a compatibilidade com vi, que pode causar problemas inesperados.
filetype on                             " Habilitar a detecção do tipo de arquivo. O Vim será capaz de tentar detectar automaticamente o tipo de arquivo.
filetype plugin on                      " Habilitar plug-ins e carregar o plug-in correspondente ao tipo de arquivo detectado. 
filetype indent on                      " Carregar um arquivo de indentação correspondente ao tipo de arquivo detectado.
syntax enable                           " Ativar o ralce de sintax
set foldmethod=indent                   " Isso vai ativar o código de dobramento.
                                        " Usa o método de marcadores=marker ou identação=indent para realizar o dobramento.
set number                              " Adiciona numeração ao lado esquerdo de cada linha.
set relativenumber                      " Adiciona numeração real e quantas linhas tem para cima e para baixo da mesma
set linebreak                           " Quebra a linha sem quebrar a palavra
set cursorline                          " Destaca a linha do cursor horizontalmente, diretamente abaixo dele.
set cursorcolumn                        " Destaca a linha do cursor verticalmente, diretamente abaixo dele.
set shiftwidth=2                        " Define o recuo como 2 espaços.
set tabstop=2                           " Define ao tamanho da tabulação como 2 espaços.
set expandtab                           " Utiliza espaço ao invés de tabulações.
set nobackup                            " Não salva arquivos de backup.
set noswapfile                          " Evita a criação de arquivo swap
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
set wildmode=longest, list              " Faz com que o wildmenu se comporte de modo semelhante ao autocompletar do Bash.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
                                        " Há certos arquivos que nunca gostaríamos de editar como Vim.
                                        " O Wildmenu ignorará arquivos com essas extensões.
set gdefault                            " Sempre substitui todas as palavras, não só a primeira
set smartindent                         " Auto-indenta
set guioptions-=T                       " Deixa a GUI sem a toolbar
set autochdir                           " Vai pro diretório do arquivo aberto
set pumheight=15                        " Máximo de palavras no popup de autocomplete
set completeopt=menu,preview            " Como mostrar as possibilidade de inserção
set spelllang=pt                        " Escolhe o dicionário
set mouse=a                             " Habilita o click do mouse

" Permite selecionar com SHIFT + SETA como no Windows
set selectmode=mouse,key
set mousemodel=popup
set keymodel=startsel,stopsel
set selection=exclusive

" }}}

" COLORSCHEME SESSION {{{
" Aqui ficam as configurações de aparência

set background=dark
" colorscheme gruvbox
colorscheme dracula

" }}}

" MAPEAMENTO {{{
" Aqui ficam os códigos de mapeamento.

" nnoremap – Permite mapear as teclas no modo normal.
" inoremap – Permite mapear as teclas no modo de inserção.
" vnoremap – Permite mapear as teclas no modo visual.

" Move entrelinhas visíveis, e não somente físicas, quando em WRAP
inoremap <expr><UP> pumvisible() ? "<UP>" : "<C-O>gk"
inoremap <expr><DOWN> pumvisible() ? "<DOWN>" : "<C-O>gj"

" Ao digitar < acrescenta > ao final e move o cursor para esquerda
inoremap < <><LEFT>

" Ao digitar { acrescenta } ao final e move o cursor para esquerda
inoremap { {}<LEFT>

" Ao digitar [ acrescenta ] ao final e move o cursor para esquerda
inoremap [ []<LEFT>

" Ao digitar ( acrescenta ) ao final e move o cursor para esquerda
inoremap ( ()<LEFT>

" Ao digitar \" acrescenta " ao final e move o cursor para esquerda
inoremap " ""<LEFT>

" Ao digitar ' acrescenta ' ao final e move o cursor para esquerda
inoremap ' ''<LEFT>

" Define uma tecla como tecla leader
let mapleader = ","

" Coloca os simbolos entre uma palavra que esteja selecionada
nnoremap <LEADER>" viw<ESC>a"<ESC>bi"<ESC>ela
nnoremap <LEADER>' viw<ESC>a'<ESC>bi'<ESC>ela
nnoremap <LEADER>( viw<ESC>a)<ESC>bi(<ESC>ela
nnoremap <LEADER>[ viw<ESC>a]<ESC>bi[<ESC>ela
nnoremap <LEADER>{ viw<ESC>a}<ESC>bi{<ESC>ela
nnoremap <LEADER>< viw<ESC>a><ESC>bi<<ESC>ela

" Move a linha para cima e para baixo
inoremap <A-UP> <ESC>V y<ESC>dd2kpi
inoremap <A-DOWN> <ESC>V y<ESC>ddpi

" Copia, recorta, apaga e duplica a linha
inoremap <C-C> <C-O><S-V>"+y
inoremap <C-X> <C-O><S-V>"+x
inoremap <C-D> <C-O><S-V>d
inoremap <C-A-DOWN> <ESC>V yp i
nnoremap <C-A-DOWN> <ESC>V yp i

" Desfaz a última mudança
inoremap <C-z> <ESC>u i

" Desfaz todas as mudanças na última linha editada
inoremap <C-S-z> <ESC>U i

" Salvar e sair do arquivo
inoremap <C-s> <ESC>:w<CR>
vnoremap <C-s> <ESC>:w<CR>
nnoremap <C-s> <ESC>:w<CR>
inoremap <C-q> <ESC>:q<CR>
vnoremap <C-q> <ESC>:q<CR>
nnoremap <C-q> <ESC>:q<CR>

" Atalhos de função
inoremap <F1> <C-O>:help 
inoremap <F7> <C-O>:set spell<CR><C-O>z=

" Atalhos NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Reload do arquivo aberto
inoremap <C-l> <ESC>:source %


" let g:python3_host_prog = '/usr/bin/python3'


" Executar arquivo aberto
" map <F5> <ESC>:w<CR>:!%:p<CR>
map <F5> <ESC>:w<CR>:term %:p<CR> a

" }}}

