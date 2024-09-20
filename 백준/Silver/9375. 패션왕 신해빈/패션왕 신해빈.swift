import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let itemCount = Int(readLine()!)!
    var clothes = [String: Int]()
    
    for _ in 0..<itemCount {
        let input = readLine()!.split(separator: " ").map { String($0) }
        let category = input[1]
        
        if let count = clothes[category] {
            clothes[category] = count + 1
        } else {
            clothes[category] = 1
        }
    }
    
    var result = 1
    for (_, count) in clothes {
        result *= (count + 1)
    }
    
    result -= 1
    
    print(result)
}
