setlocal omnifunc=python3complete#Complete

autocmd BufWritePre <buffer> call StripTrailingWhitespace()

let b:ale_fixers = {
            \ "python": ["add_blank_lines_for_python_control_statements", 
            \ "autoimport", "black"]
            \ }

let b:ale_python_black_options = '--line-length 100'
"let b:ale_python_auto_pipenv = 1
let b:ale_fix_on_save = 1


"let b:ale_sign_column_always = 1
