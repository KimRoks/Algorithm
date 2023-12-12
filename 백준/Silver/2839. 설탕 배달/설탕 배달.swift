var N = Int(String(readLine()!))!
var result = 0

while N >= 3 {
    if N % 5 == 0 {
        result += 1
        N -= 5
    } else {
        N -= 3
        result += 1
    }
}

if N == 0 {
    print(result)
} else {
    print(-1)
}

