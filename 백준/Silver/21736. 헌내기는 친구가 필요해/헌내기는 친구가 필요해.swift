let nm = readLine()!.split(separator: " ").map{Int($0)!}

let dm = [0,0,-1,1]
let dn = [1,-1,0,0]

let (n,m) = (nm[0], nm[1])

var graph = [[String.Element]]()

var isVisited = Array(
    repeating:
        Array(
            repeating: false,
            count: m
        ),
    count: n
)


for _ in 0..<n {
    let input = Array(readLine()!)
    graph.append(input)
}

var count = 0

func bfs(startM: Int, startN: Int) {
    isVisited[startM][startN] = true
    var queue = [[startM, startN]]
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        let currentM = current[0]
        let currentN = current[1]
    
        for i in 0..<4 {
            let nextM = currentM + dm[i]
            let nextN = currentN + dn[i]
            
            if nextM < n, nextM >= 0, nextN < m, nextN >= 0 {
                if isVisited[nextM][nextN] == false,
                   graph[nextM][nextN] != "X" {
                    queue.append([nextM, nextN])
                    isVisited[nextM][nextN] = true
                    if graph[nextM][nextN] == "P" {
                        count += 1
                    }
                }
            }
        }
    }
}

for i in 0..<n {
    for j in 0..<m {
        if isVisited[i][j] != true, graph[i][j] == "I" {
            bfs(startM: i, startN: j)
        }
    }
}

count > 0 ? print(count) : print("TT")
