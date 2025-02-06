let x = Int(readLine()!)!

let n = Int(readLine()!)!

var result = 0

for _ in 0..<n {
    let ab = readLine()!.split(separator: " ").map{Int($0)!}
    
    let (a,b) = (ab[0], ab[1])
    
    result += a * b
}

result == x ? print("Yes") : print("No")
