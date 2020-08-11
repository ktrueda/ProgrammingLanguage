(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

fun all_except_option(target: string, lst: string list) = 
  (*
  * Write a function all_except_option, which takes a string and a string list.
  * Return NONE if the
  * string is not in the list, else return SOME lst where lst is identical to
  * the argument list except the string
  * is not in it. You may assume the string is in the list at most once. Use
  * same_string, provided to you,
  * to compare strings. Sample solution is around 8 lines
  *)
  let fun is_include(ss: string list) = 
    if null ss
    then false
    else if (hd ss) = target
    then true
    else is_include(tl ss)
  in
    if not (is_include(lst))
    then NONE
    else
      case lst of
        (* I can't understand how to write logic without valOf *) 
        [] => NONE
         | x :: [] => SOME []
         | x :: xs => 
             if same_string(x, target) 
               then SOME xs 
             else SOME (x :: valOf (all_except_option(target, xs)))
  end


fun get_substitutions1 (lst: string list list, s: string) = 
  (*
  * Write a function get_substitutions1, which takes a string list list (a list
  * of list of strings, the
  * substitutions) and a string s and returns a string list. The result has all
  * the strings that are in
  * some list in substitutions that also has s, but s itself should not be in
  * the result.   Sample solution is around 6 lines.
  *)

  case lst of
    [] => [] 
     | x :: xs => let 
                    val x_aeo = all_except_option(s, x)
                  in 
                    if isSome x_aeo
                    then valOf(x_aeo) @ get_substitutions1(xs, s)
                    else get_substitutions1(xs, s)
                  end


fun get_substitutions2 (lst: string list list, s: string) = 
  (*
  * Write a function get_substitutions2, which is like get_substitutions1 except
  * it uses a tail-recursive
  * local helper function.
  *)
  (* I can't understand if this function is tail recursive *) 
  let fun append(ss: string list list, acc: string list) = 
    case ss of
         [] => acc
         | x :: xs => let val x_aeo = all_except_option(s, x)
                    in
                      if isSome(x_aeo)
                        then append(xs, acc @ valOf(x_aeo))
                      else append(xs, acc)
                    end 
  in
    append(lst, [])
  end


fun similar_names (ss: string list list, fullname: {first: string, middle:string, last: string} ) =
  (* 
   * Write a function similar_names, which takes a string list list of
   * substitutions (as in parts (b) and
   * (c)) and a full name of type {first:string,middle:string,last:string}
   * and returns a list of full
   * names (type {first:string,middle:string,last:string} list). The
   * result is all the full names you
   * can produce by substituting for the first name (and only the first
   * name) using substitutions and parts (b)
   * or (c). The answer should begin with the original name (then have 0
   * or more other names). Example:
   *)
   let
     val sbt_first = get_substitutions2(ss, #first fullname)
     fun apply (sbt_f) = 
       case sbt_f of
            [] => []
          | x :: xs => {first= x, middle= (#middle fullname), last= (#last fullname)} :: apply(xs)
   in
     fullname :: apply(sbt_first)
   end








  



