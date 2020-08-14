
fun sqrt_of_abs i = (Math.sqrt o Real.fromInt o abs) i


val ans = sqrt_of_abs 5
