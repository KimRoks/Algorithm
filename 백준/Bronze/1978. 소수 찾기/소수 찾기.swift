import Foundation

func isPrime(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    }
    if number < 4 {
        return true
    }
    if number % 2 == 0 {
        return false
    }
    let sqrtNum = Int(sqrt(Double(number)))
    for i in stride(from: 3, through: sqrtNum, by: 2) {
        if number % i == 0 {
            return false
        }
    }
    return true
}

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }

var primeCount = 0
for number in numbers {
    if isPrime(number) {
        primeCount += 1
    }
}

print(primeCount)
