let n = Int(readLine()!)!

let input = readLine()!.split(separator: " ").map{Int($0)!}

var human: [(Int,Int)] = []
for i in 1...n {
    // 키순, 왼쪽 사람 수
    human.append((i, input[i - 1]))
}

var resultArray = Array(repeating: 0, count: n)

while !human.isEmpty {
    let shortestMan = human.removeFirst()
    
    var count = 0
    
    for i in 0..<n {
        if resultArray[i] == 0 {
            if count == shortestMan.1 {
                resultArray[i] = shortestMan.0
                break
            }
            count += 1
        }
    }
}

print(resultArray.map { String($0)}.joined(separator: " ") )


