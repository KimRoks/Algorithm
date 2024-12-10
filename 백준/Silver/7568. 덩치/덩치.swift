let n = Int(readLine()!)!

var userInfo: [(weigth: Int, height: Int)] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    
    let weight = input[0]
    let height = input[1]
    
    userInfo.append((weight, height))
}

var rank = Array(repeating: 1, count: n)

for i in 0..<n {
    for j in 0..<n {
        if i != j {
            if userInfo[i].weigth < userInfo[j].weigth && userInfo[i].height < userInfo[j].height {
                
                rank[i] += 1
            }
        }
    }
}

print(rank.map{String($0)}.joined(separator: " "))
