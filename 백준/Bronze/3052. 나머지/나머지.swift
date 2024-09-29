var input = Set<Int>()

for _ in 1...10 {
    input.insert(Int(readLine()!)! % 42)
}

print(input.count)
