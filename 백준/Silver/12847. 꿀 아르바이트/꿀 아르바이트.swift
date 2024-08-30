let nm = readLine()!.split(separator: " ").map{ Int($0)! }

let (n,m) = (nm[0], nm[1])

var input = [0] + readLine()!.split(separator: " ").map{ Int($0)! }


for i in 1...n {
    input[i] += input[i - 1]
}

var maxSum = 0
for i in m...n {
    let currentSum = input[i] - input[i - m]
    maxSum = max(maxSum, currentSum)
}

print(maxSum)
