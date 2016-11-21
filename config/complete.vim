"""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocompletion
"""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt-=preview
set completeopt+=noinsert
set completeopt+=noselect
autocmd CompleteDone * pclose!
setlocal omnifunc=go#complete#Complete

let g:python3_host_prog = '/usr/local/bin/python3'
let g:python3_host_skip_check = 1

let g:deoplete#auto_complete_delay = 100
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 1000

call deoplete#custom#set('_', 'converters', [
      \   'converter_auto_paren',
      \   'converter_remove_overlap',
      \ ])

let g:deoplete#omni#input_patterns = {} " Initialize

call deoplete#custom#set('go', 'matchers', ['matcher_full_fuzzy'])
call deoplete#custom#set('go', 'sorters', [])
call deoplete#custom#set('go', 'disabled_syntaxes', ['Comment'])

let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const', 'package']
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = $HOME . '/.cache/deoplete/go/darwin_amd64'
let g:deoplete#sources#go#gocode_binary = $GOPATH . '/bin/gocode'
let g:deoplete#sources#go#on_event = 1
let g:deoplete#ignore_sources = {} " Initialize
let g:deoplete#ignore_sources.go = ['buffer', 'dictionary', 'member', 'omni', 'tag', 'syntax']

let g:neosnippet#enable_snipmate_compatibility = 0
let g:snips_author = 'Sean Schade'
let g:neosnippet_username = 'seanschade'
let g:neosnippet#data_directory = $HOME . '/.cache/nvim/neosnippet'
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#expand_word_boundary = 1
let g:neosnippet#disable_runtime_snippets = { '_': 1 }
let g:go_loaded_gosnippets = 1
let g:go_disable_autoinstall = 1
let g:go_snippet_engine = "neosnippet"
let g:neosnippet#snippets_directory = [$HOME . '/.config/nvim/snippets']

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    	\ "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    	\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><C-h>
      	\ deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS>
      	\ deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
