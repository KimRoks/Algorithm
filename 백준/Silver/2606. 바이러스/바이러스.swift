let computer = Int(readLine()!)!
let pairComputer = Int(readLine()!)!

var gragh = [[Int]](repeating: [], count: computer)
var isVisted = [Bool](repeating: false, count: computer)
var infectedCount = 0

for _ in 0..<pairComputer {
    //인덱스 번호로 쓸거니까 - 1
    let xy = readLine()!.split(separator: " ").map { Int($0)! - 1}
    
    let (x,y) = (xy[0], xy[1])
    
    gragh[x].append(y)
    gragh[y].append(x)
}

for i in 0..<computer {
    gragh[i].sort(by: <)
}


func dfs(_ index: Int) {
    isVisted[index] = true
    for vertex in gragh[index] {
        if !isVisted[vertex] {
            infectedCount += 1

            dfs(vertex)
        }
    }
}

dfs(0)

print(infectedCount)
