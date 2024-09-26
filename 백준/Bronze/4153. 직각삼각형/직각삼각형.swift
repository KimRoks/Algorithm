while true {
    var input = readLine()!.split(separator: " ").map{ Int($0)! }
    
    if input == [0, 0, 0] {
        break
    }

    input.sort()
    
    let (a,b,c) = (input[0], input[1], input[2])
    
    if a*a + b*b == c*c {
        print("right")
    } else {
        print("wrong")
    }
}
