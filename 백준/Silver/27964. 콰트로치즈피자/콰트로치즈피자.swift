let n = Int(readLine()!)!

let input = readLine()!.split(separator: " ").map{String($0)}
var arr = [String]()
var count = 0

for i in 0..<input.count{
    if arr.contains(input[i]) == false {
        arr.append(input[i])
    }
}

for i in 0..<arr.count {
    let value = arr[i].suffix(6)
    if value == "Cheese" {
        count += 1
    }
}

if count >= 4 {
    print("yummy")
} else {
    print("sad")
}


