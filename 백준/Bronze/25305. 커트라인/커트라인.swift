let nk = readLine()!.split(separator: " ").map{Int($0)!}

let (n,k) = (nk[0], nk[1])

var input = readLine()!.split(separator: " ").map{Int($0)!}

input.sort(by: >)

print(input[k - 1])
