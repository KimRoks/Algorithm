let input = readLine()!.split(separator: " ").map{Int($0)!}

var result = 0
for i in input {
    result += i * i
}

print(result % 10)
