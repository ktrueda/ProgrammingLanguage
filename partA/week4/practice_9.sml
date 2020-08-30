
fun other_curry1 f = fn x => fn y => f y x
fun other_curry2 f x y = f y x
fun curry f x y = f (x, y)
fun uncurry f (x, y) = f x y
