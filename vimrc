" Load pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set autoindent

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8

filetype on
filetype plugin indent on

set textwidth=79

syntax on

execute 'source ' . $HOME . '/.vim/shortkeys.vim'

au FileType python set omnifunc=pythoncomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS

let g:SuperTabDefaultCompletionType = "context"

set completeopt=menuone,longest,preview

function!SetAutoDjangoCompletion()
    let l:tmpPath = split($PWD, '/')
    let l:djangoVar = tmpPath[len(tmpPath)-1].'.settings'
    let $DJANGO_SETTINGS_MODULE=djangoVar
    echo 'Activating django completion with: '.djangoVar
    return 1
endfunction

" Completion for virtual env libraries
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

