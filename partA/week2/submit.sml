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

fun number_in_month(ds: (int*int*int) list, m:int) =
  if null ds
    then 0
  else if (#2 (hd ds)) = m 
    then 1 + number_in_month(tl ds, m)
  else number_in_month(tl ds, m)
  

fun number_in_months(ds: (int*int*int) list, ms: int list) =
  if null ms
    then 0
  else number_in_month(ds, hd ms) + number_in_months(ds, tl ms)


fun dates_in_month(ds: (int*int*int) list, m:int) =
  if null ds
    then []
  else if (#2 (hd ds)) = m 
    then (hd ds) :: dates_in_month(tl ds, m)
  else 
    dates_in_month(tl ds, m)


fun dates_in_months(ds: (int*int*int) list, ms:int list) = 
  if null ms
   then []
  else dates_in_month(ds, hd ms) @ dates_in_months(ds, tl ms)


fun get_nth(ss: string list, n:int ) = 
  if n = 1
    then hd ss
  else get_nth(tl ss, n - 1)


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


fun number_before_reaching_sum(sum: int, ns: int list) = 
  if null ns
    then 0
  else if sum <= (hd ns)
    then 0
  else 1 + number_before_reaching_sum(sum - (hd ns), tl ns)


fun what_month(d: int) = 
  1 + number_before_reaching_sum(d, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31])


fun month_range(f: int, t:int) = 
  if f > t
    then []
  else if f = t
    then [what_month(f)]
  else what_month(f) :: month_range(f+1, t)


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



