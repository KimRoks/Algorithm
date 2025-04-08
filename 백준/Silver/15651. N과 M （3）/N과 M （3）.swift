let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var nums = [Int]()
var result = ""

func dfs() {
    if nums.count == m {
        result += nums.map(String.init).joined(separator: " ") + "\n"
        return
    }
    
    for i in 1...n {
        nums.append(i)
        dfs()
        nums.removeLast()
    }
}

dfs()
print(result)
