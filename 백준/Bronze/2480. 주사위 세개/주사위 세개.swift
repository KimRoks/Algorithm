let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b, c) = (input[0], input[1], input[2])

var prize: Int = 0

if a == b && b == c {
    prize = 10000 + a * 1000
} else if a == b || a == c {
    prize = 1000 + a * 100
} else if b == c {
    prize = 1000 + b * 100
} else {
    prize = max(a, b, c) * 100
}

print(prize)
