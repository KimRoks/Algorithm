let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let (n,m) = (nm[0], nm[1])

var dic = Dictionary<String, String>()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    let (site,password) = (input[0], input[1])
    
    dic.updateValue(password, forKey: site)
}

for _ in 0..<m {
    let result = readLine()!
    
    print(dic[result]!)
}
