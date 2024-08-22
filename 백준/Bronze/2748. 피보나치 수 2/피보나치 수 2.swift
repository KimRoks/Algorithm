let input = Int(readLine()!)!

var fibo = [Int](repeating: 0, count: 91)

fibo[0] = 0
fibo[1] = 1

for i in 2..<91 {
    fibo[i] = fibo[i - 1] + fibo[i - 2]
}

print(fibo[input])
