" Author: Keith Maxwell <keith.maxwell@gmail.com>
" Description: Static analysis for GitHub Actions

call ale#linter#Define('yaml', {
\   'name': 'zizmor',
\   'executable': 'zizmor',
\   'command': '%e --format=json %t',
\   'callback': 'ale#handlers#zizmor#Handle',
\})
