let a = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
let b = Int(readLine()!)!
var x = 0

for i in 0..<a {
    if arr[i] != 0 && arr[i] <= b {
        x += 1
    } else if arr[i] == 0 {
        continue
    } else {
        if arr[i] % b != 0 {
            x += (arr[i] / b) + 1
        } else {
            x += arr[i] / b
        }
    }
}

print(b * x)
