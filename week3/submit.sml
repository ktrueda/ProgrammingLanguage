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
  let fun is_include ss = 
    case ss of
         [] => false
       | x :: xs => if x = target then true else is_include(xs)
    fun my_valOf v = 
      case v of
           NONE => []
         | SOME i => i 
  in
    if not (is_include(lst))
    then NONE
    else
      case lst of
        [] => NONE
         | x :: [] => SOME []
         | x :: xs => 
             if same_string(x, target) 
               then SOME xs 
             else SOME (x :: my_valOf (all_except_option(target, xs)))
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
     | x :: xs => 
          case all_except_option(s, x) of
                 NONE => get_substitutions1(xs, s)
               | SOME i => i @ get_substitutions1(xs, s)


fun get_substitutions2 (lst: string list list, s: string) = 
  (*
  * Write a function get_substitutions2, which is like get_substitutions1 except
  * it uses a tail-recursive
  * local helper function.
  *)
  (* I can't understand if this function is tail recursive *) 
  let fun substitute (ss, acc) = 
    case ss of
         [] => acc
       | x :: xs => 
            case all_except_option(s, x) of
                 NONE => substitute(xs, acc)
               | SOME i => substitute(xs, acc @ i )
  in
    substitute(lst, [])
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
    val first_name = case fullname of {first, middle, last} => first
    val sbt_first = get_substitutions2(ss, first_name)
    fun apply x = case fullname of {first, middle, last} => {first= x, middle=middle, last=last}
    fun apply_all (sbt_f) = 
      case sbt_f of
           [] => []
         | x :: xs => apply(x) :: apply_all(xs)
  in
    fullname :: apply_all(sbt_first)
  end

fun card_eq(x: card, y: card) = x = y


fun card_color (c: card) = 
  (* Write a function card_color, which takes a card and returns its color
  * (spades and clubs are black,
  * diamonds and hearts are red). Note: One case-expression is enough.
  *)
  let 
    val suit_value = case c of (suit, rank) => suit 
  in
    case suit_value of 
         Clubs => Black
       | Diamonds => Red
       | Spades => Black
       | Hearts => Red
  end

fun card_value(c: card) = 
  (*
  * Write a function card_value, which takes a card and returns its value
  * (numbered cards have their
  * number as the value, aces are 11, everything else is 10). Note: One
  * case-expression is enough.
  *)
  let
    val rank_value = case c of (suit, rank) => rank
  in
    case rank_value of
         King => 10
       | Queen => 10
       | Jack => 10
       | Ace => 11
       | Num(i) => i
  end

fun remove_card (cs: card list, c :card, e: exn) = 
  (*
  * Write a function remove_card, which takes a list of cards cs, a card c, and
  * an exception e. It returns a
  * list that has all the elements of cs except c. If c is in the list more than
  * once, remove only the first one.
  * If c is not in the list, raise the exception e. You can compare cards with
  * =.
  *)
  case cs of
       [] => raise e
     | x :: xs => if x = c then xs else x :: remove_card(xs, c, e)

fun all_same_color (cs: card list) = 
  (*
  * Write a function all_same_color, which takes a list of cards and returns true
  * if all the cards in the
  * list are the same color. Hint: An elegant solution is very similar to one of
  * the functions using nested pattern-matching in the lectures.
  *)
  let 
    fun all_same_color_(cs_: card list, c:color) = 
      if null cs_
      then true
      else if card_color(hd cs_) = c 
      then all_same_color_(tl cs_, c)
      else false
  in
    if null cs
    then false
    else all_same_color_(tl cs, card_color(hd cs))
  end

fun sum_cards (cs: card list) = 
(*
 * Write a function sum_cards, which takes a list of cards and returns the sum of
 * their values. Use a locally
 * defined helper function that is tail recursive. (Take “calls use a
 * constant amount of stack space” as a
 * requirement for this problem.)
 *)
  let fun sum(cs_: card list, acc: int) = 
    if null cs_
    then acc
    else sum(tl cs_, acc + card_value(hd cs_))
  in
    sum(cs, 0)
  end

fun score (cs: card list, goal: int) = 
(*
 * Write a function score, which takes a card list (the held-cards) and an int
 * (the goal) and computes the score as described above.
 *
 * The objective is to end the game with a low score (0 is best). Scoring works
 * as follows: Let sum be the sum
 * of the values of the held-cards. If sum is greater than goal, the preliminary
 * score is three times (sum−goal),
 * else the preliminary score is (goal − sum). The score is the preliminary
 * score unless all the held-cards are
 * the same color, in which case the score is the preliminary score divided by 2
 * (and rounded down as usual
 * with integer division; use ML’s div operator).
 *)
  let
   val sum = sum_cards(cs)
   val is_same_color = all_same_color(cs)
   val denominator = if is_same_color then 2 else 1
  in
    if sum > goal 
    then 3 * (sum - goal) div denominator
    else (goal - sum) div denominator
  end

fun officiate(cs: card list, ms: move list, goal: int) = 
(*
* Write a function officiate, which “runs a game.” It takes a card list (the
* card-list) a move list
* (what the player “does” at each point), and an int (the goal) and returns the
* score at the end of the
* game after processing (some or all of) the moves in the move list in order.
* Use a locally defined recursive
* helper function that takes several arguments that together represent the
* current state of the game. As
* described above:
* • The game starts with the held-cards being the empty list.
* • The game ends if there are no more moves. (The player chose to stop since
* the move list is empty.)
* • If the player discards some card c, play continues (i.e., make a recursive
* call) with the held-cards
* not having c and the card-list unchanged. If c is not in the held-cards, raise
* the IllegalMove
* exception.
* • If the player draws and the card-list is (already) empty, the game is over.
* Else if drawing causes
* the sum of the held-cards to exceed the goal, the game is over (after
* drawing). Else play continues
* with a larger held-cards and a smaller card-list.
* Sample solution for (g) is under 20 lines.
*)
  let
    fun held_cards (cs_: card list, ms_: move list, curr: card list) = 
      if null ms_ orelse null cs_
      then curr
      else if sum_cards(curr) > goal
      then curr
      else case (hd ms_) of
             Draw => held_cards(tl cs_, tl ms_, hd cs_ :: curr)
            | Discard(c) => held_cards(cs_, tl ms_, remove_card(curr, c, IllegalMove))
  in
    score(held_cards(cs, ms, []), goal)
  end
  


 


  



