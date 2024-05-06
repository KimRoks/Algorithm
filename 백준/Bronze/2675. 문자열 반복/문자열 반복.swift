let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    var result = [Character]()
    let RS = readLine()!.split(separator: " ")
    let (R,S) = (Int(RS[0])!,String(RS[1]))
    
    for char in S {
        for _ in 0..<R {
            result.append(char)
        }
    }
    print(String(result))
}
