type token =
  | VAR of (int)
  | AND
  | OR
  | NOT
  | LPAREN
  | RPAREN

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> [ `Not_canonical ] Type.boolean_expression
