Nonterminals
program 
string_clause
characters
.

Terminals
integer
character
'+'
'-'
'/'
'%'
'!'
'`'
'>'
'<'
'^'
'v'
'?'
'_'
'|'
'"'
':'
'\\'
'$'
'.'
','
'#'
'p'
'g'
'@'
'\s'
'\n'
.

Rootsymbol program.

program -> integer '@' : '$1'.
program -> integer string_clause '@': '$1', '$2'.
string_clause -> '"' characters '"' : '$1'.
characters -> character characters : [ '$1' | '$2']
program -> '>' integer '@' : '$1'.


Erlang code.