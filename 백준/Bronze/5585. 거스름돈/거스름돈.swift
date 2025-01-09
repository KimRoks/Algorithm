import Foundation

let input = Int(readLine()!)!
var change = 1000 - input
var ChangeCount = 0

while change != 0 {
    if change / 500 >= 1 {
        change -= 500
        ChangeCount += 1
    } else if change / 100 >= 1 {
        change -= 100
        ChangeCount += 1
    } else if change / 50 >= 1 {
        change -= 50
        ChangeCount += 1
    } else if change / 10 >= 1 {
        change -= 10
        ChangeCount += 1
    } else if change / 5 >= 1 {
        change -= 5
        ChangeCount += 1
    } else if change / 1 >= 1 {
        change -= 1
        ChangeCount += 1
    }
}

print(ChangeCount)
