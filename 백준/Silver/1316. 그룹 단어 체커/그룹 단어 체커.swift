import Foundation

let n = Int(readLine()!)!
var count = 0

for _ in 0..<n {
    let input = readLine()!
    var isGroupWord = true
    var seenCharacters: Set<Character> = []
    var previousChar: Character? = nil

    for char in input {
        if char != previousChar && seenCharacters.contains(char) {
            isGroupWord = false
            break
        }
        seenCharacters.insert(char)
        previousChar = char
    }

    if isGroupWord {
        count += 1
    }
}

print(count)
