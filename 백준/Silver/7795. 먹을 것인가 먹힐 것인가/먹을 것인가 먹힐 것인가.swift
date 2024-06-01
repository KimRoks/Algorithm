let testcase = Int(readLine()!)!

for _ in  0..<testcase{
    var result = 0
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let Aarray = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    let Barray = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
    
    for i in Aarray {
        for j in Barray {
            if i > j {
                result += 1
            } else {
                break
            }
        }
    }
    
    print(result)
}
