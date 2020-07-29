datatype exp = Constant of int
              | Negate of exp
              | Add of exp * exp
              | Multiply of exp * exp


fun eval e =
  case e of
      Constant i => i
    | Negate e2  => ~ (eval e2)
    | Add(e1,e2) => (eval e1) + (eval e2)
    | Multiply(e1,e2) => (eval e1) * (eval e2)



val ans1 = Add (Constant 19, Negate (Constant 4))
val ans2 = eval ans1
