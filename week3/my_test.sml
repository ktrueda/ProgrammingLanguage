(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

val test_all_except_option_1 = all_except_option ("string", ["string"]) = SOME []
val test_all_except_option_2 = all_except_option ("string", ["string", "foo"]) = SOME ["foo"]
val test_all_except_option_3 = all_except_option ("string", []) = NONE
val test_all_except_option_4 = all_except_option ("Fred", ["Elizabeth","Betty"]) = NONE

val test_get_substitutions1_1 = get_substitutions1 ([["foo"],["there"]], "foo") = []
val test_get_substitutions1_2 = get_substitutions1 ([["foo", "bar"],["there"]], "foo") = ["bar"]
val test_get_substitutions1_3 = get_substitutions1 ([["there"]], "foo") = []
val test_get_substitutions1_4 = get_substitutions1 ([["there", "foo"], ["foo", "there"]], "foo") = ["there", "there"]
val test_get_substitutions1_5 = get_substitutions1 ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick", "Freddie", "F"]

val test_get_substitutions2_1 = get_substitutions2 ([["foo"],["there"]], "foo") = []
val test_get_substitutions2_2 = get_substitutions2 ([["foo", "bar"],["there"]], "foo") = ["bar"]
val test_get_substitutions2_3 = get_substitutions2 ([["there"]], "foo") = []
val test_get_substitutions2_4 = get_substitutions2 ([["there", "foo"], ["foo", "there"]], "foo") = ["there", "there"]
val test_get_substitutions2_5 = get_substitutions2 ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick", "Freddie", "F"]

val test_similar_names_1 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]



val test_card_eq_1 = card_eq((Clubs, Num 2), (Clubs, Num 2)) = true
val test_card_eq_2 = card_eq((Hearts, King), (Hearts, Num 2)) = false
val test_card_eq_3 = card_eq((Diamonds, Num 2), (Clubs, Num 2)) = false


val test_card_color_1 = card_color (Clubs, Num 2) = Black

val test_card_value_1 = card_value (Clubs, Num 2) = 2
val test_card_value_2 = card_value (Clubs, King) = 10
val test_card_value_3 = card_value (Clubs, Ace) = 11

val test_remove_card_1 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val test_remove_card_2 = remove_card ([(Hearts, Ace), (Diamonds, Num 2)], (Hearts, Ace), IllegalMove) = [(Diamonds, Num 2)]
val test_remove_card_3 = (remove_card ([(Diamonds, Num 2)], (Hearts, Ace), IllegalMove) handle IllegalMove => []) = []

val test_all_same_color_1 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true
val test_all_same_color_2 = all_same_color [(Hearts, Ace), (Clubs, Ace)] = false

(*
val test9 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4

val test10 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4

val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true)
             
              *)            
