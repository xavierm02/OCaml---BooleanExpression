open Type;;
open Information;;
open IntSet;;

let canonicalize_variables variables e =
  let h = Hashtbl.create (IntSet.cardinal variables) in
  let i = ref 0 in
  IntSet.iter (fun v -> Hashtbl.add h v !i; incr i ) variables;
  let rec loop e =
    match e with
      | Var i -> Var (Hashtbl.find h i)
      | Not c -> Not (loop c)
      | And l -> And (List.map loop l)
      | Or l -> Or (List.map loop l)
  in loop e
;;

let uncanonicalize_variables variables e =
  let a = Array.of_list (IntSet.elements variables) in
  let rec loop e =
    match e with
      | Var i -> Var (a.(i))
      | Not c -> Not (loop c)
      | And l -> And (List.map loop l)
      | Or l -> Or (List.map loop l)
  in loop e

let canonicalize e =
  canonicalize_variables (get_variables e) e
;;