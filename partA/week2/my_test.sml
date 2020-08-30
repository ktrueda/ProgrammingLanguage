(* test code for is_older *)
val is_older_1 = is_older ((2020, 1, 1), (2020, 1, 2)) = true
val is_older_2 = is_older ((2020, 1, 1), (2020, 2, 1)) = true
val is_older_3 = is_older ((2020, 1, 1), (2021, 1, 1)) = true
val is_older_4 = is_older ((2020, 1, 2), (2020, 1, 1)) = false
val is_older_5 = is_older ((2020, 2, 1), (2020, 1, 1)) = false
val is_older_6 = is_older ((2021, 1, 1), (2020, 1, 1)) = false
val is_older_7 = is_older ((2020, 1, 1), (2020, 1, 1)) = false


(* test code for number_in_month *)
val number_in_month_1 = number_in_month ([(2020, 2, 1)], 2) = 1 
val number_in_month_2 = number_in_month ([(2020, 2, 1), (2019, 2, 4)], 2) = 2
val number_in_month_3 = number_in_month ([(2020, 2, 1), (2019, 2, 3), (2019, 2,4), (2020, 4, 4)], 2) = 3
val number_in_month_4 = number_in_month ([], 2) = 0
val number_in_month_5 = number_in_month ([(2020, 2, 1)], 5) = 0


(* test code for number_in_months *)
val number_in_months_1 = number_in_months ([(2020, 1, 1), (2019, 2, 3), (2019,3,4), (2020, 4, 4)], [1, 2, 3]) = 3 
val number_in_months_2 = number_in_months ([], [1, 2, 3]) = 0
val number_in_months_3 = number_in_months ([(2020, 1, 1)], [4, 2, 3]) = 0
val number_in_months_4 = number_in_months ([], []) = 0


(* test code for dates_in_month *)
val dates_in_month_1 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val dates_in_month_2 = dates_in_month ([],2) = []
val dates_in_month_3 = dates_in_month ([(2012,2,28),(2013,2,1)],2) = [(2012,2,28), (2013, 2, 1)]


(* test code for dates_in_months *)
val test_dates_in_months_1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31)],[2,3,4]) = [(2012,2,28),(2011,3,31)]
val test_dates_in_months_2 = dates_in_months ([],[2,3,4]) = []
val test_dates_in_months_3 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31)],[]) = []
val test_dates_in_months_4 = dates_in_months ([],[]) = []


(* test code for get_nth*)
val test_get_nth_1 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"


(* test code for date_to_string*)
val test_date_to_string = date_to_string (2013, 6, 1) = "June 1, 2013"


(* test code for number_before_reaching_sum *)
val test_nbrs_1 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val test_nbrs_2 = number_before_reaching_sum (1, [1,2,3,4,5]) = 0
val test_nbrs_3 = number_before_reaching_sum (1, [2,2,3,4,5]) = 0
val test_nbrs_4 = number_before_reaching_sum (10, [1,2,3,4]) = 3


(* test code for what_month *)
val test_what_month_1 = what_month 70 = 3
val test_what_month_2 = what_month 32 = 2
val test_what_month_3 = what_month 1 = 1
val test_what_month_4 = what_month 365 = 12
val test_what_month_5 = what_month 364 = 12
val test_what_month_6 = what_month 31 = 1
val test_what_month_7 = what_month 59 = 2


(* test code for manth_range *)
val test_month_range_1 = month_range (31, 34) = [1,2,2,2]
val test_month_range_2 = month_range (364, 365) = [12, 12]
val test_month_range_3 = month_range (5, 3) = []


(* test code for oldest *)
val test_oldest_1 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test_oldest_2 = oldest([]) = NONE


