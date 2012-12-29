open Type;;
type 'canonical boolean_expression = 'canonical Type.boolean_expression;;

open ConversionCanonical;;
let canonicalize_variables = ConversionCanonical.canonicalize_variables;;
let uncanonicalize_variables = ConversionCanonical.uncanonicalize_variables;;
let canonicalize = ConversionCanonical.canonicalize;;

open Information;;
let get_variables = Information.get_variables;;
let get_number_of_variables = Information.get_number_of_variables;;

open Constructors;;
let var_  = Constructors.var_;;
let not_  = Constructors.not_;;
let and_  = Constructors.and_;;
let or_  = Constructors.or_;;

open ConversionString;;
let boolean_expression_of_string = ConversionString.boolean_expression_of_string;;
let string_of_boolean_expression = ConversionString.string_of_boolean_expression;;

open AlgebraicManipulation;;
let use_associativity = AlgebraicManipulation.use_associativity;;
let distribute_and = AlgebraicManipulation.distribute_and;;
let distribute_not = AlgebraicManipulation.distribute_not;;
let depth_first_post_order_map = AlgebraicManipulation.depth_first_post_order_map;;