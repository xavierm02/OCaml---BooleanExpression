type token =
  | VAR of (int)
  | AND
  | OR
  | NOT
  | LPAREN
  | RPAREN

open Parsing;;
# 2 "BooleanExpressionFiles/Parser.mly"
  open Type;;
# 13 "BooleanExpressionFiles/Parser.ml"
let yytransl_const = [|
  258 (* AND *);
  259 (* OR *);
  260 (* NOT *);
  261 (* LPAREN *);
  262 (* RPAREN *);
    0|]

let yytransl_block = [|
  257 (* VAR *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\000\000"

let yylen = "\002\000\
\001\000\001\000\003\000\003\000\003\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\000\000\000\000\007\000\000\000\006\000\
\000\000\000\000\000\000\003\000\004\000\005\000"

let yydgoto = "\002\000\
\006\000\007\000"

let yysindex = "\003\000\
\004\255\000\000\000\000\004\255\004\255\000\000\000\255\000\000\
\008\255\004\255\004\255\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\012\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\252\255"

let yytablesize = 14
let yytable = "\008\000\
\009\000\010\000\011\000\001\000\003\000\013\000\014\000\004\000\
\005\000\010\000\011\000\001\000\000\000\012\000"

let yycheck = "\004\000\
\005\000\002\001\003\001\001\000\001\001\010\000\011\000\004\001\
\005\001\002\001\003\001\000\000\255\255\006\001"

let yynames_const = "\
  AND\000\
  OR\000\
  NOT\000\
  LPAREN\000\
  RPAREN\000\
  "

let yynames_block = "\
  VAR\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 15 "BooleanExpressionFiles/Parser.mly"
         ( _1 )
# 78 "BooleanExpressionFiles/Parser.ml"
               : [ `Not_canonical ] Type.boolean_expression))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 19 "BooleanExpressionFiles/Parser.mly"
        ( Var _1 )
# 85 "BooleanExpressionFiles/Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 20 "BooleanExpressionFiles/Parser.mly"
                       ( _2 )
# 92 "BooleanExpressionFiles/Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 21 "BooleanExpressionFiles/Parser.mly"
                  ( And [_1; _3] )
# 100 "BooleanExpressionFiles/Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 22 "BooleanExpressionFiles/Parser.mly"
                 ( Or [_1; _3] )
# 108 "BooleanExpressionFiles/Parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 23 "BooleanExpressionFiles/Parser.mly"
                       ( Not _2 )
# 115 "BooleanExpressionFiles/Parser.ml"
               : 'expr))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : [ `Not_canonical ] Type.boolean_expression)
