let n = Int(readLine()!)!
let nArray = readLine()!.split(separator: " ").map { Int($0)! }
let nSet = Set(nArray)

let m = Int(readLine()!)!
let mArray = readLine()!.split(separator: " ").map { Int($0)! }

for i in 0..<mArray.count {
    if nSet.contains(mArray[i]) {
        print(1)
    } else {
        print(0)
    }
}
