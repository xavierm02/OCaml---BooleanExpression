open Type;;

let rec distribute_not e =
  match e with
    | Not (And l) -> Or (List.map (fun c -> distribute_not (Not c)) l)
    | Not (Or l) -> And (List.map (fun c -> distribute_not (Not c)) l)
    | Not (Not c) -> distribute_not c
    | _ -> e
;;

let depth_first_post_order_map f e =
  let rec loop e =
    match e with
      | Var i -> f e
      | Not c -> f (Not (loop c))
      | And l -> f (And (List.rev(List.rev_map loop l)))
      | Or l -> f (Or (List.rev(List.rev_map loop l)))
  in loop e
;;

let rec distribute_and = depth_first_post_order_map (fun e ->
  match e with
    | And l ->
      Or (List.rev_map (fun x -> And x ) (List.fold_left (fun accu c ->
        match c with
          | Or lc ->
            List.concat (
              List.rev_map (
                fun cc -> List.rev_map (fun accu_l -> cc :: accu_l) accu
              ) lc
            )
          | _ -> List.rev_map (fun accu_l -> c :: accu_l) accu
      ) [[]] l))
    | _ -> e
);;

let rec use_associativity = depth_first_post_order_map (fun e ->
  match e with
    | And l ->
      And (List.rev (List.fold_left (fun accu c ->
        match c with
          | And lc -> List.rev_append lc accu
          | _ -> c :: accu
      ) [] l))
    | Or l ->
      Or (List.rev (List.fold_left (fun accu c ->
        match c with
          | Or lc -> List.rev_append lc accu
          | _ -> c :: accu
      ) [] l))
    | _ -> e
);;