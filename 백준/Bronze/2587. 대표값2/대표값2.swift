var input = [Int]()

for _ in 1...5 {
    input.append(Int(readLine()!)!)
}

print(input.reduce(0, +) / 5)
input.sort()
print(input[2])
