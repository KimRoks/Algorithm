let n = Int(readLine()!)!

// 7초에 한명 죽고 4초에 한명씩 태어남
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    let (p,t) = (input[0], input[1])
    
    let born = t / 4
    let death = t / 7
    
    let result = p + born - death
    
    print(result)
}
