let n = Int(readLine()!)!

var arr = [String]()
var count = 0
for _ in 0..<n {
    let input = readLine()!
    arr.append(input)
    count = input.count
}

var resultCount = 1

while true {
    var seen = Set<String>()
    var isUnique = true
    
    for num in arr {
        let suffix = num.dropFirst(count - resultCount)
        
        if seen.contains(String(suffix)) {
            isUnique = false
            break
        }
        seen.insert(String(suffix))
    }
    
    if isUnique {
        break
    }
    
    resultCount += 1
}

print(resultCount)
