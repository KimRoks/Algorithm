let input = readLine()!.split(separator: " ").map{ Int($0)! }

let n = input[0]
let m = input[1]

var resultArr: [Int] = []

func dfs(_ start: Int) {
    if resultArr.count == m {
        print(resultArr.map { String($0) }.joined(separator: " "))
        return
    }
    
    if start > n { return }
    
    for i in start...n {
        resultArr.append(i)
        dfs(i + 1)
        resultArr.removeLast()
    }
}
dfs(1)
