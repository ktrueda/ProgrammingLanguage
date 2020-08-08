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
val is_older_1 = is_older ((2020, 1, 1), (2020, 1, 2)) = true
val is_older_2 = is_older ((2020, 1, 1), (2020, 2, 1)) = true
val is_older_3 = is_older ((2020, 1, 1), (2021, 1, 1)) = true
val is_older_4 = is_older ((2020, 1, 2), (2020, 1, 1)) = false
val is_older_5 = is_older ((2020, 2, 1), (2020, 1, 1)) = false
val is_older_6 = is_older ((2021, 1, 1), (2020, 1, 1)) = false
val is_older_7 = is_older ((2020, 1, 1), (2020, 1, 1)) = false


fun number_in_month(ds: (int*int*int) list, m:int) =
  if null ds
    then 0
  else if (#2 (hd ds)) = m 
    then 1 + number_in_month(tl ds, m)
  else number_in_month(tl ds, m)
  

(* test code for number_in_month *)
val number_in_month_1 = number_in_month ([(2020, 2, 1)], 2) = 1 
val number_in_month_2 = number_in_month ([(2020, 2, 1), (2019, 2, 4)], 2) = 2
val number_in_month_3 = number_in_month ([(2020, 2, 1), (2019, 2, 3), (2019, 2,4), (2020, 4, 4)], 2) = 3
val number_in_month_4 = number_in_month ([], 2) = 0
val number_in_month_5 = number_in_month ([(2020, 2, 1)], 5) = 0


fun number_in_months(ds: (int*int*int) list, ms: int list) =
  if null ms
    then 0
  else number_in_month(ds, hd ms) + number_in_months(ds, tl ms)


(* test code for number_in_months *)
val number_in_months_1 = number_in_months ([(2020, 1, 1), (2019, 2, 3), (2019,3,4), (2020, 4, 4)], [1, 2, 3]) = 3 
val number_in_months_2 = number_in_months ([], [1, 2, 3]) = 0
val number_in_months_3 = number_in_months ([(2020, 1, 1)], [4, 2, 3]) = 0
val number_in_months_4 = number_in_months ([], []) = 0


fun dates_in_month(ds: (int*int*int) list, m:int) =
  if null ds
    then []
  else if (#2 (hd ds)) = m 
    then (hd ds) :: dates_in_month(tl ds, m)
  else 
    dates_in_month(tl ds, m)


(* test code for dates_in_month *)
val dates_in_month_1 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val dates_in_month_2 = dates_in_month ([],2) = []
val dates_in_month_3 = dates_in_month ([(2012,2,28),(2013,2,1)],2) = [(2012,2,28), (2013, 2, 1)]


fun dates_in_months(ds: (int*int*int) list, ms:int list) = 
  if null ms
   then []
  else dates_in_month(ds, hd ms) @ dates_in_months(ds, tl ms)


(* test code for dates_in_months *)
val test_dates_in_months_1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31)],[2,3,4]) = [(2012,2,28),(2011,3,31)]
val test_dates_in_months_2 = dates_in_months ([],[2,3,4]) = []
val test_dates_in_months_3 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31)],[]) = []
val test_dates_in_months_4 = dates_in_months ([],[]) = []


fun get_nth(ss: string list, n:int ) = 
  if n = 1
    then hd ss
  else get_nth(tl ss, n - 1)


(* test code for get_nth*)
val test_get_nth_1 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"


fun date_to_string(d: int*int*int) =
  let 
    val month = get_nth([
      "January", "February", "March", "April", "May", "June", "July", "August",
      "September", "October", "November", "December"], (#2 d))
    val date = Int.toString((#3 d))
    val year = Int.toString((#1 d))
  in
    month  ^ " " ^ date ^ ", " ^ year
  end


(* test code for date_to_string*)
val test_date_to_string = date_to_string (2013, 6, 1) = "June 1, 2013"


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
    if sum <= (hd ns)
    then 1
    else countup(ns, 0, 0)
  end

(* test code for number_before_reaching_sum *)
val test_nbrs_1 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val test_nbrs_2 = number_before_reaching_sum (1, [1,2,3,4,5]) = 1
val test_nbrs_3 = number_before_reaching_sum (1, [2,2,3,4,5]) = 1


fun what_month(d: int) = 
  number_before_reaching_sum(d, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31])


(* test code for what_month *)
val test_what_month_1 = what_month 70 = 3
val test_what_month_2 = what_month 32 = 2
val test_what_month_3 = what_month 1 = 1


fun month_range(f: int, t:int) = 
  if f = t
    then [what_month(f)]
  else what_month(f) :: month_range(f+1, t)

(* test code for manth_range *)
val test_month_range_1 = month_range (31, 34) = [1,2,2,2]

fun oldest(ds: (int*int*int) list) = 
  (* todo more faster code *)
  if null ds
    then NONE
  else 
    let val tl_oldest = oldest(tl ds)
    in 
      if isSome tl_oldest andalso is_older(valOf tl_oldest, hd ds)
        then tl_oldest
        else SOME (hd ds)
    end


(* test code for oldest *)
val test_oldest_1 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test_oldest_2 = oldest([]) = NONE





























