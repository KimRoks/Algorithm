let number = Int(readLine()!)!

for i in 1...number{
    let spacer = [Character](repeating: " ", count: number-i)
    let char = [Character](repeating: "*", count: i)
    
    print(String(spacer+char))
}
