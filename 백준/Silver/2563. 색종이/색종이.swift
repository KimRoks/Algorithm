let n = Int(readLine()!)!

var wholeSquare = Array(
    repeating: Array(
        repeating: 0, count: 100),
    count: 100
)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    
    let x = input[0]
    let y = input[1]
    
    //사각형이 되는 부분을 색칠해줌
    for i in x..<x+10 {
        for j in y..<y+10 {
            wholeSquare[i][j] += 1
        }
    }
}

var result = 0

for i in 0..<100 {
    for j in 0..<100 {
        if wholeSquare[i][j] >= 1 {
            result += 1
        }
    }
}

print(result)
