open Type;;
open IntSet;;

let rec get_number_of_variables e =
  match e with
    | Var i -> i
    | Not c -> get_number_of_variables c
    | And l | Or l -> List.fold_left (fun m c -> max m (get_number_of_variables c)) 0 l
;;

let rec get_variables e =
  let rec loop e =
    match e with
      | Var i -> IntSet.singleton i
      | Not c -> loop c
      | And l | Or l -> List.fold_left (fun s c -> IntSet.union s (loop c)) IntSet.empty l
  in loop e
;;