let n = Int(readLine()!)!

var xy = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    xy.append(input)
}

var line = [[Int]]()
line.append([xy[0][0], xy[0][1]])
var count = 0

for i in 1..<n{
    let currentX = line[count][0]
    let currentY = line[count][1]
    
    let nextX = xy[i][0]
    let nextY = xy[i][1]
    
    if currentY <= nextY && currentY >= nextX{
        let newLine = [currentX,nextY]
        
        line[count] = newLine
    } else if currentX < nextX && currentY < nextY {
        let newLine = [nextX,nextY]
        line.append(newLine)
        count += 1
    } else {
        continue
    }
}

var result = 0
for item in line {
    result += item[1] - item[0]
}
print(result)
