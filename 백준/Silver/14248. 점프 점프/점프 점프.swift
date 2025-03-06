let n = Int(readLine()!)!

let graph = readLine()!.split(separator: " ").map { Int($0)! }

let s = Int(readLine()!)! - 1

var isvisited = Array(repeating: false, count: n)

let direction = [-1, 1]

func dfs(position: Int) {
    
    if position < 0 || position >= n || isvisited[position] == true {
        return
    }
    
    isvisited[position] = true
    
    let jump = graph[position]
    
    for dir in direction {
        let next = position + jump * dir
        dfs(position: next)
    }
}

dfs(position: s)
let resultCount = isvisited.filter { $0 }.count
print(resultCount)
