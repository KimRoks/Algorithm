let nm = readLine()!.split(separator: " ").map{Int($0)!}
var (n,m) = (nm[0],nm[1])

var guitarString = [(Int,Int)]()
var result = 0

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    //패키지는 6개입
    let (package, each) = (input[0], input[1])
    guitarString.append((package, each))
}

var cheaperPackage = guitarString[0].0
var cheaperEach = guitarString[0].1

for i in 0..<m {
    cheaperPackage = min(cheaperPackage, guitarString[i].0)
    cheaperEach = min(cheaperEach, guitarString[i].1)
}

while n != 0 {
    if n > 6 {
        result += min(cheaperPackage, cheaperEach * 6)
        n -= 6
    } else if  n <= 6 {
        result += min(cheaperEach * n, cheaperPackage)
        break
    }
    
}

print(result)

