let n = Int(readLine()!)!


for _ in 0..<n {
    let input = Array(readLine()!)
    
    var count = 0
    for i in input {
        if i == "(" {
            count += 1
        } else if i == ")" {
            count -= 1
            if count < 0 {
                break
            }
        }
    }
    
    if count == 0 {
        print("YES")
    } else {
        print("NO")
    }
}
