fun is_older ( x : int*int*int, y : int*int*int) =
  if (#1 x) < (#1 y) 
  then true
  else if (#1 x) > (#1 y)
  then false
  else if (#2 x) < (#2 y)
  then true
  else if (#2 x) > (#2 y)
  then false
  else if (#3 x) < (#3 y)
  then true
  else false

(* test code for is_older *)
val is_older_true_1 = is_older ((2020, 1, 1), (2020, 1, 2))
val is_older_true_2 = is_older ((2020, 1, 1), (2020, 2, 1))
val is_older_true_3 = is_older ((2020, 1, 1), (2021, 1, 1))

val is_older_false_1 = is_older ((2020, 1, 2), (2020, 1, 1))
val is_older_false_2 = is_older ((2020, 2, 1), (2020, 1, 1))
val is_older_false_3 = is_older ((2021, 1, 1), (2020, 1, 1))
val is_older_false_4 = is_older ((2020, 1, 1), (2020, 1, 1))

fun number_in_month(ds: (int*int*int) list, m:int) =
  if null ds
    then 0
  else if (#2 (hd ds)) = m 
    then 1 + number_in_month(tl ds, m)
  else number_in_month(tl ds, m)
  
(* test code for number_in_month *)
val number_in_month_1 = number_in_month ([(2020, 2, 1)], 2) 
val number_in_month_2 = number_in_month ([(2020, 2, 1), (2019, 2, 4)], 2) 
val number_in_month_3 = number_in_month ([(2020, 2, 1), (2019, 2, 3), (2019, 2, 4), (2020, 4, 4)], 2) 


fun number_in_months(ds: (int*int*int) list, ms: int list) =
  if null ms
    then 0
  else number_in_month(ds, hd ms) + number_in_months(ds, tl ms)


(* test code for number_in_months *)
val number_in_months_3 = number_in_months ([(2020, 1, 1), (2019, 2, 3), (2019,3, 4), (2020, 4, 4)], [1, 2, 3]) 

fun dates_in_month(ds: (int*int*int) list, m:int) =
  if null ds
    then []
  else if (#2 (hd ds)) = m 
    then (hd ds) :: dates_in_month(tl ds, m)
  else 
    dates_in_month(tl ds, m)

(* test code for number_in_month *)
val dates_in_month_1 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]


fun dates_in_months(ds: (int*int*int) list, ms:int list) = 
  if null ms
   then []
  else dates_in_month(ds, hd ms) @ dates_in_months(ds, tl ms)

(* test code for number_in_months *)
val test_dates_in_months_1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]


fun get_nth(ss: string list, n:int ) = 
  if n = 1
    then hd ss
  else get_nth(tl ss, n - 1)


(* test code for get_nth*)
val test6 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"

fun date_to_string(d: int*int*int) =
  get_nth([
    "January", "February", "March", "April", "May", "June", "July", "August",
    "September", "October", "November", "December"], 
    (#2 d)
  ) ^ " " ^ Int.toString((#3 d))
  ^ ", " ^ Int.toString((#1 d))


(* test code for date_to_string*)
val test7 = date_to_string (2013, 6, 1) = "June 1, 2013"

fun number_before_reaching_sum(sum: int, ns: int list) = 
  (* how can i simplify this function? *)
  let fun countup(nums: int list, curr_sum: int, ind: int) = 
    if curr_sum >= sum
      then ind
    else if curr_sum + (hd nums) = sum
      then ind 
    else
      countup(tl nums, curr_sum + (hd nums), ind + 1)
  in
    if sum = (hd ns)
    then 1
    else countup(ns, 0, 0)
  end

(* test code for number_before_reaching_sum *)
val test_nbrs_1 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val test_nbrs_2 = number_before_reaching_sum (1, [1,2,3,4,5]) = 1
val test_nbrs_3 = number_before_reaching_sum (1, [2,2,3,4,5]) = 1


fun what_month(d: int) = 
  number_before_reaching_sum(d, 
  [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31])

(* test code for what_month *)
val test9 = what_month 70 = 3


fun month_range(f: int, t:int) = 
  if f = t
    then [what_month(f)]
  else what_month(f) :: month_range(f+1, t)

(* test code for manth_range *)
val test10 = month_range (31, 34) = [1,2,2,2]

fun oldest(ds: (int*int*int) list) = 
  (* todo more faster code *)
  if null ds
    then NONE
  else let val tl_oldest = oldest(tl ds)
    in 
      if isSome tl_oldest andalso is_older(valOf tl_oldest, hd ds)
        then tl_oldest
        else SOME (hd ds)
   end



(* test code for oldest *)
val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)




























