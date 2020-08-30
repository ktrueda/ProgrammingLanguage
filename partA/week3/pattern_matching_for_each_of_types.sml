
fun sum_triple(triple: int * int * int) = 
  case triple of 
       (x, y, z) => z + y + x

val ans1 = sum_triple(1,2,3)


fun full_name( r : {first: string, middle: string, last:string}) = 
  case r of
       {first=x, middle=y,last=z} => z ^ " " ^  y ^ " " ^ z

val ans2  = full_name({
  first="kentaro",
  middle="pip", 
  last="ueda"}) 
