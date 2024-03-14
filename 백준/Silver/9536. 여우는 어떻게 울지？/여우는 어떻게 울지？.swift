let input = Int(readLine()!)!

for _ in 0..<input{
    
    let cry = readLine()!.split(separator: " ").map{ String($0) }
    var fox = cry
    
    while let line = readLine(), line != "what does the fox say?" {
        let abc = line.split(separator: " ").map{ String($0) }
        let c = abc[2]
        
        fox.removeAll { $0 == c }
    }
    
    print(fox.joined(separator: " "))
}



