let n = Int(readLine()!)!
var set = Set<String>()
var count = 0

for _ in 0..<n {
    let input = readLine()!
    
    if input == "ENTER" {
        count += set.count
        set.removeAll()
    } else {
        set.insert(input)
    }
}

count += set.count

print(count)
