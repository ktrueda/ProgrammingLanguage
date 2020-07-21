val ans1 = let val x = 1
in
  (let val x = 2 in x+1 end) + (let val y = x + 2 in y + 1 end)
end

fun countup_from1 (x: int) = 
  let fun count (from:int, to:int) = 
    if from=to
    then [to]
    else from :: count(from + 1, to)
  in
    count(1, x)
  end

fun countup_from1_better (x:int) = 
  let fun count(from:int) = 
    if from=x
    then x :: []
    else from :: count(from + 1)
  in
    count 1
  end

val ans2 = countup_from1(10)
val ans3 = countup_from1_better(10)
