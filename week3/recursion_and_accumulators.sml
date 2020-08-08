fun sum1 xs = 
  case xs of
       [] => 0
     | i :: xs' => i + sum1 xs'

fun sum2 xs =
    let fun f (xs, acc) = 
      case xs of
            [] => acc
         | i :: xs' => f(xs', i + acc)
    in
      f(xs, 0)
    end

val ans1 = sum1 [1,2,3,4]
val ans2 = sum2 [1,2,3,4]
