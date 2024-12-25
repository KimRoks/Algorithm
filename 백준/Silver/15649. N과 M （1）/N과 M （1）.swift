let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var queue: [(current: [Int], depth: Int)] = []
queue.append(([], 0))

while !queue.isEmpty {
    let (current, depth) = queue.removeFirst()

    if depth == m {
        print(current.map { String($0) }.joined(separator: " "))
        continue
    }

    for i in 1...n {
        if !current.contains(i) {
            queue.append((current + [i], depth + 1))
        }
    }
}
