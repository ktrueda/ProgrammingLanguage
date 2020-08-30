exception BadTriple

fun zip3 list_triple = 
  case list_triple of
       ([], [], []) => []
     | (hd1:: tl1, hd2::tl2, hd3::tl3) => (hd1, hd2, hd3) :: zip3(tl1, tl2, tl3)
     | _ => raise BadTriple


fun unzip3 lst = 
  case lst of
       [] => ([], [], [])
     | (a, b, c)::tl => let val(l1,l2,l3) = unzip3 tl
        in
          (a::l1, b::l2, c::l3)
        end

fun nondecreasing intlist =
  case intlist of
       [] => true
     | _ :: [] => true
     | head::(neck::rest) => (head <= neck andalso nondecreasing (neck::rest))

datatype sgn = P | N | Z

fun multsign ( x1, x2) = 
  let fun sign x = if x=0 then Z else if x>0 then P else N
  in
    case (sign x1, sign x2) of
          (Z, _) => Z
        | (_, Z) => Z
        | (P, P) => P
        | (N, N) => P
        | _ => N
  end


val ans1 = zip3([1,2,3], [4,5,6], [7,8,9])

val ans2 = unzip3([(1,2,3),(4,5,6),(7,8,9)])

val ans3 = nondecreasing [1,2,3,4,5,6,7]

val ans4 = nondecreasing [11,2,3,4,5,6,7]

val ans5 = multsign(10, 10)

val ans6 = multsign(~10, 10)

val ans7 = multsign(0, 10)

