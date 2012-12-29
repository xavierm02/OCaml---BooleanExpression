{
  open Parser
  exception Eof
}
rule token = parse
  | ['0'-'9']+ as n { VAR (int_of_string n) }
  | '^' { AND }
  | 'v' { OR }
  | '!' { NOT }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | eof { raise Eof }