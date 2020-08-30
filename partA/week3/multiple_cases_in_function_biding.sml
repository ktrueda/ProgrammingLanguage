
datatype exp = Constant of int
             | Negate of exp
             | Add of exp * exp
             | Multiply of exp * exp

fun eval (Constant i ) = i
  | eval (Negate e2 ) = ~ (eval e2)
  | eval (Add(e1, e2)) = (eval e1) + (eval e2)
  | eval (Multiply(e1, e2)) = (eval e1) * (eval e2)


fun append([], ys) = ys
  | append(x::xs', ys) = x::append(xs', ys)

val ans1 = eval(Constant(3))
val ans2 = eval(Add(Constant(1), Constant(3)))
val ans3 = eval(Multiply(Add(Constant(4), Constant(3)), Constant(3)))

val ans4 = append([1,2,3], [4,5,6])
