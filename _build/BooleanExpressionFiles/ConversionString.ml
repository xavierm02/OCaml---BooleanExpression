open Type;;

let rec string_of_boolean_expression e =
  let string_of_boolean_expression_list o l =
    match l with
      | [] -> ""
      | h :: t ->
        let rec loop l s =
          match l with
            | [] -> s
            | h :: t ->
              loop t (s ^ o ^ (string_of_boolean_expression h))
        in "(" ^ (string_of_boolean_expression h) ^ (loop t "") ^ ")"
  in
  match e with
    | Var( i ) -> string_of_int i
    | Not( c ) -> "¬" ^ (string_of_boolean_expression c)
    | And l -> string_of_boolean_expression_list "∧" l
    | Or l -> string_of_boolean_expression_list "∨" l
;;


let boolean_expression_of_string str =
  try
    Parser.main Lexer.token (Lexing.from_string str)
  with Lexer.Eof ->
    exit 0
;;