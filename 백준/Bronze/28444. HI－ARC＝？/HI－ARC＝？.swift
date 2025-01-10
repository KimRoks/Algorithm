let input = readLine()!.split(separator: " ").map{Int($0)!}

let (h,i,a,r,c) = (input[0],input[1],input[2],input[3],input[4])

print(h * i - a * r * c)
