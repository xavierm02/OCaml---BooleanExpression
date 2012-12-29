open IntSet;;

(*
** Uses phantom types (http://camltastic.blogspot.fr/2008/05/phantom-types.html) to remember if some invariants are respected.
** 'canonical determines if we can assume that the n variables range from 0 to (n-1)
*)

type base_boolean_expression =
  | Var of int
  | Not of base_boolean_expression
  | And of base_boolean_expression list
  | Or of base_boolean_expression list
;;

type 'canonical boolean_expression =
  base_boolean_expression
  constraint 'canonical = [< `Canonical | `Not_canonical ]