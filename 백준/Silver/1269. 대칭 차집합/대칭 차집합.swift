let nm = readLine()!.split(separator: " ").map{Int($0)!}

let a = Set(readLine()!.split(separator: " ").map{Int($0)!})

var resultA = a

let b = Set(readLine()!.split(separator: " ").map{Int($0)!})

var resultB = b

resultA.subtract(resultB)

resultB.subtract(a)

print(resultA.count + resultB.count)
