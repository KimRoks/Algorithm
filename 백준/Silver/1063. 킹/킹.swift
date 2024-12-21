import Foundation

let directions: [String: (Int, Int)] = [
    "R": (0, 1),
    "L": (0, -1),
    "B": (-1, 0),
    "T": (1, 0),
    "RT": (1, 1),
    "LT": (1, -1),
    "RB": (-1, 1),
    "LB": (-1, -1)
]

func positionToCoords(_ pos: String) -> (Int, Int) {
    let row = Int(pos.last!.asciiValue!) - 49 // '1' -> 0
    let col = Int(pos.first!.asciiValue!) - 65 // 'A' -> 0
    return (row, col)
}

func coordsToPosition(_ coords: (Int, Int)) -> String {
    let row = String(UnicodeScalar(coords.1 + 65)!) // 0 -> 'A'
    let col = String(coords.0 + 1) // 0 -> '1'
    return row + col
}

func isValid(_ coords: (Int, Int)) -> Bool {
    return coords.0 >= 0 && coords.0 < 8 && coords.1 >= 0 && coords.1 < 8
}

let inputs = readLine()!.split(separator: " ").map { String($0) }
var kingPos = positionToCoords(inputs[0])
var stonePos = positionToCoords(inputs[1])
let n = Int(inputs[2])!

for _ in 0..<n {
    let command = readLine()!
    let (dr, dc) = directions[command]!

    let nextKingPos = (kingPos.0 + dr, kingPos.1 + dc)

    if isValid(nextKingPos) {
        if nextKingPos == stonePos {
            let nextStonePos = (stonePos.0 + dr, stonePos.1 + dc)
            if isValid(nextStonePos) {
                stonePos = nextStonePos
                kingPos = nextKingPos
            }
        } else {
            kingPos = nextKingPos
        }
    }
}

print(coordsToPosition(kingPos))
print(coordsToPosition(stonePos))
