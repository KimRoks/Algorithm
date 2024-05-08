let testCase = Int(readLine()!)!

var nosun = [[Int]]()
var result = [[Int]]()
var count = 0

for _ in 0..<testCase {
    let SEC = readLine()!.split(separator: " ").map({ Int($0)! })
    nosun.append(SEC)
}

nosun.sort { $0[0] < $1[0] }

result.append(nosun[0])

for i in 0..<nosun.count {
    if result.isEmpty {
        result.append(nosun[i])
        continue
    } else {
        if result[count][1] >= nosun[i][0] {
            if result[count][1] < nosun[i][1] {
                result[count][1] = nosun[i][1]
            }
            if result[count][2] > nosun[i][2] {
                result[count][2] = nosun[i][2]
            }
        } else {
            result.append(nosun[i])
            count += 1
        }
    }
}

print(result.count)

for row in result{
    print(row.map { String($0) }.joined(separator: " "))
}
