fun sum_list (xs: int list) =
  if null xs
  then 0 
  else hd(xs) + sum_list(tl xs)

fun countdown(x: int) = 
  if x = 0
  then [] 
  else x :: countdown(x-1)

fun append(xs: int list, ys: int list) = 
  if null xs
  then ys
  else (hd xs) :: append(tl xs, ys)

fun sum_pair_list(xs : (int * int) list) =
  if null xs
  then 0
  else #1 (hd xs) + #2 (hd xs) + sum_pair_list(tl xs)

fun firsts (xs : (int * int) list ) =
  if null xs
  then []
  else (#1 (hd xs)) :: (firsts(tl xs))

fun seconds ( xs: (int * int) list ) =
  if null xs
  then []
  else (#2 (hd xs)) :: (seconds(tl xs))

fun sum_pair_list2 (xs: (int * int) list ) =
  (sum_list (firsts xs)) + (sum_list(seconds xs)) 


val ans1 = sum_list([1,2,3])
val ans2 = countdown(10)
val ans3 = append([1,2,3], [4,5,6])
val ans4 = sum_pair_list([(1,2), (3,4)])
val ans5 = firsts([(1,2), (3,4)])
val ans6 = seconds([(1,2), (3,4)])
val ans7 = sum_pair_list2([(1,2), (3,4)])
