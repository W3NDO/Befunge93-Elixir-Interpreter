Nonterminals
program 
string_clause
navigator_clause % these define the modifiers that tell the intepreter where to go next >,<,^,v
artithmetic_chars_clause % these define arithmetic operators +,-,*,/,%, !, `, 
stack_manipulators_clause % these alter or return the value at the top of the stack (_, |, :, \, $, ., ',')
getter_setter_clause % these define a way to store a value in a cell for later use and fetch it later on
skip_cell_clause
clauses
clause
.

Terminals
integer
alpha_character
'+'
'-'
'*'
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

program -> clauses '@'                          : '$1'.
clauses -> clause                               : '$1'.
clauses -> clause clauses                       : '$1', '$2'.
clause -> integer                               : '$1'.
clause -> string_clause                         : '$1'.
clause -> navigator_clause                      : '$1'.
clause -> artithmetic_chars_clause              : '$1'.
clause -> stack_manipulators_clause             : '$1'.
clause -> getter_setter_clause                  : '$1'.
clause -> skip_cell_clause                      : '$1'.
clause -> '\s'.
clause -> '\n'.
string_clause -> '"' alpha_character '"'        : extract_value('$2').
navigator_clause -> '>'                         : navigate_stack('$1').
navigator_clause -> '<'                         : navigate_stack('$1').
navigator_clause -> '^'                         : navigate_stack('$1').
navigator_clause -> 'v'                         : navigate_stack('$1').
navigator_clause -> '?'                         : navigate_stack('$1').
artithmetic_chars_clause -> '+'                 : arithmetic('$1') .
artithmetic_chars_clause -> '-'                 : arithmetic('$1') .
artithmetic_chars_clause -> '\*'                : arithmetic('$1') .
artithmetic_chars_clause -> '/'                 : arithmetic('$1') .
artithmetic_chars_clause -> '%'                 : arithmetic('$1') .
artithmetic_chars_clause -> '!'                 : arithmetic('$1') .
artithmetic_chars_clause -> '`'                 : arithmetic('$1') .
stack_manipulators_clause -> '_'                : manipulate_stack('$1') .
stack_manipulators_clause -> '|'                : manipulate_stack('$1') .
stack_manipulators_clause -> ':'                : manipulate_stack('$1') .
stack_manipulators_clause -> '\\'               : manipulate_stack('$1') .
stack_manipulators_clause -> '$'                : manipulate_stack('$1') .
stack_manipulators_clause -> '.'                : manipulate_stack('$1') .
stack_manipulators_clause -> ','                : manipulate_stack('$1') .
getter_setter_clause -> 'p'                     : get_and_set('$1') .
getter_setter_clause -> 'g'                     : get_and_set('$1') .
skip_cell_clause -> '#'                         : skip_cell('$1') .



Erlang code.
arithmetic({_Token, _Line, Operator}) ->
    case Operator of
        '+'  -> ["arithmetic", Operator];
        '-' ->  ["arithmetic", Operator];
        '\*' -> ["arithmetic", Operator];
        '/' ->  ["arithmetic", Operator];
        '%' ->  ["arithmetic", Operator];
        '!' ->  ["arithmetic", Operator];
        '`'  -> ["arithmetic", Operator]
    end.

extract_value({_Token, _Line, Value}) -> Value.

navigate_stack({_Token, _Line, Value}) ->
    case Value of
        ">" -> ["navigate", Value];
        "<" -> ["navigate", Value];
        "v" -> ["navigate", Value];
        "^" -> ["navigate", Value];
        "?" -> ["navigate", Value]
    end.

manipulate_stack({_Token, _Line, Manipulator}) -> 
    case Manipulator of
        "_" -> ["stack_manipulator", Manipulator];
        "|" -> ["stack_manipulator", Manipulator];
        ":" -> ["stack_mainpulator", Manipulator];
        "\\" -> ["stack_manipulator",Manipulator];
        "$" -> ["stack_manipulator", Manipulator];
        "." -> ["stack_manipulator", Manipulator];
        "," -> ["stack_manipulatro", Manipulator]
    end.

get_and_set({_Token, _Line, GetterSetter}) -> 
    case GetterSetter of
        "p" -> ["getter_setter", GetterSetter];
        "g" -> ["getter_setter", GetterSetter]
    end.

skip_cell({_Token, _Line, Value}) -> ["skip_next_cell", Value].