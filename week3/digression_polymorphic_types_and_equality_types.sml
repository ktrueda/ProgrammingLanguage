
fun same_thing(x, y) = if x = y then "yes" else "no"


val ans1 = same_thing(1,1)
val ans2 = same_thing(1,2)
val ans3 = same_thing("foo","foo")
val ans4 = same_thing("foo","bar")
val ans5 = same_thing(1,"bar")
