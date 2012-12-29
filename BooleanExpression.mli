type 'canonical boolean_expression constraint 'canonical = [< `Canonical | `Not_canonical ]

val var_ : int -> [`Not_canonical] boolean_expression
val not_ : 'canonical boolean_expression -> 'canonical boolean_expression
val and_ : _ boolean_expression list -> [`Not_canonical] boolean_expression
val or_ : _ boolean_expression list -> [`Not_canonical] boolean_expression

val get_number_of_variables : _ boolean_expression -> int
val get_variables : _ boolean_expression -> IntSet.IntSet.t

val canonicalize_variables : IntSet.IntSet.t -> _ boolean_expression -> [`Canonical] boolean_expression
val uncanonicalize_variables : IntSet.IntSet.t -> [`Canonical] boolean_expression -> _ boolean_expression
val canonicalize : _ boolean_expression -> [`Canonical] boolean_expression

val depth_first_post_order_map : (_ boolean_expression -> [`Not_canonical] boolean_expression) -> _ boolean_expression -> [`Not_canonical] boolean_expression

val distribute_not : 'canonical boolean_expression -> 'canonical boolean_expression
val distribute_and : 'canonical boolean_expression -> 'canonical boolean_expression
val use_associativity : 'canonical boolean_expression -> 'canonical boolean_expression

val string_of_boolean_expression : _ boolean_expression -> string
val boolean_expression_of_string : string -> [`Not_canonical] boolean_expression