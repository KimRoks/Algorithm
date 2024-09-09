let a = Int(readLine()!)!
let b = Int(readLine()!)!
let c = Int(readLine()!)!

let result = String(a * b * c)
var resultArr = Array(result)
var arr = Array(repeating: 0, count: 10)

for char in resultArr {
    if let num = Int(String(char)) {
        arr[num] += 1
    }
}

for i in 0..<arr.count {
    print(arr[i])
}
