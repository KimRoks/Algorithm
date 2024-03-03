while let input = readLine() {
    let xy = input.split(separator: " ").map{Int($0)!}
    let (x,y) = (xy[0],xy[1])
    
    print(x + y)
}
