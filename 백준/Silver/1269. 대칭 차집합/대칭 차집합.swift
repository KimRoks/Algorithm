let nm = readLine()!.split(separator: " ").map{Int($0)!}

let a = Set(readLine()!.split(separator: " ").map{Int($0)!})

let b = Set(readLine()!.split(separator: " ").map{Int($0)!})

let aCount = a.subtracting(b).count
let bCount = b.subtracting(a).count

print(aCount + bCount)
