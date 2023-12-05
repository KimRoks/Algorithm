let N = Int(readLine()!)!
let M = Int(readLine()!)!
var arr = [Int](0...N)



func find(_ index: Int) -> Int {
    if arr[index] == index {
        return index
    }
    arr[index] = find(arr[index])
    return arr[index]
}

func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    
    arr[bP] = aP
}

for i in 1...N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    for j in 0..<N {
        if input[j] == 1 {
            union(i, j + 1)
        }
    }
    
}

let dd = readLine()!.split(separator: " ").map { Int($0)! }
func ff() {
    for i in 0..<dd.count {
        if find(dd[i]) != find(dd[0]) {
            print("NO")
            return
        }
    }
    print("YES")
}
ff()


