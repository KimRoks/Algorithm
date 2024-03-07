let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var board = [[Character]]()

for _ in 0..<n {
    board.append(Array(readLine()!))
}

var minChange = 64

for i in 0...n-8 {
    for j in 0...m-8 {
        var blackFirst = 0
        var whiteFirst = 0
        for m in 0..<8 {
            for n in 0..<8 {
                if (m+n) % 2 == 0 {
                    if board[i+m][j+n] != "B" { blackFirst += 1 }
                    if board[i+m][j+n] != "W" { whiteFirst += 1 }
                } else {
                    if board[i+m][j+n] != "W" { blackFirst += 1 }
                    if board[i+m][j+n] != "B" { whiteFirst += 1 }
                }
            }
        }
        minChange = min(minChange, blackFirst, whiteFirst)
    }
}

print(minChange)

