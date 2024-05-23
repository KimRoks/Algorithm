let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a,b) = (input[0], input[1])

func calculate(_ a: Int, _ b: Int) {
    print(a + b)
    print(a - b)
    print(a * b)
    print(a / b)
    print(a % b)
}

calculate(a, b)
