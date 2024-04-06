let n = Int(readLine()!)!

let target = readLine()!.split(separator: " " ).map{ Int($0)! }
let (start, end) = (target[0], target[1])

let m = Int(readLine()!)!


var isVisited = [Bool](repeating: false, count: n + 1)
var graph = [[Int]](repeating: [], count: n + 1)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map{ Int($0)! }
    let (a,b) = (ab[0],ab[1])
    graph[a].append(b)
    graph[b].append(a)
}

var result = 0
var isSuccess = false

func dfs(_ start: Int, count: Int) {
    isVisited[start] = true
    if start == end {
        result = count
        isSuccess = true
        
        return
    }
    
    
    for vertex in graph[start] {
        if !isVisited[vertex] {
            dfs(vertex, count: count + 1)
        }
    }
}


dfs(start, count: 0)
result = isSuccess ? result : -1
print(result)


