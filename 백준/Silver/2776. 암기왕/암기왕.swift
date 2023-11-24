let t = Int(readLine()!)!
for _ in 1...t {
    let n = Int(readLine()!)!
    let note1 = readLine()!.split(separator: " ").map{ Int($0)!}.sorted()
    _ = Int(readLine()!)!
    let note2 = readLine()!.split(separator: " ").map{Int($0)!}
    var result: String = ""
    for i in 0..<note2.count {
        var left = 0
        var right = n - 1
        var check: Bool = false

        while left <= right {
            let mid = (left + right) / 2
            
            if note2[i] < note1[mid] {
                right = mid - 1
            } else if note2[i] > note1[mid]{
                left = mid + 1
            } else {
                check = true
                break
            }
        }
        
        if check == true {
            result += "1\n"
        } else {
            result += "0\n"
        }
    }
    result.popLast()
    print(result)
}
