let n = Int(readLine()!)!
let m = Int(readLine()!)!

let stringN = String(n)
let stringM = String(m)

for i in (0..<stringN.count).reversed() {
    
    let endIndex = stringM.startIndex
    let offset = stringM[stringM.index(endIndex, offsetBy: i)]
    
    print(n * Int(String(offset))!)
}

print(n * m)

