let input = readLine()!.split(separator: " ").map { Int($0)! }

let standardPieces = [1, 1, 2, 2, 2, 8]

for i in 0..<standardPieces.count {
    print(standardPieces[i] - input[i], terminator: " ")
}
