let input = Int(readLine()!)!

if input >= 1 {
    var result = 0
    var divisor = 5
    
    while input / divisor > 0 {
        result += input / divisor
        divisor *= 5
    }
    
    print(result)
} else if input == 0 {
    print(0)
}
