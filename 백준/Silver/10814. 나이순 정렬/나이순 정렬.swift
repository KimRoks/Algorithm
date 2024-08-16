let n = Int(readLine()!)!
var result = [(Int, String)]()

for _ in 0..<n {
    let an = readLine()!.split(separator: " ")
    
    let age = Int(an[0])!
    let name = String(an[1])
    
    result.append((age, name))
}

result.sort {
    $0.0 < $1.0
}

for i in 0..<n {
    print(result[i].0, result[i].1)
}
