open Lexer;;
open BooleanExpression;;
open IntSet;;

open Printexc;;

try ignore (boolean_expression_of_string "!1") with
  | e -> print_string (Printexc.to_string e)
;;
(* this part is never reached *)
print_int 2;

let e = ref (not_(and_( [or_([not_ (var_( 1 )); or_([var_(3); var_(5)])]);var_( 0 );and_([or_([and_([var_(3);var_(3)]);var_(3)]);and_([var_(3);var_(3)])])] ))) in
print_string (string_of_boolean_expression !e);
print_newline ();

e := distribute_not !e;
print_string (string_of_boolean_expression !e);
print_newline ();

e := use_associativity !e;
print_string (string_of_boolean_expression !e);
print_newline ();

e := distribute_and !e;
print_string (string_of_boolean_expression !e);
print_newline ();

e := use_associativity !e;
print_string (string_of_boolean_expression !e);
print_newline ();

let v = get_variables !e in

let e2 = canonicalize_variables v !e in
print_string (string_of_boolean_expression e2);
print_newline ();

e := uncanonicalize_variables v e2;
print_string (string_of_boolean_expression !e);
print_newline ();