fun swap(pr : int * bool) =
  (#2 pr, #1 pr)

fun sum_two_pairs(pr1 : int * int, pr2: int*int) = 
  (#1 pr1) + (#2 pr1) + (#1 pr2) + (#2 pr2)

fun div_mod(x: int, y: int) = 
  (x div y, x mod y)

fun sort_pair(pr: int*int) = 
  if (#1 pr) < (#2 pr)
  then pr
  else ((#2 pr), (#1 pr))


val ans1 = swap(1,true)
val ans2 = sum_two_pairs((1, 2), (3,4))
val ans3 = div_mod(43, 4)
val ans4 = sort_pair(4,5)
val ans5 = sort_pair(6,5)
