let n = Int(readLine()!)!

let input = readLine()!.split(separator: " ").map{Int($0)!}

let findNum = Int(readLine()!)!

var result = 0
for i in input {
    if i == findNum {
        result += 1
    }
}

print(result)
