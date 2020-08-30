val x = ref 0
val x2 = x

val x3 = ref 0
val y = (!x) + 1 
val _ = x := (!x) + 7
val z1 = !x
val z2 = !x2
val z3 = !x3
