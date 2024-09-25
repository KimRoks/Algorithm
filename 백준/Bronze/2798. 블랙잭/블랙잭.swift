let nm = readLine()!.split(separator: " ").map{Int($0)!}

let (n,m) = (nm[0], nm[1])

let input = readLine()!.split(separator: " ").map{Int($0)!}

var result = 0

for i in 0..<n {
    for j in i+1..<n {
        for k in j+1..<n{
            let blackJack = input[i] + input[j] + input[k]
            if blackJack <= m {
              result = max(result, blackJack )
            }
        }
    }
}

print(result)




