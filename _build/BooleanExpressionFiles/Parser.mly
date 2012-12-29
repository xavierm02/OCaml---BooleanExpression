%{
  open Type;;
%}

%token <int> VAR
%token AND OR NOT
%token LPAREN RPAREN
%left AND OR
%nonassoc NOT
%start main
%type <[ `Not_canonical ] Type.boolean_expression> main
%%

main:
    expr { $1 }
;

expr:
  | VAR { Var $1 }
  | LPAREN expr RPAREN { $2 }
  | expr AND expr { And [$1; $3] }
  | expr OR expr { Or [$1; $3] }
  | NOT expr %prec NOT { Not $2 }
;