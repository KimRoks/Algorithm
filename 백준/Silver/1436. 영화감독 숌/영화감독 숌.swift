extension Int {
    func isDevilNumber() -> Bool {
        var number = self
        while number >= 666 {
            if number % 1000 == 666 {
                return true
            }
            number /= 10
        }
        return false
    }
}

let n = Int(readLine()!)!
var index = 0

var devilNumbers: [Int] = []
var number = 666

while index < n {
    if number.isDevilNumber() {
        devilNumbers.append(number)
        index += 1
    }
    number += 1
}

print(devilNumbers[n - 1])
