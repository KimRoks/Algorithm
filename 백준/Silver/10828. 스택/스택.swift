let n = Int(readLine()!)!

var arr = [Int]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    
    if input[0] == "push" {
        arr.append(Int(input[1])!)
    }
    
    if input[0] == "pop" {
        if !arr.isEmpty {
            print(arr.popLast()!)
        } else {
            print(-1)
        }
    }
    
    if input[0] == "size" {
        print(arr.count)
    }
    
    if input[0] == "empty" {
        if arr.isEmpty {
            print(1)
        } else {
            print(0)
        }
    }
    
    if input[0] == "top" {
        if arr.isEmpty {
            print(-1)
        } else {
            print(arr.last!)
        }
    }
}
