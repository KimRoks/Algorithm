let n = Int(readLine()!)!
let k = Int(readLine()!)!

var input = readLine()!.split(separator: " ").map{Int($0)!}
input.sort()

if k >= n {
    print(0)
} else {
    var gaps: [Int] = []
    for i in 0..<input.count-1 {
        gaps.append(abs(input[i]-input[i+1]))
    }
    gaps.sort(by: >)
    print(gaps[(k-1)...].reduce(0, +))
}
