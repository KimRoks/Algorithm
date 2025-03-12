let n = Int(readLine()!)!

var result: [Int] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    
    let order = input[0]
    
    if order == 1 {
        result.append(input[1])
    } else if order == 2 {
        if result.isEmpty {
            print(-1)
        }  else {
            print(result.removeLast())
        }
    } else if order == 3 {
        print(result.count)
    } else if order == 4 {
        if result.isEmpty {
            print(1)
        } else {
            print(0)
        }
    } else  {
        if result.isEmpty {
            print(-1)
        } else {
            print(result.last!)
        }
    }
}
