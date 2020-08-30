fun fold f acc xs = 
  case xs of 
       [] => acc
     | x :: xs => fold f(f(acc, x)) xs


fun add x y = x + y

val ans_1 = add 3 4
val ans_2 = add 3
