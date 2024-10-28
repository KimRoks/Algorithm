func getMinClockNumber(_ numbers: [Int]) -> Int {
    let rotations = [
        numbers[0] * 1000 + numbers[1] * 100 + numbers[2] * 10 + numbers[3],
        numbers[1] * 1000 + numbers[2] * 100 + numbers[3] * 10 + numbers[0],
        numbers[2] * 1000 + numbers[3] * 100 + numbers[0] * 10 + numbers[1],
        numbers[3] * 1000 + numbers[0] * 100 + numbers[1] * 10 + numbers[2]
    ]
    return rotations.min()!
}

var clockNumbers = Set<Int>()
for i in 1111...9999 {
    let temp = [i / 1000, (i / 100) % 10, (i / 10) % 10, i % 10]
    if temp.contains(0) {
        continue
    }
    let clockNumber = getMinClockNumber(temp)
    clockNumbers.insert(clockNumber)
}

let sortedClockNumbers = Array(clockNumbers).sorted()

var input = readLine()!.split(separator: " ").map { Int($0)! }
let myMinClockNumber = getMinClockNumber(input)

if let position = sortedClockNumbers.firstIndex(of: myMinClockNumber) {
    print(position + 1)
}
