open Type;;

let var_ (i:int) = Var i;;
let not_ (e:_ boolean_expression) = Not e;;
let and_ (l:_ boolean_expression list) = And l;;
let or_ (l:_ boolean_expression list) = Or l;;