
val sorted3 = fn x => fn y => fn z => z >= y andalso y >= x

val ans_1 = sorted3 4
val ans_2 = sorted3 4 5
val ans_3 = sorted3 4 5 6
