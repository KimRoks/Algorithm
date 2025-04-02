let input = readLine()!
let one = input.split(separator: "1").count
let zero = input.split(separator: "0").count

print(min(one,zero))
