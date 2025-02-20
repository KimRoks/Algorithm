let n = Int(readLine()!)!

var set = Set<String>()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ String($0)}
    
    if input[1] == "enter" {
        set.insert(input[0])
    } else {
        set.remove(input[0])
    }
}

var resultArr = Array(set).sorted {
    $0 > $1
}
resultArr.forEach {
    print($0)
}
