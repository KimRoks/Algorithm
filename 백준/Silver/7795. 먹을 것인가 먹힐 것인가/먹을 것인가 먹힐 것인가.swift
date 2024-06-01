let testcase = Int(readLine()!)!

for _ in  0..<testcase{
    var result = 0
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let Aarray = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    let Barray = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
    
    for a in Aarray {
        var left = 0
        var right = Barray.count - 1
        
        while left <= right {
            let mid = (left + right) / 2
            
            if Barray[mid] < a {
                left = mid + 1
            } else {
                right = mid - 1
            }
            
        }
        result += left
    }
print(result)
    
}
