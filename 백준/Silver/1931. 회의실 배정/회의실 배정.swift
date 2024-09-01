let n = Int(readLine()!)!

var timeTable = [(Int,Int)]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    
    timeTable.append((input[0],input[1]))
}

timeTable.sort {
    if $0.1 == $1.1 {
        return $0.0 < $1.0
    } else {
        return $0.1 < $1.1
    }
}

var count = 0
var endTime = 0

for time in timeTable {
    if time.0 >= endTime {
        endTime = time.1
        count += 1
    }
}

print(count)
