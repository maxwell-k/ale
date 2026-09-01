" Author: t2h5 <https://github.com/t2h5>
" Description: Integration of Stoplight Spectral CLI with ALE.

function! ale#handlers#spectral#HandleSpectralOutput(buffer, lines) abort
    let l:output = []

    for l:item in ale#util#FuzzyJSONDecode(a:lines, [])
        let l:range = get(l:item, 'range', {})
        let l:range = get(l:item, 'range', {})
        let l:start = get(l:range, 'start', {})
        let l:end = get(l:range, 'end', {})
        call add(l:output, {
        \   'text': l:item.message,
        \   'type': l:item.severity == 0 ? 'E' : 'W',
        \   'code': l:item.code,
        \   'nr': l:item.severity,
        \   'lnum': get(l:start, 'line', 1),
        \   'col': get(l:start, 'character', 1),
        \   'end_lnum': get(l:end, 'line', 1),
        \   'end_col': get(l:end, 'character', 1),
        \})
    endfor

    return l:output
endfunction
