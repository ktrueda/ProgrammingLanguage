(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

val test_only_capitals_1 = only_capitals ["A","B","C"] = ["A","B","C"]
val test_only_capitals_2 = only_capitals ["A","b","c"] = ["A"]
val test_only_capitals_3 = only_capitals [] = []

val test_longest_string1_1 = longest_string1 ["A","bc","C"] = "bc"
val test_longest_string1_2 = longest_string1 [] = ""
val test_longest_string1_3 = longest_string1 ["ab", "bc"] = "ab"

val test_longest_string2_1 = longest_string2 ["A","bc","C"] = "bc"
val test_longest_string2_2 = longest_string2 [] = ""
val test_longest_string2_3 = longest_string2 ["ab", "bc"] = "bc"

val test_longest_string3_1 = longest_string3 ["A","bc","C"] = "bc"
val test_longest_string3_2 = longest_string3 [] = ""
val test_longest_string3_3 = longest_string3 ["ab", "bc"] = "ab"

val test_longest_string4_1 = longest_string4 ["A","bc","C"] = "bc"
val test_longest_string4_2 = longest_string4 [] = ""
val test_longest_string4_3 = longest_string4 ["ab", "bc"] = "bc"

val test_longest_capitalized_1 = longest_capitalized ["A","bc","C"] = "A"
val test_longest_capitalized_2 = longest_capitalized ["a","bc","c"] = ""
val test_longest_capitalized_3 = longest_capitalized [] = ""

val test_rev_string_1 = rev_string "abc" = "cba"
val test_rev_string_2 = rev_string "" = ""

val test_first_answer_1 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val test_first_answer_2 = first_answer (fn x => if (x mod 2) = 0 then SOME x else NONE) [1,2,3,4,5] = 2
val test_first_answer_3 = ((first_answer (fn x => if x > 300 then SOME x else NONE) [1,2,3,4,5] = ~1)
                          handle NoAnswer => true)

val test_all_answers_1 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test_all_answers_2 = all_answers (fn x => if x = 1 then SOME [x, x+1] else NONE) [1] = SOME [1, 2]
val test_all_answers_3 = all_answers (fn x => if (x mod 2) = 0 then SOME [x, x+1] else NONE) [0, 1, 2] = SOME [2,3,0,1]

val test_count_wildcards_1 = count_wildcards Wildcard = 1
val test_count_wildcards_2 = count_wildcards (Variable("foo")) = 0
val test_count_wildcards_3 = count_wildcards UnitP = 0
val test_count_wildcards_4 = count_wildcards (ConstP(1)) = 0
val test_count_wildcards_5 = count_wildcards (TupleP([Wildcard])) = 1
val test_count_wildcards_6 = count_wildcards (ConstructorP("bar", Wildcard)) = 1
val test_count_wildcards_7 = count_wildcards (TupleP([Wildcard, Wildcard])) = 2
val test_count_wildcards_8 = count_wildcards (ConstructorP("bar", UnitP)) = 0

val test_count_wild_and_variable_length_1 = count_wild_and_variable_lengths Wildcard = 1
val test_count_wild_and_variable_length_2 = count_wild_and_variable_lengths (Variable("foo")) = 3
val test_count_wild_and_variable_length_3 = count_wild_and_variable_lengths UnitP = 0
val test_count_wild_and_variable_length_4 = count_wild_and_variable_lengths (ConstP(1)) = 0
val test_count_wild_and_variable_length_5 = count_wild_and_variable_lengths (TupleP([Wildcard])) = 1
val test_count_wild_and_variable_length_6 = count_wild_and_variable_lengths (ConstructorP("bar", Wildcard)) = 1
val test_count_wild_and_variable_length_7 = count_wild_and_variable_lengths (TupleP([Variable("foo"), Variable("bar")])) = 6
val test_count_wild_and_variable_length_8 = count_wild_and_variable_lengths (ConstructorP("bar", UnitP)) = 0

val test_count_some_var_1 = count_some_var ("x", Variable("x")) = 1
val test_count_some_var_2 = count_some_var ("x", Variable("y")) = 0
val test_count_some_var_3 = count_some_var ("x", Wildcard) = 0
val test_count_some_var_4 = count_some_var ("x", TupleP([Variable("x"), Variable("y")])) = 1

(*
val test10 = check_pat (Variable("x")) = true

val test11 = match (Const(1), UnitP) = NONE

val test12 = first_match Unit [UnitP] = SOME []

*)
