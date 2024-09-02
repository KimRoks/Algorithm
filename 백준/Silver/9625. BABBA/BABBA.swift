let k = Int(readLine()!)!

var aCount = 1
var bCount = 0

for _ in 1...k {
    let newACount = bCount
    let newBCount = aCount + bCount
    
    aCount = newACount
    bCount = newBCount
}

print(aCount, bCount)
