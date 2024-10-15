let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let t = input[0]
    var arr = Array(input[1...])
    var count = 0
    for i in 1..<arr.count {
        let key = arr[i]
        var j = i - 1
        while j >= 0 && arr[j] > key {
            arr[j + 1] = arr[j]
            count += 1
            j -= 1
        }
        arr[j + 1] = key
    }

    print(t, count)
}
