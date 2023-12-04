let input = readLine()!.split(separator: " ").map { Double($0)! }
let (a,b) = (input[0], input[1])

if a > b {
    print(">")
} else if a < b {
    print("<")
} else {
    print("==")
}

