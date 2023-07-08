Definitions.
DIGIT                       = [0-9]
ALPHABET                    = [a-zA-Z]
ADDITION                    = \+
SUBTRACTION                 = \-
MULTIPLICATION              = \*
DIVISION                    = \/
MODULO                      = \%
NOT                         = \!
BACKTICK                    = \`
RIGHT                       = \>
LEFT                        = \<
UP                          = \^
DOWN                        = [v]
RANDOM_DIRECTION            = \?
POP_HORIZONTAL              = [_]
POP_VERTICAL                = [|]
STRING_MODE_TOGGLE          = ['"']
DUPLICATE_VAL_ON_TOP        = [:]
SWAP_TOP_VALUE              = '\\'
POP_AND_DISCARD             = \$
POP_AND_WRITE_AS_INT        = [\.]
POP_AND_WRITE_ASCII_CHAR    = [,]
TRAMPOLINE                  = [#]
PUT                         = p
GET                         = g
END                         = [@]
WHITESPACE                  = [\s\n]+


Rules.
{DIGIT} : {token, {digit, TokenLine, TokenChars}}.
{ALPHABET} : {token, {alphabet, TokenLine, TokenChars}}.
{ADDITION} : {token, {add, TokenLine, TokenChars}}.
{SUBTRACTION} : {token, {subtract, TokenLine, TokenChars}}.
{MULTIPLICATION} : {token, {multiply, TokenLine, TokenChars}}.
{DIVISION} : {token, {divide, TokenLine, TokenChars}}.
{MODULO} : {token, {modulo, TokenLine, TokenChars}}.
{NOT} : {token, {negate, TokenLine, TokenChars}}.
{BACKTICK} : {token, {greater_than, TokenLine, TokenChars}}.
{RIGHT} : {token, {move_right, TokenLine, TokenChars}}.
{LEFT} : {token, {move_left, TokenLine, TokenChars}}.
{UP} : {token, {move_up, TokenLine, TokenChars}}.
{DOWN} : {token, {move_down, TokenLine, TokenChars}}.
{RANDOM_DIRECTION} : {token, {move_random, TokenLine, TokenChars}}.
{POP_HORIZONTAL} : {token, {pop_horizontal, TokenLine, TokenChars}}.
{POP_VERTICAL} : {token, {pop_vertical, TokenLine, TokenChars}}.
{STRING_MODE_TOGGLE} : {token, {toggle_string_mode, TokenLine, TokenChars}}.
{DUPLICATE_VAL_ON_TOP} : {token, {duplicate_top_val, TokenLine, TokenChars}}.
{SWAP_TOP_VALUE} : {token, {swap_top_values, TokenLine, TokenChars}}.
{POP_AND_DISCARD} : {token, {pop_and_discard, TokenLine, TokenChars}}.
{POP_AND_WRITE_AS_INT} : {token, {pop_and_write_as_int, TokenLine, TokenChars}}.
{POP_AND_WRITE_ASCII_CHAR} : {token, {pop_and_write_ascii_char, TokenLine, TokenChars}}.
{TRAMPOLINE} : {token, {skip_next_cell, TokenLine, TokenChars}}.
{PUT} : {token, {store_value, TokenLine, TokenChars}}.
{GET} : {token, {get_stored_value, TokenLine, TokenChars}}.
{END} : {token, {end_program, TokenLine, TokenChars}}.
{WHITESPACE}+   : skip_token.

Erlang code.