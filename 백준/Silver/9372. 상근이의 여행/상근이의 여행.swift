for _ in 0..<Int(readLine()!)! {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])
    
    var count = 0
    var countries = [Int](0..<n)
    for _ in 0..<m {
        let ab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
        let (a, b) = (ab[0], ab[1])
        
        let aP = find(a)
        let bP = find(b)
        if aP != bP {
            count += 1
            union(a, b)
        }
    }
    
    print(count)
    
    func find(_ index: Int) -> Int {
        if countries[index] == index {
            return index
        }
        return find(countries[index])
    }
    
    func union(_ a: Int, _ b: Int) {
        let aP = find(a)
        let bP = find(b)
        
        countries[bP] = aP
    }
}